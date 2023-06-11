import 'package:community_app/components/text_const.dart';
import 'package:flutter/material.dart';

class AppBarConst extends StatelessWidget {
  String? text;
  double? elevation;
  Color? backgroundColor;
  bool? centerTitle;
  IconData? icon;
  Color? iconColor;
  Function()? onTap;
  AppBarConst(
      {Key? key,
      this.text,
      this.onTap,
      this.icon,
      this.iconColor,
      this.backgroundColor,
      this.centerTitle,
      this.elevation,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: TextConst(
        text: text,
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 25,
      ),
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}
