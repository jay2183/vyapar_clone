import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';



class AddItemButton extends StatelessWidget {
   AddItemButton({super.key,this.onTap});
final Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(width: 1.w, color: Colorconst.cGrey)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 8.r,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Add Items",
                style: interFontBlack(color: Colors.blue, fontsize: 12.sp),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "(Optional)",
                style: interFontBlack(color: Colorconst.cGrey, fontsize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
