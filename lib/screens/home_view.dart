import 'package:autopay/generated/locale_key.g.dart';
import 'package:autopay/screens/credit_card_view.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  final bool isActivate;
  const HomeView({Key key, this.isActivate = false}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    print(widget.isActivate);
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions(BuildContext context) => <Widget>[
        Stack(
          children: [
            Container(
              child: Image.asset(
                "assets/images/bg.png",
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Container(
                      height: 80,
                      width: 80,
                      child: ClipOval(
                        child: Image.asset('assets/images/p.png'),
                      )),
                  Spacer(flex: 1),
                  !widget.isActivate
                      ? Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Card(
                              child: FlatButton.icon(
                                  onPressed: onPressedAdd,
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 32,
                                  ),
                                  label: Text(""))))
                      : CreditCard(
                          cardNumber: "5450 7879 4864 7854",
                          cardExpiry: "10/25",
                          cardHolderName: "AISSAT Abdelwahab",
                          cvv: "456",
                          bankName: "Riyad Bank",
                          cardType: CardType.visa,
                          showBackSide: false,
                          frontBackground: CardBackgrounds.black,
                          backBackground: CardBackgrounds.white,
                          showShadow: true,
                        ),
                  widget.isActivate
                      ? ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Text(
                                  "Recent Operation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(fontSize: 18),
                                )),
                            buildSwitchListTileMenuItem(
                              context: context,
                              title: 'Operation Nome 1',
                              trailing: "-20 RS",
                              icon: FontAwesomeIcons.store,
                            ),
                            buildDivider(),
                            buildSwitchListTileMenuItem(
                              context: context,
                              title: 'Operation Nome 2 ',
                              trailing: "-100 RS",
                              icon: FontAwesomeIcons.cartPlus,
                            ),
                            buildDivider(),
                            buildSwitchListTileMenuItem(
                              context: context,
                              title: 'Operation Nome 3',
                              trailing: "-70 RS",
                              icon: FontAwesomeIcons.cartArrowDown,
                            ),
                          ],
                        )
                      : ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: Text(
                                  "Recent Operation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(fontSize: 18),
                                )),
                          ],
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  Spacer(flex: 6),
                ],
              ),
            ),
          ],
        ),
        Text(
          'Index 1: ${LocaleKeys.nav_bar_str_scan.tr()}',
          style: optionStyle,
        ),
        ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: ListTile(
                dense: true,
                leading: ClipOval(
                  child: Image.asset('assets/images/p.png'),
                ),
                title: Text(
                  "Aissat Abdelwahab",
                ),
                trailing: Icon(FontAwesomeIcons.powerOff),
              ),
            ),
            SizedBox(height: 30),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'credit',
              icon: FontAwesomeIcons.creditCard,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'Change Credit Card',
              icon: FontAwesomeIcons.solidCreditCard,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'language',
              icon: FontAwesomeIcons.language,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'My Store',
              icon: FontAwesomeIcons.store,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'help',
              icon: FontAwesomeIcons.question,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'info',
              icon: FontAwesomeIcons.info,
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
              context: context,
              title: 'Contact us',
              icon: FontAwesomeIcons.phone,
            ),
            buildDivider(),
          ],
        )
      ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onPressedAdd() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CreditCardView(), fullscreenDialog: true));
  }

  Container buildDivider() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Divider(
          color: Colors.grey,
        ),
      );
  Container buildSwitchListTileMenuItem(
      {BuildContext context,
      String title,
      IconData icon,
      String trailing = ""}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          leading: Icon(icon),
          trailing: Text(
            trailing,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isActivate);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(LocaleKeys.app_name.tr(), style: Theme.of(context).textTheme.bodyText1,),
      // ),
      body: Center(
        child: _widgetOptions(context).elementAt(_selectedIndex),
      ),

      bottomNavigationBar: FancyBottomNavigation(tabs: [
        TabData(
            iconData: FontAwesomeIcons.home,
            title: LocaleKeys.nav_bar_str_home.tr()),
        TabData(
            iconData: FontAwesomeIcons.qrcode,
            title: LocaleKeys.nav_bar_str_scan.tr()),
        TabData(
            iconData: FontAwesomeIcons.cog,
            title: LocaleKeys.nav_bar_str_setting.tr())
      ], onTabChangedListener: _onItemTapped),
    );
  }
}
