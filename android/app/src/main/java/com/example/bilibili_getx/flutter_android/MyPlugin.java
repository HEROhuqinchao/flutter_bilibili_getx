package com.example.bilibili_getx.flutter_android;

import androidx.annotation.NonNull;

import com.github.mikephil.charting.data.Entry;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

public class MyPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private MethodChannel methodChannel;
    private MyFlutterViewFactory myFlutterViewFactory;
    String chartChannel = "chart_channel";


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        methodChannel = new MethodChannel(binding.getBinaryMessenger(), chartChannel);
        methodChannel.setMethodCallHandler(this);
        myFlutterViewFactory = new MyFlutterViewFactory(StandardMessageCodec.INSTANCE, methodChannel);
        binding.getPlatformViewRegistry().registerViewFactory("flutter_android_view", myFlutterViewFactory);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        methodChannel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        try {
            JSONObject root = new JSONObject(call.method);
            JSONArray data = root.getJSONArray("data");
            String lineName = root.getString("msg");
            ArrayList<Entry> chartValues = new ArrayList<>();
            for (int i = 0; i < data.length(); i++) {
                JSONObject jsonObject = data.getJSONObject(i);
                chartValues.add(new Entry((float) jsonObject.getDouble("x"), (float) jsonObject.getDouble("y")));
            }
            myFlutterViewFactory.flutterView.updateData(chartValues, lineName);
            result.success(call.method);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
