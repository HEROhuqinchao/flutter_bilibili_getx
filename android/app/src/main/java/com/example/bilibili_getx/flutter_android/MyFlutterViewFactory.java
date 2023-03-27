package com.example.bilibili_getx.flutter_android;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MyFlutterViewFactory extends PlatformViewFactory {

    public  FlutterView flutterView;
    private MethodChannel myMethodChannel;

    public MyFlutterViewFactory(@Nullable MessageCodec<Object> createArgsCodec, MethodChannel methodChannel) {
        super(createArgsCodec);
        myMethodChannel = methodChannel;
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        flutterView = new FlutterView(context);
        return flutterView;
    }
}
