import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';


class BottomButton extends StatelessWidget {
  BottomButton({super.key, this.onClickSaveNew, this.onClickSave});

  final Function()? onClickSaveNew;
  final Function()? onClickSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: onClickSaveNew,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                        child: Text(
                      "Save & New",
                      style:
                          interFontGrey(fontsize: 13.sp, color: Colors.black54),
                    )),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: onClickSave,
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                        child: Text(
                      "Save",
                      style:
                          interFontGrey(fontsize: 13.sp, color: Colors.black54),
                    )),
                  ),
                ),
              )),
            ],
          )),
          SizedBox(
            width: 8.w,
          ),
          Transform(
            transform: Matrix4.diagonal3Values(-1, 1, 1),
            alignment: Alignment.center,
            child: Icon(
              Icons.reply_outlined,
              size: 23.sp,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
