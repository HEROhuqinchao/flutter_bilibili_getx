package com.example.bilibili_getx.flutter_android;

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.bilibili_getx.R;
import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.components.Description;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.LimitLine;
import com.github.mikephil.charting.components.MarkerView;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.formatter.IAxisValueFormatter;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.utils.MPPointF;

import org.w3c.dom.Text;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.platform.PlatformView;

public class FlutterView extends AppCompatActivity implements PlatformView {
    private LineChart chart;
    private LinearLayout linearLayout;
    private MyMarkerView markerView;

    FlutterView(Context context) {
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
        description.setText("笙");
        description.setTextColor(Color.GRAY);
        chart.setDescription(description);

        markerView = new MyMarkerView(context);


        ///初始化空数据
        LineData lineData = new LineData();
        chart.setData(lineData);

        linearLayout.addView(chart);
    }

    public void updateData(ArrayList<Entry> chartValues, String lineName) {
        LineData lineData = chart.getLineData();
        LineDataSet lineDataSetA = new LineDataSet(chartValues, lineName);
        lineDataSetA.setDrawIcons(false);
        lineDataSetA.setColor(Color.BLACK);
        lineDataSetA.setCircleColor(Color.rgb(140, 198, 249));
        lineDataSetA.setLineWidth(1f);
        lineDataSetA.setCircleRadius(1f);
        lineDataSetA.setDrawCircleHole(false);
        lineDataSetA.setFormLineWidth(1f);
        lineDataSetA.setFormSize(15.f);
        lineDataSetA.setValueTextSize(9f);
        lineDataSetA.setDrawFilled(true);
        lineDataSetA.setMode(LineDataSet.Mode.CUBIC_BEZIER);///圆滑

        lineData.clearValues();
        lineData.addDataSet(lineDataSetA);

        YAxis yLeftAxis = chart.getAxisLeft();
        yLeftAxis.enableGridDashedLine(10f, 10f, 0f);
        yLeftAxis.setAxisMinimum(0f);

        ///显示数据框
        markerView.setChartView(chart);
        chart.setMarker(markerView);

        ///坐标轴
        XAxis xAxis;
        xAxis = chart.getXAxis();
        xAxis.setEnabled(false);
        xAxis.enableGridDashedLine(10f, 10f, 0f);

        lineData.notifyDataChanged();
        chart.notifyDataSetChanged();
        chart.invalidate();
    }

    @Override
    public View getView() {
        return linearLayout;
    }

    @Override
    public void dispose() {

    }

    ///提示框
    public static class MyMarkerView extends MarkerView {
        private final TextView tvContent;
        private final DecimalFormat format = new DecimalFormat("##0");

        public MyMarkerView(Context context) {
            super(context, R.layout.layout_for_custom_marker_view);
            tvContent = (TextView) findViewById(R.id.tvContent);
        }

        @Override
        public void refreshContent(Entry e, Highlight highlight) {
            String text = e.getX() + "\n" + e.getData() + "：" + format.format(e.getY());
            tvContent.setText(text);
            super.refreshContent(e, highlight);
        }

        @Override
        public MPPointF getOffset() {
            return new MPPointF(-(getWidth() / 2), -getHeight() - 50);
        }
    }
}