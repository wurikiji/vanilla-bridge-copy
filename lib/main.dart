import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants/colors.dart';
import 'screens/discover_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: AppMain(),
    );
  }
}

class AppMain extends StatefulWidget {
  @override
  AppMainState createState() {
    return new AppMainState();
  }
}

class AppMainState extends State<AppMain> {
  int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavBarItem(
            FontAwesomeIcons.heart,
            "디스커버",
            active: FontAwesomeIcons.heartbeat,
          ),
          _buildNavBarItem(
            FontAwesomeIcons.bookmark,
            "나의주선",
            active: FontAwesomeIcons.solidBookmark,
          ),
          _buildNavBarItem(
            FontAwesomeIcons.comments,
            "대화방",
            active: FontAwesomeIcons.solidComments,
          ),
          _buildNavBarItem(
            FontAwesomeIcons.user,
            "커뮤니티",
            active: FontAwesomeIcons.users,
          ),
          _buildNavBarItem(
            FontAwesomeIcons.newspaper,
            "꿀팁",
            active: FontAwesomeIcons.bookOpen,
          ),
        ],
        currentIndex: navigationIndex,
        onTap: (idx) => setState(() => navigationIndex = idx),
        type: BottomNavigationBarType.fixed,
      ),
      body: const VanillaDiscoverMain(),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String title,
      {IconData active}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: VanillaMainColor,
      ),
      title: Text(
        title,
        style: TextStyle(color: VanillaMainColor),
      ),
      activeIcon: Icon(
        active ?? icon,
        color: VanillaMainColor,
      ),
    );
  }
}
