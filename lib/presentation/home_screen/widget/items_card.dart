

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class ItemsCardWidget extends StatelessWidget {
   ItemsCardWidget({super.key,this.itemName,this.itemNum,this.price,this.quantity,this.total,this.tax,this.discount});

   final String? itemName;
   final String? itemNum;
   final String? price;
   final String? quantity;
   final String? total;
   final String? tax;
   final String? discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(5.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                CircleAvatar(
                  radius: 8.r,
                  backgroundColor: Colors.white,
                  child: Transform.rotate(
                      angle: 4.7,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 10.sp,
                        color: Colors.black45,
                      )),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Billed Items",
                  style: interFontGrey(fontsize: 12.sp, color: Colors.white),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colorconst.cSecondaryGrey,
              borderRadius: BorderRadius.circular(5.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 1.5.h),
                                child: Text(
                                  "#$itemNum",
                                  style: interFontBlack(
                                      fontsize: 9.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              itemName??"Item Name",
                              style: interFontBlack(
                                  fontsize: 13.sp, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(price?? "690.00",
                          style: interFontBlack(
                              fontsize: 13.sp, color: Colors.black))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item Subtotal",
                        style: interFontBlack(
                          fontsize: 11.sp,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "$quantity x $price = $total",
                        style: interFontBlack(
                            fontsize: 11.sp, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount (%): 0",
                        style: interFontBlack(
                          fontsize: 11.sp,
                          color: Colorconst.cYellowLight,
                        ),
                      ),
                      Text(
                       discount?? "0",
                        style: interFontBlack(
                          fontsize: 11.sp,
                          color: Colorconst.cYellowLight,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax 0%",
                        style: interFontBlack(
                          fontsize: 11.sp,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                       tax?? "0",
                        style: interFontBlack(
                            fontsize: 11.sp, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tatal Disc: 0.0",
                style: interFontBlack(
                  fontsize: 11.sp,
                  color: Colors.black45,
                ),
              ),
              Text(
                "Total Tax Amt: 0.0",
                style: interFontBlack(fontsize: 11.sp, color: Colors.black45),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tatal Qty:  $quantity",
                style: interFontBlack(
                  fontsize: 11.sp,
                  color: Colors.black45,
                ),
              ),
              Text(
                "Subtotal: $total",
                style: interFontBlack(fontsize: 11.sp, color: Colors.black45),
              ),
            ],
          ),
        ),

        
      ],
    );
  }
}
