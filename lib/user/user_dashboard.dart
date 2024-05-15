import 'package:elo_esports/user/landing.dart';
import 'package:elo_esports/user/menu.dart';
import 'package:elo_esports/user/my_bets.dart';
import 'package:elo_esports/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});
  static String id = '/UserDashboardPage';

  @override
  State<UserDashboardPage> createState() => UserDashboardPageState();
}

class UserDashboardPageState extends State<UserDashboardPage> {

  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const LandingPage(),
    const MyBetsPage(),
    const ProfilePage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xff160E42),
        body: SafeArea(
          child: _tabs[_selectedIndex],
        ),
        bottomNavigationBar:  GNav(
          color: Colors.white,
          activeColor: Colors.white,
          backgroundColor: const Color(0xFF322B59),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          gap: 10,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.history,
              text: 'History',
            ),
            GButton(
              icon: LineIcons.userCircle,
              text: 'Profile',
            ),
            GButton(
              icon: LineIcons.bars,
              text: 'Menu',
            )
          ],
          selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                 _selectedIndex = index;
                });
          },
        ),
      );
  }
}
