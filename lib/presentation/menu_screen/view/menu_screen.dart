import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_menu_screen/others/views/other_products/other_product.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_menu_screen/others/views/settings/views/view.dart';
import 'package:vyapar_clone/presentation/menu_screen/widget/custom_page_view.dart';

import '../../../core/constatnts/colors.dart';
import '../sub_menu_screen/expenses/expense_detail.dart';
import '../sub_menu_screen/my_online_store/manage_item_screen.dart';
import '../sub_menu_screen/others/views/greeting_offer/views/greeting_offer.dart';
import '../sub_menu_screen/others/views/help_support/tutorial.dart';
import '../sub_menu_screen/others/views/refer_earn/refer_earn.dart';
import '../sub_menu_screen/others/views/vyapar_premium/vyapar_premium.dart';
import '../sub_menu_screen/purchase_screens/payment_list_screen.dart';
import '../sub_menu_screen/purchase_screens/purchase_list_screen.dart';
import '../sub_menu_screen/purchase_screens/purchase_order_list.dart';
import '../sub_menu_screen/purchase_screens/purchase_return_list.dart';
import '../sub_menu_screen/reports/view.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _showCustomPopup(
      BuildContext context, List<Map<String, dynamic>> items) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close),
                      ),
                      const SizedBox(width: 8),
                      // Text(title,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  buildIconGrid(items.map((item) {
                    return iconWithLabel(
                        item['icon'], item['label'], item['onTap']);
                  }).toList()),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        var curve = Curves.easeInOut;
        var scale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: anim1,
          curve: curve,
        ));
        var opacity =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: anim1,
          curve: curve,
        ));

        return ScaleTransition(
          scale: scale,
          child: FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      },
    );
  }

  void _showSalePopup(BuildContext context) {
    _showCustomPopup(context, [
      {
        'icon': Icons.payment,
        'label': 'Payment-In',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.assignment_return,
        'label': 'Sale Return',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.local_shipping,
        'label': 'Delivery Challan',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.receipt,
        'label': 'Estimate/Quotation',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.description,
        'label': 'Proforma Invoice',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.receipt_long,
        'label': 'Sale Invoice',
        'onTap': () {/* Your onTap  */}
      },
      {
        'icon': Icons.add_shopping_cart,
        'label': 'Sale Order',
        'onTap': () {/*  onTap  */}
      },
    ]);
  }

  void _showPurchasePopup(BuildContext context) {
    _showCustomPopup(context, [
      {
        'icon': Icons.shopping_cart,
        'label': 'Purchase',
        'onTap': () => Get.to(() => PurchaseListScreen())
      },
      {
        'icon': Icons.payment_outlined,
        'label': 'Payment-Out',
        'onTap': () => Get.to(() => PaymentListScreen())
      },
      {
        'icon': Icons.assignment_return,
        'label': 'Purchase Return',
        'onTap': () => Get.to(() => PurchaseReturnListScreen())
      },
      {
        'icon': Icons.receipt,
        'label': 'Purchase Order',
        'onTap': () => Get.to(() => PurchaseOrderListScreen())
      },
    ]);
  }

  void _showOnlineStorePopup(BuildContext context) {
    _showCustomPopup(context, [
      {'icon': Icons.dashboard_outlined, 'label': 'Dashboard', 'onTap': () {}},
      {
        'icon': Icons.list_alt_outlined,
        'label': 'Manage Items',
        'onTap': () => Get.to(() => ManageItemScreen())
      },
      {
        'icon': Icons.assignment_return,
        'label': 'Manage Orders',
        'onTap': () {}
      },
      {'icon': Icons.receipt, 'label': 'Purchase Order', 'onTap': () {}},
    ]);
  }

  void _showBackupRestorePopup(BuildContext context) {
    _showCustomPopup(context, [
      {
        'icon': Icons.backup,
        'label': 'Auto Backup',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.save_alt,
        'label': 'Backup to Phone',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.email,
        'label': 'Backup to E-mail',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.restore,
        'label': 'Restore Backup',
        'onTap': () {/*  onTap action */}
      },
    ]);
  }

  void _showUtilitiesPopup(BuildContext context) {
    _showCustomPopup(context, [
      {
        'icon': Icons.check,
        'label': 'Verify my data',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.calculate,
        'label': 'Open Calculator',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.import_contacts,
        'label': 'Import items',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.group_add,
        'label': 'Import Parties',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.delete,
        'label': 'Recycle Bin',
        'onTap': () {/*  onTap action */}
      },
      {
        'icon': Icons.close,
        'label': 'Close Financial Year',
        'onTap': () {/* onTap action */}
      },
      {
        'icon': Icons.message,
        'label': 'Messages',
        'onTap': () {/* onTap action */}
      },
    ]);
  }

  void _showHelpSupportPopup(BuildContext context) {
    _showCustomPopup(context, [
      {
        'icon': Icons.phone,
        'label': 'Customer Care',
        'onTap': () => _customerCareDialog()
      },
      {
        'icon': Icons.video_library,
        'label': 'Tutorials',
        'onTap': () => Get.to(() => TutorialScreen())
      },
      {
        'icon': Icons.support_agent,
        'label': 'Remote Support',
        'onTap': () {/*  onTap action */}
      },
    ]);
  }

  void _customerCareDialog() {
    Get.dialog(
      barrierDismissible: true,
      Material(
        
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                // height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r)),
                    
                child: Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(Icons.close,size: 20.sp,color: Colors.black,)),
                    ),
                      
                    Text("Whatsapp",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                   
                     SizedBox(height: 14.h,),
                    Text("Email",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                   
                     SizedBox(height: 14.h,),
                    Text("Message",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                   
                     SizedBox(height: 14.h,),
                    Text("Call",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w500),),
                   
                     SizedBox(height: 14.h,),
                  ],),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
  void _rateThisAppDialog() {
    Get.dialog(
      barrierDismissible: true,
      Material(
        
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: double.infinity,
                // height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r)),
                    
                child: Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(Icons.close,size: 20.sp,color: Colors.grey,)),
                    ),

                    SizedBox(height: 80.h,),
                      
                    Text("Do you like Vyapar app?",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w400),),
                   
                   
                   
                     SizedBox(height: 14.h,),

                     Padding(
                       padding:  EdgeInsets.only(left: 12.w,right: 12.w,bottom: 12.h),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                        Icon(Icons.star,size: 25.sp,color: Colors.grey.shade400,),
                        Icon(Icons.star,size: 25.sp,color: Colors.grey.shade400,),
                        Icon(Icons.star,size: 25.sp,color: Colors.grey.shade400,),
                        Icon(Icons.star,size: 25.sp,color: Colors.grey.shade400,),
                        Icon(Icons.star,size: 25.sp,color: Colors.grey.shade400,),
                       ],),
                     )
                  ],),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.home_outlined,
          color: Colors.blue,
        ),
        title: const Text(
          'XianInfoTech',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomPageView(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'This Year',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Text(
                        'View Bill',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sales',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '₹0.00',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Purchases',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '₹0.00',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    // crossAxisSpacing: 16,
                    // mainAxisSpacing: 16,
                    children: [
                      buildGridItem(
                          Icons.blinds_closed_rounded, 'Invoice', () {}),
                      buildGridItem(
                          Icons.inventory_2_outlined, 'Quotation', () {}),
                      buildGridItem(
                          Icons.timelapse_outlined, 'Delivery Challan', () {}),
                      buildGridItem(
                          Icons.auto_graph_sharp, 'Credit Note', () {}),
                      buildGridItem(Icons.business_center_outlined,
                          'Purchase Order', () {}),
                      buildGridItem(
                          Icons.card_membership, 'Pro Forma Invoice', () {}),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Business',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    // crossAxisSpacing: 16,
                    // mainAxisSpacing: 16,
                    children: [
                      buildGridItem(Icons.currency_rupee_sharp, 'Sale', () {
                        _showSalePopup(context);
                      }),
                      buildGridItem(Icons.shopping_cart_outlined, 'Purchase',
                          () {
                        _showPurchasePopup(context);
                      }),
                      buildGridItem(Icons.note_alt_outlined, 'Expenses',
                          () => Get.to(() => ExpenseDetailScreen())),
                      buildGridItem(Icons.home_outlined, 'My Online Store', () {
                        _showOnlineStorePopup(context);
                      }),
                      buildGridItem(Icons.note_outlined, 'Report',
                          () => Get.to(() => ReportScreen())),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Access',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    // crossAxisSpacing: 16,
                    // mainAxisSpacing: 16,
                    children: [
                      buildGridItem(
                          Icons.blinds_closed_rounded, 'E-Way Bill', () {}),
                      buildGridItem(
                          Icons.inventory_2_outlined, 'E-Invoice', () {}),
                      buildGridItem(
                          Icons.timelapse_outlined, 'Payment Timeline', () {}),
                      buildGridItem(Icons.auto_graph_sharp, 'Insights', () {}),
                      buildGridItem(Icons.business_center_outlined,
                          'Business Card', () {}),
                      buildGridItem(Icons.card_membership, 'Greetings', () {}),
                      buildGridItem(Icons.business_center_outlined,
                          'Invoice Templates', () {}),
                      buildGridItem(Icons.document_scanner_outlined,
                          'Document Settings', () {}),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cash & Bank',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    // mainAxisSpacing: 16,
                    children: [
                      buildGridItem(Icons.account_balance_outlined,
                          'Bank Accounts', () {}),
                      buildGridItem(Icons.account_balance_wallet_outlined,
                          'Cash In-Hand', () {}),
                      buildGridItem(
                          Icons.manage_history_sharp, 'Icons.notes', () {}),
                      buildGridItem(Icons.playlist_add_circle_outlined,
                          'Loan Account', () {}),
                      buildGridItem(
                          Icons.currency_rupee_outlined, 'Apply Loan', () {}),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Important Utilities',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    // crossAxisSpacing: 16,
                    // mainAxisSpacing: 16,
                    children: [
                      buildGridItem(Icons.sync, 'Sync & Share', () {}),
                      buildGridItem(Icons.manage_history_sharp,
                          'Manage Companies', () {}),
                      buildGridItem(Icons.settings_backup_restore_outlined,
                          'Backup/Restore', () {
                        _showBackupRestorePopup(context);
                      }),
                      buildGridItem(Icons.shopping_bag_outlined, 'Utilities',
                          () {
                        _showUtilitiesPopup(context);
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Others',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      buildGridItem(
                          Icons.account_balance_outlined,
                          'Vyapar Premium',
                          () => Get.to(() => VyaparPremiumScreen())),
                      buildGridItem(Icons.account_balance_wallet_outlined,
                          'Get Desktop Billing Software', () {
                        _tryDeskBottomSheet();
                      }),
                      buildGridItem(
                          Icons.view_comfortable_rounded,
                          'Other Products',
                          () => Get.to(() => OtherProductScreen())),
                      buildGridItem(Icons.phone_enabled, 'Greeting & Offers',
                          () => Get.to(() => GreetingOfferScreen())),
                      buildGridItem(Icons.settings_outlined, 'Settings',
                          () => Get.to(() => SettingScreen())),
                      buildGridItem(
                          Icons.wallet_giftcard_rounded,
                          'Refer & Earn',
                          () => Get.to(() => ReferEarnScreen())),
                      buildGridItem(
                          Icons.headset_mic_outlined, 'Help & Support', () {
                        _showHelpSupportPopup(context);
                      }),
                      buildGridItem(
                          Icons.star_border_outlined, 'Rate This App', () => _rateThisAppDialog()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tryDeskBottomSheet() {
    Get.bottomSheet(Container(
      height: 270.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13.r), topRight: Radius.circular(13.r)),
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Try Desktoop App for Free",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Get the download link on your Email ID",
                  style: pdfOptionStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontsize: 10.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: CustomTextFormField(
              hintText: "Enter email id",
              labelText: "Email ID",
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colorconst.cGrey),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text("Get link on Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                )
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  height: 1.w,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text("OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  height: 1.w,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Visit",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "vyaparapp.in",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "and download the app",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )

          // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
        ],
      ),
    ));
  }
}

TextStyle pdfOptionStyle(
    {Color? color, double? fontsize, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? Colors.black54,
      fontSize: fontsize ?? 15.sp,
      fontWeight: fontWeight ?? FontWeight.w600);
}

Widget buildGridItem(IconData icon, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.blue,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

Widget buildIconGrid(List<Widget> children) {
  return GridView.count(
    crossAxisCount: 3,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 15,
    // mainAxisSpacing: 5,
    children: children,
  );
}

Widget iconWithLabel(IconData icon, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, color: Colors.black),
        ),
      ],
    ),
  );
}
