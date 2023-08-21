///生产发送数据的简单工厂
class BaseSendDataModel {
  late List<String> users; //接受者列表
  late String sender; //发送者
  late int date; //日期时间戳
  late String avatar;

  BaseSendDataModel({
    required this.users,
    required this.sender,
    required this.date,
    required this.avatar,
  }); //头像
}

abstract class SendDataModel {
  late BaseSendDataModel baseSendDataModel;

  String buildString(); //生成数据文本格式
}

///发送数据类型
enum SendDataType {
  text,
  video,
  audio,
  photo,
}

///文本类型数据
class TextData implements SendDataModel {
  late String msg;
  late String dataStr;

  TextData({
    required this.msg,
    required this.baseSendDataModel,
  });

  @override
  String buildString() {
    int length = baseSendDataModel.users.toString().length;
    String users = baseSendDataModel.users.toString().substring(1, length - 1);
    String dataStr = "{\"users\": [\"$users\"],"
        "\"msg\": \"$msg\","
        "\"date\": \"${baseSendDataModel.date}\","
        "\"avatar\": \"${baseSendDataModel.avatar}\","
        "\"sender\": \"${baseSendDataModel.sender}\"}";
    return dataStr;
  }

  @override
  BaseSendDataModel baseSendDataModel;
}

///图片数据
class PhotoData implements SendDataModel {
  late String photoFilePath;

  PhotoData({
    required this.photoFilePath,
    required this.baseSendDataModel,
  });

  @override
  String buildString() {
    int length = baseSendDataModel.users.length;
    String users = baseSendDataModel.users.toString().substring(1, length - 1);
    String dataStr = "{\"users\": [\"$users\"],"
        "\"msg\": \"$photoFilePath\","
        // "\"msg\": \"${MultipartFile.fromFileSync(photoFilePath)}\","
        "\"date\": \"${baseSendDataModel.date}\","
        "\"avatar\": \"${baseSendDataModel.avatar}\","
        "\"sender\": \"${baseSendDataModel.sender}\"}";
    return dataStr;
  }

  @override
  BaseSendDataModel baseSendDataModel;
}

///简单工厂类
class SendDataFactory {
  static SendDataModel createSendData({
    required SendDataType sendDataType,
    required BaseSendDataModel baseSendDataModel,
    String? msg,
    String? photoFilePath,
  }) {
    if (sendDataType == SendDataType.text) {
      return TextData(
        msg: msg!,
        baseSendDataModel: baseSendDataModel,
      );
    } else if (sendDataType == SendDataType.photo) {
      return PhotoData(
        photoFilePath: photoFilePath!,
        baseSendDataModel: baseSendDataModel,
      );
    } else {
      throw Exception();
    }
  }
}

// main() {
//   BaseSendDataModel baseSendDataModel = BaseSendDataModel(
//     users: ["2", "3"],
//     sender: '4',
//     date: 5,
//     avatar: '6',
//   );
//   SendDataModel sendTextData = SendDataFactory.createSendData(
//       sendDataType: SendDataType.text,
//       baseSendDataModel: baseSendDataModel,
//       msg: "我发送了文本消息");
//   SendDataModel sendPhotoData = SendDataFactory.createSendData(
//       sendDataType: SendDataType.photo,
//       baseSendDataModel: baseSendDataModel,
//       photoFilePath: "这是一张图片地址");
//   String textJson = sendTextData.buildString();
//   String photoJson = sendPhotoData.buildString();
//   print(textJson);
//   print(photoJson);
// }
