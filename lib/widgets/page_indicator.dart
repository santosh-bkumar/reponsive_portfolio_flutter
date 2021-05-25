import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';



showPageIndicator(int length,int currentIndex,Axis axis){
  return PageViewIndicator(
    length: length,
    currentIndex: currentIndex,
    currentColor: AppColors.colorBlue,
    otherColor: AppColors.darkerBlueish,
    currentSize: 18,
    otherSize: 15,
    margin: EdgeInsets.all(5),
    borderRadius: 9999.0,
    alignment: MainAxisAlignment.center,
    animationDuration: Duration(milliseconds: 750),
    orientation: axis,
  );
}