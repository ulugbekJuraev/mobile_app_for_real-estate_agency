import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_textStyle.dart';

class TextWithTextField extends StatelessWidget {
  final TextEditingController controller;

  final String text, hintText;
  const TextWithTextField(
      {super.key,
      required this.text,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.titleTextStyle,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyle.priceTextStyle,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Color(0xFFE6E8EC),
                  width: 1,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Color(0xFFE6E8EC),
                  width: 1,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Color(0xFFE6E8EC),
                  width: 1,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
