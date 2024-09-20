
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/common/validator_class.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/core/models/add_item.dart';
import 'package:vyapar_clone/core/models/sale_model.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';


import '../widget/add_item_button.dart';
import '../widget/bottom_button.dart';
import '../widget/date_bill_num.dart';
import '../widget/items_card.dart';
import '../widget/payment_recieved.dart';
import '../widget/payment_type_btn.dart';

class AddSaleScreen extends StatelessWidget {
  AddSaleScreen({super.key});
  final ContextProvider _contextProvider = ContextProvider();
  final HomeController _controller = Get.find<HomeController>();

  final GlobalKey<FormState> _addSaleFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _controller.updatedInvoiceNum();
    _controller.updateDate();
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
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _controller.setCurrenScreen(0),
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
                                "Sale",
                                style: interFontBlack(fontsize: 20.sp),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                        color: Colorconst.cSecondaryGrey,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Row(
                                      children: [
                                        PaymentTypeBtnWidget(
                                          index: 0,
                                          selectedIndex:
                                              _controller.paymentIndex.value,
                                          onTap: () =>
                                              _controller.setPaymentType(0),
                                        ),
                                        PaymentTypeBtnWidget(
                                          btnName: "Cash",
                                          index: 1,
                                          selectedIndex:
                                              _controller.paymentIndex.value,
                                          onTap: () =>
                                              _controller.setPaymentType(1),
                                        ),
                                      ],
                                    ),
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
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colorconst.cSecondaryBlue,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          DateBillNumWidget(
                            invoiceNumber: _controller.invoiceNumber.value,
                            date: _controller.date.value,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Form(
                                key: _addSaleFormKey,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextField(
                                      controller: _controller.customerTxtCnt,
                                      labelText: "Customer *",
                                      hintText: "Enter Customer",
                                      validator: (value) {
                                        if (value!.isEmpty || value == "") {
                                          return "Please Enter Customer";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextField(
                                      controller: _controller.billingNameTxtCnt,
                                      labelText: "Billing Name(Optional)",
                                      hintText: "Enter Billing Name",
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextField(
                                      controller: _controller.phoneNumTxtCnt,
                                      labelText: "Phone Number",
                                      hintText: "Enter Phone Number",
                                      validator: (value) {
                                        if (value!.isEmpty || value == "") {
                                          return "Please Enter Customer";
                                        } else {
                                          if (value.length != 10) {
                                            return "Invalid Phone Number";
                                          }
                                          if (!RegExp(r'^[0-9]+$')
                                              .hasMatch(value)) {
                                            return "Invalid Phone Number";
                                          }
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 11.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Column(
                                        children: List.generate(
                                          _controller.itemList.length,
                                          (index) {
                                            AddItemModel object = _controller.itemList[index];
                                            return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 13.h),
                                            child: ItemsCardWidget(
                                              itemName: object.itemName,
                                              itemNum: object.itemNum.toString(),
                                              price: object.price,
                                              quantity: object.quantity,
                                              total: object.totalPrice,


                                            ),
                                          );}
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      AddItemButton(
                                        onTap: () =>
                                            _controller.setCurrenScreen(2),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 10.h,
                                        color: Colorconst.cSecondaryGrey,
                                      ),
                                    )
                                  ],
                                ),
                               _controller.itemList.length.toInt()==0?const SizedBox(): Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Charges",
                                        style: interFontGrey(
                                            fontsize: 12.sp,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const VerticleDivider(),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      PaymentRecievedWidget(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              _controller.itemList.length.toInt()==0?const SizedBox():  Container(
                                  width: double.infinity,
                                  color: Colorconst.cSecondaryGrey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: interFontBlack(
                                                  fontsize: 15.sp,
                                                  color: Colors.black),
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
                                                   _controller.grandTotalPrice.value.toString()?? "690.00",
                                                    style: interFontBlack(
                                                        fontsize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  SizedBox(
                                                    width: 120.w,
                                                    height: 1.w,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemCount: 80,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 2.w),
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
                                          height: 15.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20.w,
                                              child: Checkbox(
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              (states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .selected)) {
                                                      return Colors.blue;
                                                    }
                                                    return Colors.transparent;
                                                  }),
                                                  checkColor: Colors.white,
                                                  focusColor: Colors.blue,
                                                  value: _controller
                                                      .checkedBoxValue.value,
                                                  onChanged: (value) {
                                                    _controller.checkedBoxValue
                                                        .value = value ?? false;
                                                        if(_controller.checkedBoxValue
                                                        .value ){
                                                          _controller.recievedMoneyTxtCnt.text=_controller.grandTotalPrice.value.toString();
                                                          _controller.dueRemain.value = 0.00;
                                                           
                                                        }else{
                                                          _controller.recievedMoneyTxtCnt.text='';
                                                        }
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "Received",
                                              style: interFontBlack(
                                                  fontsize: 13.sp,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [

                                                   SizedBox(
                                                   
                                              width: 100.w,
                                              height: 20.h,
                                              child: TextField(
                                                controller: _controller.recievedMoneyTxtCnt,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.end,
                                                style: interFontBlack(fontsize: 12.sp,color: Colors.black),
                                                onChanged: (value) {
                                                  if(value ==''){
                                                    _controller.dueRemain.value = _controller.grandTotalPrice.value;

                                                  }else{

                                                  _controller.dueRemain.value = _controller.grandTotalPrice.value - double.parse(_controller.recievedMoneyTxtCnt.text);
                                                  }
                                                },
                                              
                                                decoration:const InputDecoration(
                                                  contentPadding: EdgeInsets.all(0),
                                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                                                ),
                                              ),
                                            ),
                                                  // Text(
                                                  // _controller.checkedBoxValue.value ==true?_controller.grandTotalPrice.value.toString():  "0.00",
                                                  //   style: interFontBlack(
                                                  //       fontsize: 13.sp,
                                                  //       color: Colors.black,
                                                  //       fontWeight:
                                                  //           FontWeight.w400),
                                                  // ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  SizedBox(
                                                    width: 120.w,
                                                    height: 1.w,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: 80,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 2.w),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Balance Due",
                                              style: interFontBlack(
                                                fontsize: 13.sp,
                                                color: Colors.green,
                                              ),
                                            ),
                                            
                                            Text(
                                              _controller.dueRemain.value.toString() ?? "0.00",
                                              style: interFontBlack(
                                                  fontsize: 13.sp,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 10.h,
                                  color: Colorconst.cSecondaryGrey,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Payment Type",
                                            style: interFontGrey(
                                                fontsize: 12.sp,
                                                color: Colorconst.cGrey),
                                          )),
                                          Icon(
                                            Icons.money_sharp,
                                            size: 20.sp,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            "Cash",
                                            style: interFontGrey(
                                                fontsize: 11.sp,
                                                color: Colors.black87),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 20.sp,
                                            color: Colorconst.cGrey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 90.h,
                                ),
                              ],
                            ),
                          ),

                          // Expanded(
                          //     child: Container(
                          //   color: Colorconst.cGrey,
                          //   child: Column(children: [

                          //   ],),
                          // )),

                          // Container(
                          //   width: double.infinity,
                          //   height: 200.h,
                          //   color: Colorconst.cGrey,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colorconst.cLightPink,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Current Plan may not support some feature",
                                style: interFontGrey(
                                    fontsize: 11.sp, color: Colorconst.cGrey),
                              ),
                              Transform.rotate(
                                  angle: 3.1,
                                  child: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 10.sp,
                                    color: Colors.black45,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      BottomButton(
                        onClickSaveNew: () {
                          bool sta =
                              ValidatorClass().formValidator(_addSaleFormKey);
                          printInfo(info: "is valide $sta");
                          if (sta) {
                            _controller.updatedInvoiceNum();
                            SaleModel object = SaleModel(
                                id: _controller.saleList.length + 1,
                                billDate: _controller.date.value,
                                billName: _controller.billingNameTxtCnt.text,
                                billNum: _controller.invoiceNumber.value);
                            printInfo(
                                info:
                                    "_controller.billingNameTxtCnt.text${_controller.billingNameTxtCnt.text}");
                            printInfo(
                                info:
                                    "_controller.Customer.text${_controller.customerTxtCnt.text}");
                            _controller.addSale(object);
                          } else {
                            Get.snackbar("Some fields may be empty ", "",
                                backgroundColor: Colors.redAccent);
                          }
                        },
                        onClickSave: () {
                          bool sta =
                              ValidatorClass().formValidator(_addSaleFormKey);
                          printInfo(info: "is valide $sta");
                          if (sta) {
                            _controller.updatedInvoiceNum();
                            SaleModel object = SaleModel(
                                id: _controller.saleList.length + 1,
                                billDate: _controller.date.value,
                                billName: _controller.billingNameTxtCnt.text,
                                billNum: _controller.invoiceNumber.value);
                            printInfo(
                                info:
                                    "_controller.billingNameTxtCnt.text${_controller.billingNameTxtCnt.text}");
                            _controller.addSale(object);
                            _controller.setCurrenScreen(0);
                          } else {
                            Get.snackbar("Some fields may be empty ", "",
                                backgroundColor: Colors.redAccent);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
