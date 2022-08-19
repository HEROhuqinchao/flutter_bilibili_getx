///proto
///新版本model
class DanMuModel02 {
  DanMuModel02(
      {required this.id,
      required this.progress,
      required this.mode,
      required this.fontsize,
      required this.color,
      required this.midHash,
      required this.content,
      required this.ctime,
      required this.weight,
      required this.action,
      required this.pool,
      required this.idStr,
      required this.attr});

  /// 弹幕dmid
  int id;

  /// 弹幕出现位置(单位ms)
  int progress;

  /// 弹幕类型
  int mode;

  /// 弹幕字号
  double fontsize;

  /// 弹幕颜色
  int color;

  /// 发送着mid hash
  String midHash;

  /// 弹幕正文
  String content;

  /// 发送时间
  int ctime;

  /// 权重 区间:[1,10]
  int weight;

  /// 动作
  String action;

  /// 弹幕池
  int pool;

  /// 弹幕dmid str
  String idStr;

  /// 弹幕属性位(bin求AND)
  /// bit0:保护 bit1:直播 bit2:高赞
  int attr;
}
