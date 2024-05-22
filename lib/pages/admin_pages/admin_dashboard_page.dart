import 'package:elo_esports/pages/admin_pages/admin_inprogress_stream_page.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFF160E42),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                child: Text(
                  'Dashborad',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'In Progress Streams',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '80',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Completed Streams',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '46',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Total Users',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
