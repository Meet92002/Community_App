// ignore_for_file: must_be_immutable

import 'package:community_app/utils/color_const.dart';
import 'package:flutter/material.dart';

class TextFieldConst extends StatelessWidget {
  TextAlignVertical? textAlignVertical;
  String? hintText;
  IconData? iconData;
  Color? iconColor;
  bool filled;
  TextEditingController? controller;
  Function() onTap;
  void Function(String)? onChanged;
  bool readOnly;
  int? maxLines;
  TextInputType? keyBoardType;
  FormFieldValidator<String>? validator;
  TextFieldConst({Key? key,this.textAlignVertical,this.validator,this.onChanged,this.maxLines,this.keyBoardType,required this.readOnly,this.controller,this.hintText,this.iconData,this.iconColor,required this.filled,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      textAlignVertical: textAlignVertical,
      cursorColor: Colors.black,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
        ),
        filled: filled,
        suffixIcon: IconButton(
          icon: Icon(iconData),
          iconSize: 20,
          onPressed: onTap,
          color: iconColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
