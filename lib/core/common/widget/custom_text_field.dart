import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.isEditable,
    this.suffixIconWidget
  });
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? isEditable;
  final Widget? suffixIconWidget;
  // final Function(String?)?onChanged;
  // final Function(String?)?onFieldSubmitted;
  // final Function(PointerDownEvent)?onTapOutside;
  //final TextEditingController? controller;
  // final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      keyboardType: keyboardType,
      style: interFontBlack(context, fontsize: 10),
      decoration: InputDecoration(
        suffixIcon: suffixIconWidget,
        enabled: isEditable?? true,
        hintText: hintText ?? "Customer Name *",
        labelText: labelText ?? "Customer Name *",
        labelStyle: interFontGrey(context, fontsize: 15),
        disabledBorder: OutlineInputBorder(
          
            borderSide: BorderSide(width: 2, color: Colorconst.cGrey),
            borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
          
            borderSide: BorderSide(width: 2, color: Colorconst.cGrey),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
