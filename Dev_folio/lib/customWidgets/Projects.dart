// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import '../class/Repos.dart';
import '../const/const.dart';

class Projects extends StatelessWidget {
  const Projects({
    Key? key,
    required this.repos,
  }) : super(key: key);
  final Repos repos;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => html.window.open(repos.htmlUrl ?? "", repos.name ?? ""),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              color: ThemeColorSecondary,
            ),
            BoxShadow(
              offset: const Offset(-1, -1),
              color: ThemeColorSecondary,
            ),
          ],
          color: ThemeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              repos.name ?? "",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: ThemeColorSecondary),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              repos.description == null ? "" : repos.description.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: ThemeColorSecondary),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: ThemeColorSecondary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  repos.stargazersCount.toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: ThemeColorSecondary),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: ThemeColorSecondary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  repos.watchersCount.toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: ThemeColorSecondary),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.share_sharp,
                  color: ThemeColorSecondary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  repos.forksCount.toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: ThemeColorSecondary),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              repos.language ?? "",
              style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: ThemeColorSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
