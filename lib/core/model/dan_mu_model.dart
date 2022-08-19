class HYDanMuModel {
  String _title;
  int _sendTime;

  HYDanMuModel(this._title, this._sendTime);

  int get sendTime => _sendTime;

  set sendTime(int value) {
    _sendTime = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}