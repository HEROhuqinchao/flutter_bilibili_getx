package com.example.bilibili_getx;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.PluginRegistry;

public class MyPlugin implements FlutterPlugin {

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        BinaryMessenger messenger = binding.getBinaryMessenger();
        binding.getPlatformViewRegistry().registerViewFactory("history_chart_view", new MyFlutterViewFactory());
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        registrar.platformViewRegistry().registerViewFactory("history_chart_view", new MyFlutterViewFactory());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

    }
}
