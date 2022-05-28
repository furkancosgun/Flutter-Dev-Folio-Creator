// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dev_porfolio/customWidgets/ContactWidgert.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dev_porfolio/CustomWidgets/Projects.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import '../CustomWidgets/CustomElevatedBtn.dart';
import '../class/Repos.dart';
import '../class/User.dart';
import '../const/const.dart';
import 'ProfilePage.dart';

User parseUser(String response) {
  return User.fromJson(json.decode(response));
}

Future<User> getUserProfile() async {
  var url = Uri.parse("https://api.github.com/users/$username");

  var cvp = await http.get(url);

  return parseUser(cvp.body);
}

List<Repos> parseRepos(String response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();

  return parsed.map<Repos>((json) => Repos.fromJson(json)).toList();
}

Future<List<Repos>> getUserRepos() async {
  var url = Uri.parse("https://api.github.com/users/$username/repos");

  var cvp = await http.get(url);

  return parseRepos(cvp.body);
}

final ScrollController _controller = ScrollController();
const double _height = 100.0;

void _animateToIndex(int index) {
  _controller.animateTo(
    index * _height,
    duration: Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  );
}

bool val = false;
late User user;
late List<Repos> RepoList;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "< $username />",
            style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: ThemeColorSecondary),
          ),
        ),
        actions: [
          ElvButton(
            onPressed: () => _animateToIndex(0),
            text: "< Home />",
          ),
          ElvButton(
            onPressed: () => _animateToIndex(4),
            text: "< Projects />",
          ),
          ElvButton(
            onPressed: () => _animateToIndex(6),
            text: "< Contact />",
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            val ? Icons.light_mode : Icons.dark_mode,
            color: ThemeColorSecondary,
          ),
          Switch(
            activeColor: ThemeColorSecondary,
            value: val,
            onChanged: (bool? a) {
              setState(() {
                val = a!;
                if (val) {
                  ThemeColor = Colors.white;
                  ThemeColorSecondary = Colors.black;
                } else {
                  ThemeColor = Colors.black;
                  ThemeColorSecondary = Colors.white;
                }
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            FutureBuilder<User>(
              future: getUserProfile(),
              builder: (context, snapshot) {
                user = snapshot.data!;
                if (snapshot.hasData) {
                  return ProfileInfo(
                    user: user,
                    Width: ScreenSize.width / 2,
                    Heigth: ScreenSize.height / 1.5,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "< My Projects />",
              style: GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  color: ThemeColorSecondary),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<List<Repos>>(
              future: getUserRepos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  RepoList = snapshot.data!;
                  return SizedBox(
                    width: ScreenSize.width,
                    height: ScreenSize.height / 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: RepoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Projects(repos: RepoList[index]),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: ThemeColorSecondary),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ElvButton(
              onPressed: () => html.window.open(user.htmlUrl, user.name),
              text: "< SEE MORE! />",
            ),
            FutureBuilder(
              future: getUserProfile(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                user = snapshot.data!;
                return Contact(
                    height: ScreenSize.height / 3.5,
                    width: ScreenSize.width,
                    user: user);
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  0, ScreenSize.height * 0.01, 0, ScreenSize.height * 0.01),
              height: ScreenSize.height * 0.07,
              width: ScreenSize.width,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Developed in 💙 with ",
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: ThemeColorSecondary)),
                    InkWell(
                      onTap: () =>
                          html.window.open("https://github.com/furkannc", ""),
                      child: const Text(
                        "Flutter",
                        style: TitleStyleBlue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
