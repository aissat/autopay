import 'package:autopay/generated/locale_key.g.dart';
import 'package:autopay/screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'custom_button.dart';


class MainView extends StatelessWidget {
  const MainView({Key key}) : super(key: key);
  void onPressedAr(BuildContext context){
    EasyLocalization.of(context).locale = EasyLocalization.of(context).supportedLocales.last;
    Navigator.push(context,MaterialPageRoute(builder:(_)=> LoginView() ));
  }
  void onPressedEn(BuildContext context){
    EasyLocalization.of(context).locale = EasyLocalization.of(context).supportedLocales.first;
    Navigator.push(context,MaterialPageRoute(builder:(_)=> LoginView() ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.str_choose_lang,style: Theme.of(context).textTheme.headline6,).tr(),
            SizedBox(height: 30,),
            CustomButton(onPressed: ()=>onPressedAr(context), title: LocaleKeys.str_ar, borderColor: Colors.blue, textColor: Colors.black,),
            CustomButton(onPressed: ()=>onPressedEn(context), title: LocaleKeys.str_en, borderColor: Colors.blue, textColor: Colors.black,),
            
          ],
        ),
      ),
    );
  }
}
