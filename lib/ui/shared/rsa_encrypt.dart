import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

/// RAS加密
class HYEncrypt {
  ///  加密（本地公钥）
  static Future<String> encryptionByAssets(String content) async {
    final parser = RSAKeyParser();
    String publicKeyString =
        await rootBundle.loadString('assets/rsa_key/rsa_public_key.pem');
    if(Constant.isDebug) {
      print('publicKeyString=$publicKeyString');
    }
    RSAPublicKey publicKey = parser.parse(publicKeyString) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encrypt(content).base64;
  }

  //
  // /// 解密
  // static Future<String> decrypt(String decoded) async {
  //   final parser = RSAKeyParser();
  //   String privateKeyString =
  //       await rootBundle.loadString('assets/rsa_key/rsa_private_key.pem');
  //   final privateKey = parser.parse(privateKeyString) as RSAPrivateKey;
  //   final encrypter = Encrypter(RSA(privateKey: privateKey));
  //   return encrypter.decrypt(Encrypted.fromBase64(decoded));
  // }

  ///加密（公钥传入参数）
  static Future<String> encryption(
      String content, String publicKeyString) async {
    final parser = RSAKeyParser();
    RSAPublicKey publicKey = parser.parse(publicKeyString) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encrypt(content).base64;
  }

  /// 解密
  static Future<String> decrypt(String decoded) async {
    final parser = RSAKeyParser();
    String privateKeyString =
        await rootBundle.loadString('assets/rsa_key/rsa_private_key.pem');
    final privateKey = parser.parse(privateKeyString) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(privateKey: privateKey));
    return encrypter.decrypt(Encrypted.fromBase64(decoded));
  }
}
