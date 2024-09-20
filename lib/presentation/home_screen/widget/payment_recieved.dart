


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';



class PaymentRecievedWidget extends StatelessWidget {
  const PaymentRecievedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [

                                  Row(
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Text(
                                      'Shipping',
                                      style: interFontBlack(
                                          fontsize: 12.sp,
                                          color: Colorconst.cGrey),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                     
                                      SizedBox(
                                        width: 8.w,
                                      ),

                                      Expanded(
                                        child: Container(
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.w,
                                                color: Colorconst.cGrey),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                
                                                    decoration: BoxDecoration(
                                                   color: Colorconst.cSecondaryGrey,
                                                      borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(5.r),bottomLeft: Radius.circular(5.r))
                                                    ),
                                                height: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: const SizedBox(),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    width: 1.w,
                                                    color: Colorconst.cGrey,
                                                  ))
                                                ],
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    style: interFontBlack(
                                                        color: Colors.black12,
                                                        fontsize: 14.sp),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(height: 10.h,),
                                  Row(
                                children: [
                                  SizedBox(
                                    width: 190.w,
                                    child: Text(
                                      '',
                                      style: interFontBlack(
                                          fontsize: 12.sp,
                                          color: Colorconst.cGrey),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                     
                                      SizedBox(
                                        width: 8.w,
                                      ),

                                      Expanded(
                                        child: Container(
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.w,
                                                color: Colorconst.cGrey),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                
                                                    decoration: BoxDecoration(
                                                   color: Colorconst.cSecondaryGrey,
                                                      borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(5.r),bottomLeft: Radius.circular(5.r))
                                                    ),
                                                height: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w),
                                                  child: const SizedBox(),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    width: 1.w,
                                                    color: Colorconst.cGrey,
                                                  ))
                                                ],
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                    style: interFontBlack(
                                                        color: Colors.black12,
                                                        fontsize: 14.sp),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                              
                                  
                                  ],);
  }
}