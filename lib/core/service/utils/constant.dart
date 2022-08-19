class Constant {
  ///手机端和桌面端
  /**
   * live:直播界面
   * base:网页端（待改）
   * video:视频（获取原视频地址）
   * app:app端的接口
   * search:搜索用到的接口
   * login:登录时需要用到的接口
   */
  static const Map<String, String> urlMap = {
    "live": "https://api.live.bilibili.com",
    "base": "http://api.bilibili.com",
    "video": "https://m.bilibili.com",
    "app": "http://app.bilibili.com",
    "search": "http://s.search.bilibili.com",
    "login": "https://passport.bilibili.com",
    "mall": "https://mall.bilibili.com"
  };

  ///网页端设置代理,处理跨域问题
  static const Map<String, String> urlWebMap = {
    "live": "http://127.0.0.1:8001",
    "base": "http://127.0.0.1:8002",
    "video": "http://127.0.0.1:8003",
  };

  ///是否为debug模式
  static const bool isDebug = true;

  ///app key
  static const String appKey = '1d8b6e7d45233436';

  ///app key对应的hash值
  static const String appSec = '560c52ccd288fed045859ed18bffd973';

  ///极光推送AppKey
  static const String jPushAppKey = "70eddda66db85cc65c0ba7f2";
}
