///保留小数点后position位
String formatNum(double num, int position) {
  return num.toStringAsFixed(position).toString();
}

///数字转为万为单位
String changeToWan(int num) {
  return num.toDouble() > 10000
      ? formatNum(num.toDouble() / 10000, 1) + "万"
      : formatNum(num.toDouble(), 0);
}

///从1970年1月1日开始，已知过了过长时间，
DateTime getPubData(int duration) {
  var startDate = DateTime(1970, 1, 1, 0, 0, 0);
  DateTime endData = startDate.add(Duration(seconds: duration.toInt()));
  // var endDataText = endData.toString();
  return endData;
}

///秒转为标准时间格式
String changeToDurationText(double duration) {
  if (duration > 60) {
    if (duration > 3600) {
      var hours = duration ~/ 3600;
      var minutes = (duration - hours * 3600) ~/ 60;
      var seconds = (duration - hours * 3600 - minutes * 60).toInt();
      return hours.toString() +
          minutes.toString().padLeft(2, '0') +
          seconds.toString().padLeft(2, '0');
    } else {
      var minutes = duration ~/ 60;
      var seconds = (duration - minutes * 60).toInt();
      return minutes.toString() + ":" + seconds.toString().padLeft(2, '0');
    }
  } else {
    return "0:" + duration.toInt().toString().padLeft(2, '0');
  }
}

int getListMin(List<double> list) {
  if (list.isEmpty) return 0;
  double minNum = list[0];
  int minNumIndex = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] < minNum) {
      minNum = list[i];
      minNumIndex = i;
    }
  }
  return minNumIndex;
}

///不超过n个字的string
String noMoreN(String text, int n) {
  return text.length > n ? "${text.substring(0, n)}..." : text;
}