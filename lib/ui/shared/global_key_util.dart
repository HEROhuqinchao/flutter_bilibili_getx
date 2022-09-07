import 'package:flutter/cupertino.dart';

double? renderObjectY(GlobalKey globalKey){
  RenderObject? evaluationRenderObject = globalKey.currentContext?.findRenderObject();
  return  evaluationRenderObject?.getTransformTo(null).getTranslation().y;
}