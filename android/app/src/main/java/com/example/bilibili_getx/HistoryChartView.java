package com.example.bilibili_getx;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class HistoryChartView extends AppCompatActivity implements PlatformView {
    private TextView textView;

    HistoryChartView(Context context) {
        textView = new TextView(context);
        textView.setText("我是Android View");
    }

    @Override
    public View getView() {
        return textView;
    }

    ///销毁控件

    @Override
    public void dispose() {
    }
}
