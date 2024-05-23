import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/pages/user_pages/landing.dart';
import 'package:elo_esports/pages/user_pages/menu.dart';
import 'package:elo_esports/pages/user_pages/my_bets.dart';
import 'package:elo_esports/pages/user_pages/profile.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
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

  UserDetails? _userDetails;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    _userDetails = await SharedPreferencesService.getUserDetails();
    setState(() {});
  }

  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    LandingPage(),
    const MyBetsPage(),
    const ProfilePage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          tabs: [
            const GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            if(_userDetails != null && _userDetails?.data?.token != null) const GButton(
              icon: LineIcons.history,
              text: 'History',
            ),
            if(_userDetails != null && _userDetails?.data?.token != null) const GButton(
              icon: LineIcons.userCircle,
              text: 'Profile',
            ),
            const GButton(
              icon: LineIcons.bars,
              text: 'Menu',
            )
          ],
          selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  if(_selectedIndex == 3) {
                    _selectedIndex = 0;
                  } else {
 _selectedIndex = index;
                  }
                });
          },
        ),
      );
  }
}
