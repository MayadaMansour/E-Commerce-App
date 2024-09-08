import 'package:flutter/material.dart';


class CoustomTextForm extends StatelessWidget {
  CoustomTextForm(
      {super.key,
      this.prefIcon,
      this.prefIconColor,
      this.suffixIcone,
      this.onChange,
      this.validator,
      this.onSubmitt,
      this.controller,
      this.textStyle,
      this.suffixIconeColor,
      this.passwordText = false,
      this.label,
      this.text,
      this.museTextColor,
      required this.borderColor,
      this.borderReduse = 0.0,
      this.labelColor,
      this.userTextColor,
      required this.fillColor,
      this.fill,
      this.hintText,
      this.error,
      this.padding = 0.0,
      this.initialValue,
      this.maxLineTex});

  Color? userTextColor;
  Color? museTextColor;
  bool? passwordText;
  double? textStyle;
  Color? prefIconColor;
  Color? suffixIconeColor;
  Color? labelColor;
  Color fillColor;
  bool? fill;
  Color borderColor;
  double? borderReduse;
  TextEditingController? controller;
  Function(String)? onChange;
  FormFieldValidator<String>? validator;
  Function(String)? onSubmitt;
  Widget? prefIcon;
  Widget? suffixIcone;
  TextInputType? text;
  String? label;
  String? hintText;
  double padding;
  String? error;

  String? initialValue;
  int? maxLineTex;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        onFieldSubmitted: onSubmitt,
        onChanged: onChange,
        obscureText: passwordText!,
        style: TextStyle(
            color: userTextColor,
            fontSize: textStyle,
            fontWeight: FontWeight.w400),
        cursorColor: museTextColor,
        keyboardType: text,
        maxLines: maxLineTex,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcone,
            suffixIconColor: suffixIconeColor,
            prefixIconColor: prefIconColor,
            fillColor: fillColor,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.all(padding),
            prefixIcon: prefIcon,
            labelText: label,
            errorText: error,
            labelStyle: TextStyle(color: labelColor,fontSize: 18),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderReduse!),
                borderSide: BorderSide(color: borderColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderReduse!),
                borderSide: BorderSide(color: borderColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderReduse!))),
        initialValue: initialValue);
  }
}

Widget defaultButton({
  required VoidCallback onTap,
  required String text,
  required Color bgColor,
  required Color textColor,
  double? width,
  double? height,
  required Color borderColor,
  String? img,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );


