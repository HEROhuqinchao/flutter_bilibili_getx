package com.example.bilibili_getx;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;

import com.baidu.mapapi.base.BmfMapApplication;

//百度地图
public class MyApplication extends BmfMapApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel("message", "Message", NotificationManager.IMPORTANCE_LOW);
            NotificationManager manager = getSystemService(NotificationManager.class);
            manager.createNotificationChannel(channel);
        }
    }
}
