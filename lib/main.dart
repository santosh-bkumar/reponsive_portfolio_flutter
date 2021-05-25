import 'package:ali_portfolio/constants/appcolors.dart';
import 'package:ali_portfolio/ui/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle style = SystemUiOverlayStyle.light.copyWith(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: AppColors.blueish,
  systemNavigationBarColor: AppColors.colorBlue,
  statusBarBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: AppColors.blueish
);


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(style);
    return MaterialApp(
      title: 'Ali\'s Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.blueish,
        fontFamily: 'Monti'
      ),
      home: HomeView(),
    );
  }
}
