import 'package:community_app/components/text_const.dart';
import 'package:flutter/material.dart';

import '../utils/color_const.dart';

class AllButtonConst extends StatelessWidget {
  String? text;
  double? width;
  double? height;
  double? elevation;
  double? fontSize;
  Function() onPressed;
  Color? color;
  Color? textColor;
  AllButtonConst({Key? key,this.width,this.height,this.text,this.color,this.textColor,required this.onPressed,this.elevation,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: color,
        ),
        child: TextConst(
          text: text,
          fontSize: fontSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: textColor,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
