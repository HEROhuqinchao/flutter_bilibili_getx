# Flutter Framework学习笔记

[TOC]

## 前提摘要
文档用于记录学习Flutter framework的笔记，目前学习的视频资料都来源于b站，一个字，学！

- [视频资料1](https://www.bilibili.com/video/BV1Wb411Q7gV?p=2&spm_id_from=pageDriver&vd_source=9577d8766a1c3a48233a9f8f750633c4)
- [视频资料2](https://www.bilibili.com/video/BV1Pa411D7Qc/?p=3&spm_id_from=pageDriver&vd_source=9577d8766a1c3a48233a9f8f750633c4)
- Android framework 对比 flutter framework
- 数据结构
- 系统设计
- 图像处理引擎

如何实现跨平台（类似于Flutter，有混合式页面）
- UI显示机制（事件机制）
- UI事件机制（人机交互）
- 跨平台需要实现UI系统

## 图像处理引擎
- Android原生 
```java
public androidImage(Context context) {
    super(context);
    Bitmap bitmap = Bitmap.createBitmap();
}
```
```java
@Override
protected void onDraw(Canvas canvas) {
    super.onDraw(canvas);
    canvas.drawArc();
}
```
- 查找createBitmap
```java
public static Bitmap createBitmap(@Nullable DisplayMetrics display, int width, int height,
            @NonNull Config config, boolean hasAlpha, @NonNull ColorSpace colorSpace) {
        ...
        Bitmap bm = nativeCreate(null, 0, width, width, height, config.nativeInt, true,
                colorSpace == null ? 0 : colorSpace.getNativeInstance());

        ...
    }
```
- 图片内存 -> nativeCreate -> Android Framework 12 ->Bitmap.cpp
```cpp
static const JNINativeMethod gBitmapMethods[] = {
    {   "nativeCreate",             "([IIIIIIZJ)Landroid/graphics/Bitmap;",
        (void*)Bitmap_creator },
   ...
};
```
- 声明SkBitmap bitmap 并分配内存(Make)
```cpp
static jobject Bitmap_creator(JNIEnv* env, jobject, jintArray jColors,jint offset, jint stride, jint width, jint height,jint configHandle, jboolean isMutable,jlong colorSpacePtr) {
	...
    SkBitmap bitmap;
    bitmap.setInfo(SkImageInfo::Make(width, height, colorType, kPremul_SkAlphaType,
                colorSpace));

    ...
}
```
## 结论
- 无论是Bitmap还是canvas都会调用Skia引擎
- Android原生绘制流程：setContentView->layoutId->inflate->xml dom解析->反射->TextView->canvas->skia

## FlutterView和FlutterSurfaceView
- MainActivivty->FlutterActivity->onCreate()->FlutterSurfaceView->嵌套在FlutterView

## Flutter绘制
- FlutterView（接受事件控件）
- 绘制控件（Flutter SurfaceView）
- Skia跨平台绘制库->dart API经过Skia->flutter跨平台
- view->viewGroup
## Flutter三棵树
- widget树
- Element树（绘制，只包含build）
- RenderObject树（若Element需要显示，则临时生成一个RenderObject）
## 绘制界面思路
任意容器-...->MultiChildRenderObjectWidget->WidgetsBinding.drawFrame->super.drawFrame();
```dart
  @protected
  void drawFrame() {
    ...
    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();
    ...
  }
```
- 摆放
- 测量
- 绘制
**源码**
flushLayout() -> performLayout()
flushPaint()->Skia引擎绘制（canvas...)

## 实现Flutter
- FlutterSurfaceView extends SurfaceView
```java
import android.content.Context;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
public class FlutterSurfaceView extends SurfaceView {
    private SurfaceHolder mHolder;
    public FlutterSurfaceView(Context context) {
        super(context);
    }
    public FlutterSurfaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }
    public FlutterSurfaceView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }
}
```
- 监听

## flutter 生命周期
```dart
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveCycleWidget(),
    );
  }
}

class LiveCycleWidget extends StatefulWidget {
  const LiveCycleWidget({Key? key}) : super(key: key);

  @override
  State<LiveCycleWidget> createState() => _LiveCycleWidgetState();
}

class _LiveCycleWidgetState extends State<LiveCycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.detached:
        print('AppLifecycleState.detached');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return ChildrenWidget();
              },
            ),
          );
        },
      ),
    );
  }
}

class ChildrenWidget extends StatefulWidget {
  const ChildrenWidget({Key? key}) : super(key: key);

  @override
  State<ChildrenWidget> createState() => _ChildrenWidgetState();
}

class _ChildrenWidgetState extends State<ChildrenWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.detached:
        print('AppLifecycleState.detached');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "data",
            style: TextStyle(color: HYAppTheme.norMainThemeColors),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
      ),
    );
  }
}
```