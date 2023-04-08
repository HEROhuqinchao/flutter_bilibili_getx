package com.example.bilibili_getx.flutter_android;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;

public class androidImage extends View {

    public androidImage(Context context) {
        super(context);
        Bitmap bitmap = Bitmap.createBitmap();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawArc();
    }
}
