import 'package:flutter/material.dart';

class ProblemDescriptionTextField extends StatelessWidget {
  const ProblemDescriptionTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.ontap,
    this.suffix,
    this.prefix,
    this.prefixcolor,
    this.suffixcolor,

  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final dynamic controller;
  final dynamic ontap;
  final dynamic suffix  ;
  final dynamic prefix;
  final dynamic prefixcolor;
  final dynamic suffixcolor;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      onTap: ontap,

      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'هذا الحقل مطلوب*';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        //labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
        prefixIconColor: prefixcolor,
        suffixIconColor: suffixcolor,
        //hintStyle: TextStyle(color: Colors.red),

        border: buildBorder(),
        focusedBorder: buildBorder(Colors.white),
        enabledBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}