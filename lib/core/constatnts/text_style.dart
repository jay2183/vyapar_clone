import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle interFontBlack({double? fontsize,FontWeight? fontWeight,Color? color}){
  return TextStyle(

    fontSize: fontsize??20.sp,
    color: color??Colors.black,
    fontWeight:fontWeight?? FontWeight.w500
  );
}
TextStyle interFontGrey({double? fontsize,FontWeight? fontWeight,Color?color}){
  return TextStyle(

    fontSize: fontsize??20.sp,
    color:color?? Colors.grey,
    fontWeight:fontWeight?? FontWeight.w500
  );
}