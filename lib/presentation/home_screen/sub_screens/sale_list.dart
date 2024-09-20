
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/core/models/sale_model.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';

import '../widget/header.dart';
import '../widget/header_buttons.dart';
import '../widget/sale_card.dart';

class SaleListScreen extends StatelessWidget {
  SaleListScreen({super.key});

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const HeaderWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            HeaderButtons(
                              index: 0,
                              selectedIndex:
                                  _controller.selectedHeaderBtnIndex.value,
                              onSingleTap: () =>
                                  _controller.onHeaderButtonTap(0),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            HeaderButtons(
                              butnTxt: "Party Details",
                              index: 1,
                              selectedIndex:
                                  _controller.selectedHeaderBtnIndex.value,
                              onSingleTap: () =>
                                  _controller.onHeaderButtonTap(1),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colorconst.cSecondaryBlue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey),
                                  right: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey),
                                  bottom: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Quick Links",
                                  style: interFontBlack(fontsize: 13.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Imageconst().setImage(
                                        imageName: "quick_link_1.png",
                                        hieght: 45.h,
                                        width: 60.w,
                                        fit: BoxFit.cover),
                                    Imageconst().setImage(
                                        imageName: "quick_link_2.png",
                                        hieght: 45.h,
                                        width: 60.w,
                                        fit: BoxFit.cover),
                                    Imageconst().setImage(
                                        imageName: "quick_link_3.png",
                                        hieght: 45.h,
                                        width: 60.w,
                                        fit: BoxFit.cover),
                                    Imageconst().setImage(
                                        imageName: "quick_link_4.png",
                                        hieght: 45.h,
                                        width: 60.w,
                                        fit: BoxFit.cover),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: _controller.searchTxtCnt,
                          onChanged: (value) {
                            _controller.searchByDateInvoiceNum(value);
                          },
                          style: interFontBlack(fontsize: 14.sp,color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.filter_alt_outlined,
                                  color: Colors.black45, size: 25.sp),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0.h),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: Colorconst.cBlue,
                                  size: 25.sp,
                                ),
                              ),
                              
                              hintText: "Search for a transaction",
                              hintStyle: interFontGrey(fontsize: 14.sp),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                            child:_controller.searchableSale.length.toInt()==0?Center(child: Text("Empty list",style: interFontBlack(color: Colors.black,fontsize: 24.sp,fontWeight: FontWeight.w600),),): ListView.builder(
                          controller: _controller.scrollController,
                          itemCount: _controller.searchableSale.length,
                          itemBuilder: (context, index) {
                            SaleModel obj = _controller.saleList[index];
                           
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: SaleCard(
                               object: obj,
                               deleteFunction: () {
                                 _controller.deleteSale(obj.id);
                               },


                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Positioned(
              bottom: 16.0,
              left: MediaQuery.of(context).size.width/3.2,
              right: MediaQuery.of(context).size.width/3.2,
             
              child: AnimatedOpacity(
                duration:const Duration(milliseconds: 350),
                opacity: _controller.isAddButnVisible.value ? 1.0 : 0.0,
                child: InkWell(
                  onTap:()=> _controller.setCurrenScreen(1) ,
                  child: Container(
                   
                    decoration: BoxDecoration(
                        color: Colorconst.cRed,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Imageconst().setImage(
                            imageName: "rupee_img.png",
                            hieght: 20.w,
                            width: 20.w,
                          ),
                          Text(
                            "Add New Sale",
                            style: interFontGrey(
                                color: Colors.white,
                                fontsize: 12.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  
}
