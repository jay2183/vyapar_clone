import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class DateBillNumWidget extends StatelessWidget {
  DateBillNumWidget({super.key, this.invoiceNumber, this.date});
  final String? invoiceNumber;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoce No.",
                      style: interFontBlack(context, color: Colorconst.cGrey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          invoiceNumber ?? "",
                          style:
                              interFontBlack(context, color: Colorconst.cGrey),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 12,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                  ],
                )),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: interFontBlack(context, color: Colorconst.cGrey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            date ?? "9/20/2024",
                            style: interFontBlack(context,
                                color: Colorconst.cGrey),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 12,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const VerticleDivider(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      "Firm Name:",
                      style: interFontGrey(context),
                    ),
                    Text(
                      "xianinfotech LLP",
                      style: interFontBlack(context),
                    ),
                  ],
                )),
                Transform.rotate(
                    angle: -1.55,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 12,
                      color: Colors.black45,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
