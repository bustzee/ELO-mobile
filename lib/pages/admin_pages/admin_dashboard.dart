import 'package:elo_esports/pages/admin_pages/admin_livestream.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static String id = '/AdminDashboard';

  @override
  State<StatefulWidget> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF160E42),
        body: PrintValue(printtext: 'Admin Dashborad'),
      ),
    );
  }
}
