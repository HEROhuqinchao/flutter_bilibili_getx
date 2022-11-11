# bilibili_getx

**沉淀知识**

尽量还是不要停留在做界面的阶段，多了解一些还是有好处的

|             能力              |                            完成度                            |           计划            |
| :---------------------------: | :----------------------------------------------------------: | :-----------------------: |
| 对接接口（get请求、post请求） |                        json、protobuf                        | 实现更多类型的数据（xml） |
| 项目目录结构清晰，模块化清晰  |                          UI 和 CORE                          |      功能封装原子性       |
|           人机交互            | 动画组件（flare、rive、lottie）、UI设计更加美观，更加人性化  |                           |
|            多平台             |                     目前只是Android熟悉                      |       PC、IOS、Web        |
|           消息通知            | 极光推送（对接华为厂商通道）参考 [在Flutter中使用极光推送集成华为通道踩坑 - aquilahkj - 博客园 (cnblogs.com)](https://www.cnblogs.com/aquilahkj/p/15005775.html)  [(55条消息) flutter 极光推送 华为 厂商通道_qq_614149475的博客-CSDN博客](https://blog.csdn.net/qq_51633443/article/details/124044443?spm=1001.2101.3001.6650.7&utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~Rate-7-124044443-blog-118027993.pc_relevant_recovery_v2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~Rate-7-124044443-blog-118027993.pc_relevant_recovery_v2&utm_relevant_index=10) |      对接其他厂商的       |
|           切换语言            |                          GETX-I18N                           |                           |
|             视频              |                  MP4格式、流媒体FLV（直播）                  |                           |
|             音频              |                             欠缺                             |       后台播放音频        |
|             下载              |                        存储目录的获取                        |                           |
|             蓝牙              | flutter_blue，只能扫到一些没名称的，扫不到手机的蓝牙，需要pin的蓝牙 |                           |
|         动画Animation         |                                                              |                           |
|          弹框Dialog           |                         SmartDialog                          |                           |
|           分页加载            |                           基本都有                           |                           |
|      微信分享、微信支付       |                          未申请成功                          |                           |
|            QQ分享             |                            已实现                            |                           |
|          支付宝支付           |                             欠缺                             |                           |
|       与Android原生通信       |                        MethodChannel                         |                           |
|           统计图表            |                         flchart插件                          |                           |
|           状态管理            |                     GETX、Provider（差）                     |      BLOC、GETX原理       |
|     canvas画布及Paint画板     |                              差                              |                           |
|   条形码、二维码生成与扫描    |                                                              |                           |
|        数据持久化存储         |               sharedPreference、SqliteDatabase               |                           |
|           网络请求            |                           Dio插件                            |                           |
|           路由管理            |                    根据状态管理不同而不同                    |                           |
|             上传              |                             欠缺                             |                           |
|            甘特图             | [如何用Excel快速制作甘特图？（超详细！） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/271043355) |                           |
|                               |                                                              |                           |
|                               |                                                              |                           |
|                               |                                                              |                           |

采用getx框架重新构造项目

**10月27日**
flare动画
一些好看的rive动画
switch https://rive.app/community/2726-5857-switch-demo/
爱心按钮、通知按钮 https://rive.app/community/3189-6916-animated-icon-pack/
进度条 https://rive.app/community/3264-6879-tree-loading-bar/

点击视频左上角的三点更多按钮，有视频下载功能


**9月22日**

不更新不行啦，虽然代码一直在更新，但还得做些视频哈哈，否则对不起我这60个粉丝哈哈

这次距离上次更新快三个星期了，不咕不咕

主要更新了

1直播房间的获取，内容还没有

2nestedscrollview嵌套tabview，内容缓存

3语言切换

当然有些效果我做不到，我后面看看能不能改改吧（比如这个子tab，因为nestedscrollview里面不能有controller，否则与顶部内容就无法联动）

4最主要是这个视频界面，之前我采用的是chewie这个组件，但是很多功能，还是自己做的比较好，所以我把那部分的内容全部去掉了，目前就用video_player，重新把视频这块内容重做了一遍。

5还有弹幕这块，之前也是做了一版，但是很卡，原因是我是模拟发弹幕的过程，每条弹幕都有一个controller，这样的话，卡的不行。所有弹幕这块我重做了，这次就六条轨道，使用singlechildscrollerview来控制滑动至底部，这样就只需要绘制横向的列表，而且还能与视频播放暂停快进联动起来。

但是顶部弹幕和底部弹幕目前还没有做，之前那一版是有的，之后再添加上去。

视频内容的接口，目前无法用了，之前的方法获取原视频是可以用的，但后来就不太行了，都是403了已经，不知道是不是我的方法有问题

6会员购界面顶部滚动监听改了下，是不是不那么卡了，getX的update() 能少用就少用，特别是监听这种，关键的地方update()一下就可以啦

有些接口，模拟器上抓来的基本是grpc的，这个问题我一直就解决不了，即便是有proto，也知道传的参数和数值，但是就是返回为null，所有我就不太想搞了。比如动态界面等等，拿不到数据就没办法进行下去。json的就好弄

之后的话，原来那版是有直播界面的，我还没有用getX搬过来，还有就是发布视频的那块，是要与原生建立通信的，目前也没搬过来。竖屏的视频，视频内的上侧的工具栏

ok，差不多是这样的啦



**9月11日**

【我宁可痛苦，也不要麻木】[20年前的农村女性，竟狠狠 戳中了我的心_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1KP41157tb?spm_id_from=333.337.search-card.all.click&vd_source=9577d8766a1c3a48233a9f8f750633c4)



**9月4日更新**

昨天写了下会员购这一块
先看一下效果
头部是下拉会展开，上滑会收缩的效果
再是下面的的轮播图，水平滑动的列表
最后一部分是瀑布流的布局
整体效果看起来是这样的
感觉还是有些卡顿的

用这个getX来管理，先去安装一个插件GETX
new一个GET，会生成下面的四个文件，state用来放共享的变量、bindind可以懒加载这个界面，也可以说是注册，logic放逻辑性的操作，比如上下滑动，更改某些控件的属性，view就是界面部分

获取b站的数据，先去打开一个模拟器，打开抓包的工具，设置代理。获取到json的数据之后，看下那些数据是需要改动的，做好之后，做网络请求，一般来说可以用postman来测试接口

处理完之后就在urlMap和request那里把网络请求的方法给写上
在logic里面的onReady或onInit生命周期中写上，销毁则在onCancel。区别见GetX状态管理之 GetxController 生命周期详解[GetX状态管理之 GetxController 生命周期详解 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/445371503#:~:text=其实就是将 onReady 方法作为回调，当 onInit 完成之后的一帧来调用 onInit,。 这也就是我们上一篇说的， onReady 会在 onInit 完成后一帧后调用。)

整体的结构要清晰一些

整个项目结构，asset，就是存放一些静态的数据（图片、网页、json数据）等，flutter主目录的分为core和ui主目录。I18n为国际化，model为所有用到的模型，这个notifier是视频播放那块，之前用的还是provider。下面是这个proto，主要是用在视频弹幕，service为网络请求，有个比较重要的cors.dart，是本地代理。sharedpreference就是数据的持久化存储。

ui就是放的是界面和共用的widget，shared为共享的函数。入口main.dart。

整个目录还有Android、Windows、Web。涉及原生。

既然是个跨平台，那么在同一个界面，在不同的平台，就能显示不同的界面。而在同一个平台，不同机型、不同的屏幕大小，要屏幕适配。不同平台要功能适配。Platform，kIsweb

pubspec.yaml里面写依赖的插件

推荐一些网站

[Instantly parse JSON in any language | quicktype](https://app.quicktype.io/) 转换为model

[Dart packages (flutter-io.cn)](https://pub.flutter-io.cn/) 搜索插件

开发软件Android Studio或VSCode

抓包工具Claris 或者 Fiddler

分析接口postman

分析grpc（BloomRPC或者postman）

还有请求数据一些细节的地方看这个[bilibili-API-collect/dynamic.md at master · SocialSisterYi/bilibili-API-collect · GitHub](https://github.com/SocialSisterYi/bilibili-API-collect) 比如参数的sign是怎么来的，appkey，appkeyhash，这里都有提到。还有proto文件，找一下