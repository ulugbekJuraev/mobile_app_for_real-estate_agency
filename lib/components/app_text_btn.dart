import 'package:flutter/material.dart';

import 'package:flutter_application_2/components/app_colors.dart';
import 'package:flutter_application_2/components/app_textStyle.dart';

class AppTextbtn extends StatelessWidget {
  final Function func;
  final String text;
  const AppTextbtn({
    super.key,
    required this.func,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primeryTextColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () => func(),
        child: Text(
          text,
          style: AppTextStyle.filterTextStyle .copyWith(
            color: AppColors.whiteTextColor,
          ),
        ),
      ),
    );
  }
}

class AppTextbtnCancel extends StatelessWidget {
  final Function func;
  final String text;

  const AppTextbtnCancel({
    super.key,
    required this.func,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.secondaryTextColor,
        ),
        color: AppColors.whiteTextColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () => func(),
        child: Text(
          text,
          style: AppTextStyle.filterTextStyle.copyWith(
            color: AppColors.primeryTextColor,
          ),
        ),
      ),
    );
  }
}





class AppTextbtnPhoto extends StatelessWidget {
  final Function func;
  final String text;
  const AppTextbtnPhoto({
    super.key,
    required this.func,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primeryTextColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () => func(),
        child: Text(
          text,
          style: AppTextStyle.priceTextStyle .copyWith(
            color: AppColors.whiteTextColor,
          ),
        ),
      ),
    );
  }
}





class LoginTextbtn extends StatelessWidget {
  final Function func;
  final String text;
  const LoginTextbtn({
    super.key,
    required this.func,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primeryTextColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () => func(),
        child: Text(
          text,
          style: AppTextStyle.filterTextStyle .copyWith(
            color: AppColors.whiteTextColor,
          ),
        ),
      ),
    );
  }
}
