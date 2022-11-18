import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_textStyle.dart';

class DescriptionWithTextField extends StatelessWidget {
  final String text, hintText;
  final TextEditingController controller;
  const DescriptionWithTextField(
      {super.key,
      required this.text,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          text,
          style: AppTextStyle.titleTextStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: size.width * 0.75,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            maxLines: 3,
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

class LoginTextField extends StatelessWidget {
  final String text, hintText;
  final TextEditingController controller;
  const LoginTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.90,
      child: TextField(
        // obscureText: true,
        controller: controller,
        keyboardType: TextInputType.text,
        maxLines: 1,
        decoration: InputDecoration(
          // suffixIcon: const Icon(Icons.visibility_off_outlined),
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 233, 235),
          hintText: hintText,
          hintStyle: AppTextStyle.priceTextStyle,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color(0xFF2FA2B9),
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide.none),
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
    );
  }
}





class PasswordTextField extends StatelessWidget {
  final String text, hintText;
  final TextEditingController controller;
  const PasswordTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.90,
      child: TextField(
        obscureText: true,
        controller: controller,
        keyboardType: TextInputType.text,
        maxLines: 1,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.visibility_off_outlined),
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 233, 235),
          hintText: hintText,
          hintStyle: AppTextStyle.priceTextStyle,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color(0xFF2FA2B9),
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide.none),
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
    );
  }
}
