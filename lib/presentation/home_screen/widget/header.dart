import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15.w,
        ),
        Expanded(
            child: Row(
          children: [
            Container(
              height: 22.h,
              width: 22.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Colorconst.cBlue),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5.h,
                    width: 13.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colorconst.cBlue),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.r),
                            topRight: Radius.circular(4.r))),
                  ),
                  Container(
                    height: 5.h,
                    width: 13.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colorconst.cBlue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 18.w,
            ),
            Text(
              "xianinfotech LLP",
              style: interFontBlack(fontsize: 20.sp),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  size: 24.sp,
                  color: Colorconst.cGrey,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Icon(
                  Icons.settings_outlined,
                  size: 24.sp,
                  color: Colorconst.cGrey,
                ),
              ],
            )),
            SizedBox(
              width: 15.w,
            ),
          ],
        ))
      ],
    );
  }
}
