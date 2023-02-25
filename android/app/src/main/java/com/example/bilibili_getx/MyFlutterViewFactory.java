package com.example.bilibili_getx;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MyFlutterViewFactory extends PlatformViewFactory {

    public MyFlutterViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        return new HistoryChartView(context);
    }
}
