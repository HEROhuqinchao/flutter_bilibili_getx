package com.example.bilibili_getx;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.MediaStore;
import android.provider.Settings;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.example.bilibili_getx.flutter_android.MyPlugin;

import java.io.File;
import java.util.HashMap;
import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.JSONMessageCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String uploadChannel = "upload_channel";
    //参考 https://blog.csdn.net/qq_38373150/article/details/103677504
    private static final String stayAliveChannel = "stay_alive_channel";

    private Intent serviceIntent;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bitmap bitmap;
        ///打开本地的视频数据和图片数据
        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), uploadChannel).setMethodCallHandler(
                (methodCall, result) -> {
                    switch (methodCall.method) {
                        case "getPhotos":
                        case "getFiles":
                            result.success(getPhotos());
                            break;
                        case "getVideos":
                            result.success(getVideos());
                            break;
                        default:
                            result.notImplemented();
                            break;
                    }
                }
        );
        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), stayAliveChannel).setMethodCallHandler(
                (methodCall, result) -> {
                    switch (methodCall.method) {
                        case "battery_optimization":
                            result.success(requestIgnoreBatteryOptimizations());
                            break;
                        case "setting_optimization":
                            result.success(settingPermission());
                            break;
                        default:
                            result.notImplemented();
                            break;
                    }
                }
        );
        //创建一个服务
        serviceIntent = new Intent(MainActivity.this, MyService.class);
        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), "start_service_channel").setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                        if (call.method.equals("startService")) {
                            startService();
                        }
                    }
                }
        );
        //注册百度语音识别
//        AsrPlugin.registerWith(registerFor("com.example.asr_plugin.AsrPlugin"));
    }

    //获取本地视频集合
    private HashMap<Integer, HashMap<String, Object>> getVideos() {
        int count = 0;
        HashMap<Integer, HashMap<String, Object>> arguments = new HashMap<>();

        String sortOrder = MediaStore.Video.Media.DATE_ADDED + " DESC";

        try (Cursor cursor = getContentResolver().query(MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                null, null, null, sortOrder)) {
            while (cursor.moveToNext()) {
                int nameIndex = cursor.getColumnIndex(MediaStore.Video.Media.DISPLAY_NAME);
                int pathIndex = cursor.getColumnIndex(MediaStore.Video.Thumbnails.DATA);
                int durationIndex = cursor.getColumnIndex(MediaStore.Video.Media.DURATION);
                String videoName = cursor.getString(nameIndex);
                String videoLocation = cursor.getString(pathIndex);
                String duration = cursor.getString(durationIndex);

                //如果时长为空或者视频不存在，就舍弃这个视频
                if (duration == null || !fileIsExists(videoLocation)) {
                    continue;
                }

                HashMap<String, Object> bodyData = new HashMap<>();

                bodyData.put("videoName", videoName);
                bodyData.put("videoLocation", videoLocation);
                bodyData.put("duration", duration);

//                Log.i("MainActivity", "videoName:" + videoName);
//                Log.i("MainActivity", "videoLocation:" + videoLocation);
//                Log.i("MainActivity", "duration:" + duration);

                arguments.put(count, bodyData);

                count++;
                if (count > 11) break;
            }
        }
        return arguments;
    }

    public boolean fileIsExists(String strFile) {
        try {
            File file = new File(strFile);
            if (!file.exists()) {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    //获取本地图片集合
    private HashMap<Integer, HashMap<String, Object>> getPhotos() {
        int count = 0;
        HashMap<Integer, HashMap<String, Object>> arguments = new HashMap<>();

        String sortOrder = MediaStore.Images.Media.DATE_ADDED + " DESC";

        try (Cursor cursor = getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                null, null, null, sortOrder)) {
            while (cursor.moveToNext()) {
                int nameIndex = cursor.getColumnIndex(MediaStore.Images.Media.DISPLAY_NAME);
                int pathIndex = cursor.getColumnIndex(MediaStore.Images.Media.DATA);
                //获取图片的名称
                String name = cursor.getString(nameIndex);
                //            Log.d("MainActivity: ", "initImages: " + "imageName: " + name);

                //获取图片的路径
                byte[] data = cursor.getBlob(pathIndex);
                String location = new String(data, 0, data.length - 1);
                //            Log.d("MainActivity: ", "initImages: " + "imageLocation: " + location);
                //根据路径获取图片
                //            Bitmap bm = getImgFromDesc(location);

                HashMap<String, Object> bodyData = new HashMap<>();

                bodyData.put("imageName", name);
                bodyData.put("imageLocation", location);

                arguments.put(count, bodyData);

                count++;
                if (count > 11) break;
            }
        }
        return arguments;
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private boolean isIgnoringBatteryOptimizations() {
        boolean isIgnoring = false;
        PowerManager powerManager = (PowerManager) getSystemService(Context.POWER_SERVICE);
        if (powerManager != null) {
            isIgnoring = powerManager.isIgnoringBatteryOptimizations(getPackageName());
        }
        return isIgnoring;
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public boolean requestIgnoreBatteryOptimizations() {
        if (!isIgnoringBatteryOptimizations()) {
            try {
                Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
                intent.setData(Uri.parse("package:" + getPackageName()));
                startActivity(intent);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    private boolean settingPermission() {
        Intent intent = new Intent(Settings.ACTION_MANAGE_APPLICATIONS_SETTINGS);
        startActivity(intent);
        return true;
    }

    private void startService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(serviceIntent);
        } else {
            startService(serviceIntent);
        }
    }

    //使用HistoryChartView
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        //MethodChannel
        flutterEngine.getPlugins().add(new MyPlugin());
        //BasicMessageChannel
        BasicMessageChannel basicMessageChannel = new BasicMessageChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "basic_message_001", JSONMessageCodec.INSTANCE);
        basicMessageChannel.setMessageHandler((message, reply) -> {
            reply.reply("Reply from Android");
        });
    }
}
