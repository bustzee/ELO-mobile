import 'package:elo_esports/user/landing.dart';
import 'package:elo_esports/user/menu.dart';
import 'package:elo_esports/user/my_bets.dart';
import 'package:elo_esports/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class LivestreamPage extends StatefulWidget {
  const LivestreamPage({super.key});
  static String id = '/LivestreamPage';

  @override
  State<LivestreamPage> createState() => LivestreamPageState();
}

class LivestreamPageState extends State<LivestreamPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff160E42)
        
      );
  }
}
