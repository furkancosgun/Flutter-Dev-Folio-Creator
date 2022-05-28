import 'package:dev_porfolio/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElvButton extends StatefulWidget {
  const ElvButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final Function() onPressed;
  final String text;
  @override
  State<ElvButton> createState() => _ElvButtonState();
}

class _ElvButtonState extends State<ElvButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            primary: ThemeColor,
            side: BorderSide(color: ThemeColorSecondary),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: ThemeColorSecondary),
          )),
    );
  }
}
