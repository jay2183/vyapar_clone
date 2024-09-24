import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';


class HeaderButtons extends StatelessWidget {
  HeaderButtons(
      {super.key,
      this.butnTxt,
      this.index,
      this.selectedIndex,
      this.onSingleTap});
  final String? butnTxt;
  final int? index;
  final int? selectedIndex;
  final Function()? onSingleTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onSingleTap,
      child: Container(
        decoration: BoxDecoration(
            color: index == selectedIndex ? Colorconst.cLightRed : Colors.white,
            border: Border.all(
                width: 1,
                color: index == selectedIndex
                    ? Colorconst.cRed
                    : Colorconst.cGrey),
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Center(
              child: Text(
            butnTxt ?? "Transaction Details",
            style: index == selectedIndex
                ? interFontBlack(context)
                : interFontGrey(context),
          )),
        ),
      ),
    ));
  }
}
