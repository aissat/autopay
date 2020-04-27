import 'package:autopay/generated/locale_key.g.dart';
import 'package:autopay/screens/custom_button.dart';
import 'package:autopay/screens/home_view.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditCardView extends StatefulWidget {
  @override
  _CreditCardViewState createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //   height: 40,
          // ),
          Spacer(flex: 1),
          Text(
            LocaleKeys.credit_card_title,
            style: Theme.of(context).textTheme.headline6,
          ).tr(),
          Spacer(flex: 1),
          // SizedBox(
          //   height: 40,
          // ),
          CreditCard(
            cardNumber: cardNumber,
            cardExpiry: expiryDate,
            cardHolderName: cardHolderName,
            cvv: cvv,
            bankName: "Riyad Bank",
            cardType: CardType.visa,
            showBackSide: showBack,
            frontBackground: CardBackgrounds.black,
            backBackground: CardBackgrounds.black,
            showShadow: true,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Card Number",
                  prefixIcon: Icon(FontAwesomeIcons.creditCard)),
              maxLength: 19,
              onChanged: (value) {
                setState(() {
                  cardNumber = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Card Expiry",
                  prefixIcon: Icon(FontAwesomeIcons.calendarAlt)),
              maxLength: 5,
              onChanged: (value) {
                setState(() {
                  expiryDate = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Card Holder Name",
                  prefixIcon: Icon(FontAwesomeIcons.user)),
              onChanged: (value) {
                setState(() {
                  cardHolderName = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "CVV", prefixIcon: Icon(FontAwesomeIcons.key)),
              maxLength: 3,
              onChanged: (value) {
                setState(() {
                  cvv = value;
                });
              },
              focusNode: _focusNode,
            ),
          ),
          Spacer(flex: 1),
          CustomButton(
            onPressed: () {
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => HomeView(isActivate: true,), fullscreenDialog: true));
            },
            title: LocaleKeys.credit_card_str_btn_add,
            color: Colors.blue,
            borderColor: Colors.blue,
            textColor: Colors.white,
          ),

          Spacer(flex: 4),
        ],
      ),
    );
  }
}
