import 'package:dev_porfolio/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../class/User.dart';
import '../const/const.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo(
      {Key? key, required this.Width, required this.Heigth, required this.user})
      : super(key: key);
  final double Width;
  final double Heigth;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Heigth,
          width: Width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO MY PORTFOLIO!",
                style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: ThemeColorSecondary),
              ),
              Text(
                user.name,
                style: GoogleFonts.montserrat(
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                    color: ThemeColorSecondary),
              ),
              Text(
                user.bio,
                style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: ThemeColorSecondary),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 50,
                        color: ThemeColorSecondary,
                      ),
                      Text(
                        "Followers",
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: ThemeColorSecondary),
                      ),
                      Text(
                        user.followers.toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: ThemeColorSecondary),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.data_array_outlined,
                        size: 50,
                        color: ThemeColorSecondary,
                      ),
                      Text("Projects",
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: ThemeColorSecondary)),
                      Text(user.publicRepos.toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: ThemeColorSecondary))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 50,
                        color: ThemeColorSecondary,
                      ),
                      Text(
                        "Following",
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: ThemeColorSecondary),
                      ),
                      Text(
                        user.following.toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: ThemeColorSecondary),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Heigth,
          width: Width,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(250),
              child: Image.network(user.avatarUrl),
            ),
          ),
        )
      ],
    );
  }
}
