import 'package:flutter/material.dart';
import 'package:hospital_medical/shared/components/constant.dart';

Widget buildTextField(
  TextEditingController controller,
  String myLabelText,
  Widget myIcons, {
  IconData? suffixIcon,
  bool? canObscure,
  Function? onPressed,
  TextInputAction? status,
  TextInputType type = TextInputType.text,
  String? Function(String?)? validate,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        cursorColor: primaryColor,
        validator: (value) {
          return validate!(value);
        },
        style: TextStyle(color: primaryColor),
        obscureText: canObscure ?? false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 2.0,
          ),
          prefixIcon: myIcons,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: primaryColor,
                    size: 23,
                  ),
                  onPressed: () {
                    onPressed!();
                  },
                )
              : null,
          labelText: myLabelText,
          labelStyle: TextStyle(
            color: primaryColor,
            fontSize: 16,
          ),
        ),
        textInputAction: status ?? TextInputAction.done,
      ),
    );
