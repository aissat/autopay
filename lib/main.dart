
import 'package:autopay/screens/main_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'DZ'),
    ],
    startLocale: Locale('ar', 'DZ'),
    path: 'i18n', 
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AutoPay',
      localizationsDelegates:EasyLocalization.of(context).delegates,
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          disabledColor: Colors.grey,
          // cardColor: Colors.white,
          // canvasColor: Colors.grey[50],
          brightness: Brightness.light,
          textTheme:GoogleFonts.alefTextTheme(),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)
          ),
        ),
      home:MainView() ,
    );
  }
}