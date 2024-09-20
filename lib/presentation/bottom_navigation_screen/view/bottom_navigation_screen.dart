import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/bottom_navigation_screen/controller/bottom_navigation_controller.dart';


class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final BottomNavigationController _controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Expanded(
                child:
                    _controller.sampleWidgets[_controller.selectedIndex.value],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.h),
              child: Obx(
                () => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(_controller.iconsName.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                _controller.selectedIndex.value = index;
                              },
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    index == 4
                                        ? CircleAvatar(
                                            radius: 12.r,
                                            backgroundColor: Colors.amber,
                                            child: Center(
                                              child: Icon(
                                                _controller.getIcons[index],
                                                color: _controller.selectedIndex
                                                            .value ==
                                                        index
                                                    ? Colorconst.cBlue
                                                    : Colors.black,
                                                size: 19.sp,
                                              ),
                                            ),
                                          )
                                        : Icon(
                                            _controller.getIcons[index],
                                            color: _controller
                                                        .selectedIndex.value ==
                                                    index
                                                ? Colorconst.cBlue
                                                : Colors.black,
                                            size: 24.sp,
                                          ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      _controller.iconsName[index],
                                      style: GoogleFonts.inter(
                                          fontSize: 10.sp,
                                          color:
                                              _controller.selectedIndex.value ==
                                                      index
                                                  ? Colorconst.cBlue
                                                  : Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
