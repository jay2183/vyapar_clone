import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class AddItemButton extends StatelessWidget {
  AddItemButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 2, color: Colorconst.cGrey)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * .01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                color: Colorconst.cBlue,
              ),
              SizedBox(
                width: screenWidth * .02,
              ),
              Text(
                "Add Items",
                style: interFontBlack(context, color: Colorconst.cBlue,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: screenWidth * .01,
              ),
              Text(
                "(Optional)",
                style: interFontBlack(context, color: Colorconst.cGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
