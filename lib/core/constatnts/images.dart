
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Imageconst{

  static const basePath = "assets/images/";

  Image setImage({required String imageName,double? hieght,double? width,Color?color,BoxFit? fit}){

    return Image(image: AssetImage("$basePath$imageName"),height:hieght??20.h ,width:width??30.w ,color: color,fit: fit,);
  }
}