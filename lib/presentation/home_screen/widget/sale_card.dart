import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/core/models/sale_model.dart';



class SaleCard extends StatelessWidget {
  SaleCard(
      {super.key,
      this.object,
      this.deleteFunction
      
      });
 final SaleModel? object;
 final Function()?deleteFunction;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      object!.billName ?? "blue sky tech legal solutions",
                      style:
                          interFontBlack(color: Colors.black, fontsize: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colorconst.cGreen,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        child: Text("SALE",
                            style: interFontBlack(
                                color: Colors.green, fontsize: 10.sp)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      object!.billNum ?? "#23-24-01 15",
                      style: interFontBlack(
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      object!.billDate ?? "07 Sep, 24",
                      style: interFontBlack(
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: interFontBlack(
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "24,000.00",
                      style:
                          interFontBlack(color: Colors.black, fontsize: 14.sp),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style: interFontBlack(
                          color: Colorconst.cGrey, fontsize: 10.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "24,000.00",
                      style:
                          interFontBlack(color: Colors.black, fontsize: 14.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.print_outlined,
                      size: 23.sp,
                      color: Colorconst.cGrey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Transform(
                      transform: Matrix4.diagonal3Values(-1, 1, 1),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.reply_outlined,
                        size: 23.sp,
                        color: Colorconst.cGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        size: 23.sp,
                        color: Colorconst.cGrey,
                      ),
                      onSelected: (value) {
                        if (value == 'Edit') {
                        } else if (value == 'Delete') {
                          showDeleteBottomSheet(object??SaleModel(id: 0));
                        } else if (value == 'Update') {}
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                        const PopupMenuItem(
                          value: 'Update',
                          child: Text('Update'),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteBottomSheet(SaleModel object){

    Get.bottomSheet(Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r)),
                                  
                                  height: 150.h,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                                    child: Column(
                                      children: [
                                        Icon(Icons.delete_forever_outlined,size: 35.sp,color: Colors.red,),
                                        Row(
                                          children: [
                                            
                                            Expanded(
                                              child: SizedBox(
                                                child: Text(
                                                  "Are you sure want to delete ${object.billName.toString()} bill ?",
                                                  style:
                                                      interFontBlack(color: Colors.black87,fontsize: 15.sp),
                                                      textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Get.back();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.r),
                                                    color: Colors.blue),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w, vertical: 7.h),
                                                  child: Text(
                                                    "Cencel",
                                                    style:
                                                        interFontBlack(color:  Colors.white,fontsize: 13.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                           
                                            InkWell(
                                              onTap: deleteFunction,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8.r),
                                                    color: Colors.blue),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w, vertical: 7.h),
                                                  child: Text(
                                                    "Delete",
                                                    style:
                                                        interFontBlack(color:  Colors.white,fontsize: 13.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
  }
}
