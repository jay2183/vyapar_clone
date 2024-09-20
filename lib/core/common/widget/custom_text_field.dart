
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.controller,this.hintText,this.labelText,this.validator,this.onChanged,this.keyboardType,this.onTapOutside,this.onFieldSubmitted});
   final String? hintText;
   final String? labelText;
   final TextInputType? keyboardType;
   final Function(String?)?onChanged;
   final Function(String?)?onFieldSubmitted;
   final Function(PointerDownEvent)?onTapOutside;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType:keyboardType ,
      validator:validator,
      onChanged: onChanged,
      style: interFontBlack(fontsize: 14.sp,color: Colors.black),
    decoration: InputDecoration(
      
      hintText:hintText?? "enter",
      labelText: labelText?? "Customer *",
      
      border: OutlineInputBorder(
        
        borderSide: BorderSide(width: 1.w,color: Colorconst.cGrey),
        borderRadius: BorderRadius.circular(5.r)),
      focusedBorder: OutlineInputBorder(

        borderSide: BorderSide(width: 1.w,color: Colors.blue),
        borderRadius: BorderRadius.circular(5.r)
      ),
      
    ),

    );
  }
}