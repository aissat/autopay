import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String title;
  final Color textColor;
  final Color borderColor;
  const CustomButton({
    Key key,
    @required this.onPressed,
    this.title, this.color, this.textColor, this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227,
      height: 42,
      margin: EdgeInsets.only(bottom: 20),
      child: FlatButton(
        onPressed: onPressed,
        color: color ??  Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.grey,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        padding: EdgeInsets.all(0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
           GoogleFonts.alef(color: textColor ?? Colors.grey.shade500,fontWeight: FontWeight.w500,fontSize: 16,)
          // GoogleFonts.getFont("Montserrat",
          //   color: textColor ?? Colors.grey.shade500,
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          // ),
        ).tr(),
      ),
    );
  }
}
