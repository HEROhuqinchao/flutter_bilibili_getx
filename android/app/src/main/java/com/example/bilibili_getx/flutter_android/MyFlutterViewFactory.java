package com.example.bilibili_getx.flutter_android;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MyFlutterViewFactory extends PlatformViewFactory {
    public MyFlutterView myFlutterView;

    /**
     * @param createArgsCodec the codec used to decode the args parameter of {@link #create}.
     */
    public MyFlutterViewFactory(@Nullable MessageCodec<Object> createArgsCodec) {
        super(createArgsCodec);
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        myFlutterView = new MyFlutterView(context);
        return myFlutterView;
    }
}
