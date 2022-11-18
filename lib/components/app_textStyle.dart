import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/components/app_colors.dart';

abstract class AppTextStyle{
  static TextStyle titleTextStyle = TextStyle( 
    fontWeight: FontWeight.w800,
    fontFamily: "Font",
    fontSize: 18,
    height: 24/18,
    color: AppColors.primeryTextColor,

    
  );

    static TextStyle filterTextStyle = TextStyle( 
    fontWeight: FontWeight.w600,
    fontFamily: "Font",
    fontSize: 14,
    height: 21/14,
    color: AppColors.secondaryTextColor,
  );


    static TextStyle priceTextStyle = TextStyle( 
    fontWeight: FontWeight.w400,
    fontFamily: "Font",
    fontSize: 12,
    height: 18/12,
    color: AppColors.priceTextColor,
  );


  
}