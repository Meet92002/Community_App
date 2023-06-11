// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class IconButtonConst extends StatelessWidget {
  IconData? icon;
  double? iconSize;
  Color? color;
  Function() function;
  IconButtonConst({super.key,this.icon,this.iconSize,this.color,required this.function});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: iconSize,
      color: color,
      onPressed: function,
    );
  }
}
