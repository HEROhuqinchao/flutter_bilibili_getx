package com.example.bilibili_getx.flutter_android;

import androidx.annotation.NonNull;

import com.github.mikephil.charting.data.Entry;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Objects;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

public class MyPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private MethodChannel methodChannel;
    private MyFlutterViewFactory myFlutterViewFactory;
    //通道名称
    String chartChannel = "chart_channel";
    //原生界面名称
    String flutterAndroidView = "flutter_android_view";

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        //注册通道
        methodChannel = new MethodChannel(binding.getBinaryMessenger(), chartChannel);
        methodChannel.setMethodCallHandler(this);
        //注册原生界面
        myFlutterViewFactory = new MyFlutterViewFactory(StandardMessageCodec.INSTANCE);
        binding.getPlatformViewRegistry().registerViewFactory(flutterAndroidView, myFlutterViewFactory);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        //关闭
        methodChannel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        //flutter会传递信息至此
        if(Objects.equals(call.method, "chartData")) {
            try {
                JSONObject root = new JSONObject((String) call.arguments);
                JSONArray data = root.getJSONArray("data");
                String lineName = root.getString("msg");
                ArrayList<Entry> chartValues = new ArrayList<>();
                for (int i = 0; i < data.length(); i++) {
                    JSONObject jsonObject = data.getJSONObject(i);
                    chartValues.add(new Entry((float) jsonObject.getDouble("x"), (float) jsonObject.getDouble("y")));
                }
                myFlutterViewFactory.myFlutterView.updateData(chartValues, lineName);
                result.success(call.method + "调用成功");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else {
            result.success(call.method + "未找到该方法");
        }

    }
}
