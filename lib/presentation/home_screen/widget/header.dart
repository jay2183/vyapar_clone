import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colorconst.cBlue),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 13,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colorconst.cBlue),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4))),
                  ),
                  Container(
                    height: 5,
                    width: 13,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colorconst.cBlue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              "xianinfotech LLP",
              style: interFontBlack(context),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  size: 24,
                  color: Colorconst.cGrey,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.settings_outlined,
                  size: 24,
                  color: Colorconst.cGrey,
                ),
              ],
            )),
            SizedBox(
              width: 15,
            ),
          ],
        ))
      ],
    );
  }
}
