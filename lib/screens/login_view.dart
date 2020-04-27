import 'package:autopay/generated/locale_key.g.dart';
import 'package:autopay/screens/custom_button.dart';
import 'package:autopay/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void onPressedLogin(){
    Navigator.push(context,MaterialPageRoute(builder:(_)=> HomeView() ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(flex:1),
            Text(LocaleKeys.str_login_title,style: Theme.of(context).textTheme.headline3,).tr(context: context),
            Spacer(flex:1),
            buildTextField(title: LocaleKeys.str_name),
            buildTextField(title: LocaleKeys.str_pass),
            SizedBox(height:20),
            Text(LocaleKeys.str_frgt_pass,style: Theme.of(context).textTheme.bodyText1,).tr(context: context),
            SizedBox(height:20),
            CustomButton(
              onPressed: onPressedLogin,
              title: LocaleKeys.str_btn_login,
              borderColor: Colors.blue,
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height:20),
            Row(children: <Widget>[
              Expanded(child: Container(child: Divider(thickness:1), padding: EdgeInsets.symmetric(horizontal:8),)),
              Text(LocaleKeys.str_lbl_or.tr().toUpperCase(),style: Theme.of(context).textTheme.bodyText1,),
              Expanded(child: Container(child: Divider(thickness:1), padding: EdgeInsets.symmetric(horizontal:8),)),
            ]),
            SizedBox(height:20),
            Text(LocaleKeys.str_lbl_singup, style: Theme.of(context).textTheme.bodyText1,).tr(context: context),
            Spacer(flex:2),

          ],
        ),
      ),
    );
  }

  Widget buildTextField({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: const Icon(Icons.person),
          hintText:  title.tr(),
        ),
      ),
    );
  }
}
