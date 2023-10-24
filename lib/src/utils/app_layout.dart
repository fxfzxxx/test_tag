import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class AppLayout {
  static gap(double gap) {
    return SizedBox(height: gap);
  }

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static const int designWidth = 393;
  static const int designHeight = 852;
  // static getScreenHeight(){
  //   return Get.height;
  // }
  // static getScreenWidth(){
  //   return Get.width;
  // }
  // static getHeight(double height){
  //   return (height/designHeight)*getScreenHeight();
  // }
  // static getWidth(double width){
  //   return (width/designWidth)*getScreenWidth();
  // }
}
