

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/validator_class.dart';
import 'package:vyapar_clone/core/common/widget/custom_dropdown.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/core/models/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';



class AddItemScreen extends StatelessWidget {
  AddItemScreen({super.key});
  final HomeController _controller = Get.find<HomeController>();

  final GlobalKey<FormState> addItemKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Obx(() {
                  return Form(
                    key: addItemKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _controller.setCurrenScreen(1),
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 24.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Text(
                                    "Add Item To Sale",
                                    style: interFontBlack(fontsize: 20.sp),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
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
                                ],
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                hintText: "e.g. Chocolate Cake",
                                labelText: "Item Name",
                                controller: _controller.itemNameTxtCnt,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                keyboardType: TextInputType.number,
                                hintText: "Enter Quantity",
                                labelText: "Quantity",
                                controller: _controller.quantityTxtCnt,
                              )),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                child: CustomDropdown(
                                  itemStyle: interFontGrey(
                                      fontsize: 14.sp, color: Colorconst.cGrey),
                                  items: _controller.unitDropItems,
                                  selectedItem:
                                      _controller.selectedUnitItem.value,
                                  onSetSelection: (p0) {
                                    _controller.selectedUnitItem.value =
                                        p0 ?? "Unit";
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                controller: _controller.priceRateTxtCnt,
                                onFieldSubmitted: (p0) {
                                  if (_controller.priceRateTxtCnt.text
                                      .contains(".00")) {
                                    _controller.itemPrice.value = double.parse(
                                        _controller.priceRateTxtCnt.text);
                                  } else {
                                    _controller.priceRateTxtCnt.text =
                                        '${_controller.priceRateTxtCnt.text}.00';
                                    _controller.itemPrice.value = double.parse(
                                        _controller.priceRateTxtCnt.text);
                                  }

                                  _controller.itemPrice.value = double.parse(
                                      _controller.priceRateTxtCnt.text);
                                },
                                onTapOutside: (p0) {
                                  if (_controller.priceRateTxtCnt.text
                                      .contains(".00")) {
                                    _controller.itemPrice.value = double.parse(
                                        _controller.priceRateTxtCnt.text);
                                  } else {
                                    _controller.priceRateTxtCnt.text =
                                        '${_controller.priceRateTxtCnt.text}.00';
                                    _controller.itemPrice.value = double.parse(
                                        _controller.priceRateTxtCnt.text);
                                  }

                                  _controller.itemPrice.value = double.parse(
                                      _controller.priceRateTxtCnt.text);
                                },
                                keyboardType: TextInputType.number,
                                hintText: "Rate (Price/Unit)",
                                labelText: "Price *",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Price";
                                  } else {
                                    return null;
                                  }
                                },
                              )),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                child: CustomDropdown(
                                  items: _controller.taxDropItems,
                                  selectedItem:
                                      _controller.selectedTaxItem.value,
                                  onSetSelection: (p0) {
                                    _controller.selectedTaxItem.value =
                                        p0 ?? "Without Tax";
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                return _controller.itemPrice.value == 0.0
                    ? const SizedBox()
                    : Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Totals & Taxes",
                                style: interFontBlack(
                                    fontsize: 12.sp, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const VerticleDivider(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Text(
                                        "Subtotal",
                                        style: interFontBlack(
                                            fontsize: 12.sp,
                                            color: Colorconst.cGrey),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "(Rate x Qty)",
                                        style: interFontBlack(
                                            fontsize: 10.sp,
                                            color: Colorconst.cGrey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )),
                                  Text(
                                    _controller.totalAmount(quantity:  _controller.quantityTxtCnt.text,price:  _controller.priceRateTxtCnt.text),
                                    style: interFontBlack(
                                        fontsize: 12.sp,
                                        color: Colorconst.cGrey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 110.w,
                                    child: Text(
                                      'Discount',
                                      style: interFontBlack(
                                          fontsize: 12.sp,
                                          color: Colorconst.cGrey),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.w,
                                                color: Colorconst.cYellowLight),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "0",
                                                  style: interFontBlack(
                                                      color: Colorconst
                                                          .cYellowLight,
                                                      fontsize: 14.sp),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    width: 1.w,
                                                    color:
                                                        Colorconst.cYellowLight,
                                                  ))
                                                ],
                                              ),
                                              Container(
                                                  color: Colorconst
                                                      .cSecondaryYellowLight,
                                                  height: double.infinity,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.w),
                                                    child: Icon(
                                                      Icons.percent,
                                                      color: Colorconst
                                                          .cYellowLight,
                                                      size: 13.sp,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
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
                                                color:
                                                    Colorconst.cSecondaryGrey,
                                                height: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w),
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
                                                    "0.00",
                                                    style: interFontBlack(
                                                        color: Colorconst.cGrey,
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
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 110.w,
                                    child: Text(
                                      'Tax %',
                                      style: interFontBlack(
                                          fontsize: 12.sp,
                                          color: Colorconst.cGrey),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
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
                                          child: CustomDropdown(
                                            onSetSelection: (p0) {},
                                            items: ["None"],
                                            selectedItem: "None",
                                            itemStyle: interFontBlack(
                                                fontsize: 12.sp,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
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
                                                color:
                                                    Colorconst.cSecondaryGrey,
                                                height: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.w),
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
                                                    "0.00",
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
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Additional CESS",
                                    style: interFontBlack(
                                        fontsize: 12.sp,
                                        color: Colorconst.cGrey),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "0.00",
                                          style: interFontBlack(
                                              fontsize: 10.sp,
                                              color: Colorconst.cGrey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          width: 120.w,
                                          height: 1.w,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: 80,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2.w),
                                                child: Container(
                                                  height: 1.w,
                                                  width: 2.w,
                                                  color: Colors.black,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: interFontBlack(
                                        fontsize: 15.sp, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                         _controller.totalAmount(quantity:  _controller.quantityTxtCnt.text,price:  _controller.priceRateTxtCnt.text),
                                          style: interFontBlack(
                                              fontsize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          width: 120.w,
                                          height: 1.w,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: 80,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2.w),
                                                child: Container(
                                                  height: 1.w,
                                                  width: 2.w,
                                                  color: Colors.black,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      );
              })
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: _controller.isAddButnVisible.value ? 1.0 : 0.0,
              child: InkWell(
                onTap: () => _controller.setCurrenScreen(1),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        bool sta = ValidatorClass().formValidator(addItemKey);
                        printInfo(info: "is valide $sta");
                        if (sta) {
                          AddItemModel object = AddItemModel(
                            totalPrice: _controller.totalAmount(quantity:  _controller.quantityTxtCnt.text,price:  _controller.priceRateTxtCnt.text),
                            itemNum: _controller.itemList.length +1,
                              price: _controller.priceRateTxtCnt.text,
                              itemName: _controller.itemNameTxtCnt.text,
                              quantity: "${_controller.quantityTxtCnt.text}.00",
                              tax: _controller.selectedTaxItem.value,
                              unit: _controller.selectedUnitItem.value);
                          _controller.addItemIntoSale(object);
                        } else {
                          Get.snackbar("Please Enter Price", "",
                              backgroundColor: Colors.redAccent);
                        }
                      },
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          child: Center(
                              child: Text(
                            "Save & New",
                            style: interFontGrey(
                                fontsize: 13.sp, color: Colors.black54),
                          )),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        bool sta = ValidatorClass().formValidator(addItemKey);
                        printInfo(info: "is valide $sta");
                        if (sta) {
                          AddItemModel object = AddItemModel(
                            totalPrice: _controller.totalAmount(quantity:  _controller.quantityTxtCnt.text,price:  _controller.priceRateTxtCnt.text),
                            itemNum: _controller.itemList.length +1,
                              price: _controller.priceRateTxtCnt.text,
                              itemName: _controller.itemNameTxtCnt.text,
                              quantity: "${_controller.quantityTxtCnt.text}.00",
                              tax: _controller.selectedTaxItem.value,
                              unit: _controller.selectedUnitItem.value);
                          _controller.addItemIntoSale(object);
                          _controller.setCurrenScreen(1);
                        } else {
                          Get.snackbar("Please Enter Price", "",
                              backgroundColor: Colors.redAccent);
                        }
                      },
                      child: Container(
                        color: Colorconst.cRed,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          child: Center(
                              child: Text(
                            "Save",
                            style: interFontGrey(
                                fontsize: 13.sp, color: Colors.white),
                          )),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
