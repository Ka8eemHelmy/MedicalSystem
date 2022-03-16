import 'package:flutter/material.dart';
import 'package:hospital_medical/shared/components/constant.dart';
import 'package:hospital_medical/views/widgets/text.dart';

Widget materialButtonCustom(
    {required String text, required Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: textCustom(
          '$text',
        ),
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
