import 'package:elo_esports/pages/admin_pages/admin_account_page.dart';
import 'package:elo_esports/pages/login.dart';
import 'package:elo_esports/pages/register.dart';
import 'package:elo_esports/pages/user_pages/create_stream.dart';
import 'package:elo_esports/pages/user_pages/landing.dart';
import 'package:elo_esports/pages/user_pages/leaderboard.dart';
import 'package:elo_esports/pages/user_pages/livestream.dart';
import 'package:elo_esports/pages/user_pages/profile.dart';
import 'package:elo_esports/pages/user_pages/user_dashboard.dart';
import 'package:elo_esports/pages/user_pages/withdraw_deposit.dart';
import 'package:elo_esports/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ELO ESports',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(
                int.parse('#0F50A6'.substring(1, 7), radix: 16) + 0xFF000000),
            brightness: Brightness.dark),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        AdminAccount.id: (context) => const AdminAccount(),
        UserDashboardPage.id: (context) => const UserDashboardPage(),
        LivestreamPage.id: (context) => LivestreamPage(),
        CreateStreamPage.id: (context) => const CreateStreamPage(),
        WithdrawDepositPage.id: (context) => const WithdrawDepositPage(),
        LeaderboardPage.id: (context) => const LeaderboardPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        LandingPage.id: (context) => LandingPage(),
      },
    );
  }
}
