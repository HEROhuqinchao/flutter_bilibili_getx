package com.example.bilibili_getx;

import android.database.Cursor;
import android.os.Bundle;
import android.provider.MediaStore;

import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String uploadChannel = "upload_channel";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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

                //如果时长为空，就舍弃这个视频
                if (duration == null) {
                    continue;
                }

                HashMap<String, Object> bodyData = new HashMap<>();

                bodyData.put("videoName", videoName);
                bodyData.put("videoLocation", videoLocation);
                bodyData.put("duration", duration);

    //            Log.i("MainActivity", "videoName:" + videoName);
    //            Log.i("MainActivity", "videoLocation:" + videoLocation);
    //            Log.i("MainActivity", "duration:" + duration);

                arguments.put(count, bodyData);

                count++;
                if (count > 11) break;
            }
        }
        return arguments;
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
}
