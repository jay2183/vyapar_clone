import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';


class CustomDropdown extends StatelessWidget {
  CustomDropdown(
      {super.key,
      required this.items,
      this.hintText,
      this.selectedItem,
      this.itemStyle,
      this.onSetSelection});

  final List<String> items;
  final String? hintText;
  final String? selectedItem;
  final Function(String?)? onSetSelection;
  final TextStyle? itemStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(width: 1.w, color: Colorconst.cGrey)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hintText ?? 'Select Item',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).hintColor,
              ),
            ),
            
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:itemStyle??
                             TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    ))
                .toList(),
            value: selectedItem ?? "No Selected ",
            onChanged: onSetSelection,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
