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
    private LineChart chart;
    private LinearLayout linearLayout;
    private MyMarkerView markerView;

    HistoryChartView(Context context) {
        linearLayout = new LinearLayout(context);
        chart = new LineChart(context);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        layoutParams.gravity = Gravity.CENTER_HORIZONTAL;
        linearLayout.setLayoutParams(layoutParams);
        chart.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        ///触摸
        chart.setTouchEnabled(true);
        chart.setDrawGridBackground(false);
        ///拖动
        chart.setDragEnabled(true);
        ///两个轴上的缩放
        chart.setScaleEnabled(true);
        ///X轴缩放
        chart.setScaleXEnabled(true);
        ///Y轴缩放
        chart.setScaleYEnabled(true);
        ///同时缩放
        chart.setPinchZoom(true);
        ///小于多少时显示数字
        chart.setMaxVisibleValueCount(100);
        ///双击缩放
        chart.setDoubleTapToZoomEnabled(true);
        ///抬起手指，继续滑动
        chart.setDragDecelerationEnabled(true);
        ///摩擦系数,[0-1]，较大值速度会缓慢下降，0，立即停止;1,无效值，并转换为0.9999.默认0.9f
        chart.setDragDecelerationFrictionCoef(0.9f);
        ///边界
        chart.setDrawBorders(true);
        chart.animateX(1500);
        ///图标
        Legend legend = chart.getLegend();
        legend.setForm(Legend.LegendForm.LINE);
        legend.setHorizontalAlignment(Legend.LegendHorizontalAlignment.CENTER);
        legend.setOrientation(Legend.LegendOrientation.HORIZONTAL);
        legend.setWordWrapEnabled(true);
        ///描述
        Description description = new Description();
        description.setEnabled(true);
        description.setText("笙下笙");
        description.setTextColor(Color.GRAY);
        chart.setDescription(description);
        markerView = new MyMarkerView(context);
        ///初始化空数据
        LineData lineData = new LineData();
        chart.setData(lineData);
        linearLayout.addView(chart);
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
