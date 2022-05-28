// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import '../class/User.dart';
import '../const/const.dart';

class Contact extends StatelessWidget {
  const Contact(
      {Key? key, required this.height, required this.width, required this.user})
      : super(key: key);
  final double height;
  final double width;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ThemeColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ThemeColorSecondary,
              offset: const Offset(3, 3),
            ),
            BoxShadow(
              color: ThemeColorSecondary,
              offset: const Offset(-1, -1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "< CONTACT TO ME />",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: ThemeColorSecondary),
            ),
            const SizedBox(
              height: 20,
            ),
            user.email != null
                ? InkWell(
                    onTap: () =>
                        html.window.open("mailto:${user.email}", "Email"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${user.email}",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: ThemeColorSecondary),
                        ),
                      ],
                    ),
                  )
                : const Text(""),
            user.twitterUsername != null
                ? InkWell(
                    onTap: () => html.window.open(
                        'https://twitter.com/${user.twitterUsername}',
                        "Twitter"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.message_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${user.twitterUsername}",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: ThemeColorSecondary),
                        ),
                      ],
                    ),
                  )
                : const Text(""),
            user.blog != null
                ? InkWell(
                    onTap: () => html.window.open(user.blog, "Blog"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.web_asset),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.blog,
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: ThemeColorSecondary),
                        ),
                      ],
                    ),
                  )
                : const Text(""),
            user.location != null
                ? InkWell(
                    onTap: () => html.window.open(
                        'https://www.google.com/maps/place/${user.location}',
                        "Location"),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              IconData(0xe3ab, fontFamily: 'MaterialIcons')),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.location,
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: ThemeColorSecondary),
                          ),
                        ]),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
