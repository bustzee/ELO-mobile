import 'package:elo_esports/welcome.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(int.parse('#0F50A6'.substring(1, 7), radix: 16) + 0xFF000000)),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => const WelcomePage(),
        // LoginPage.id: (context) => const LoginPage(),
        // ScannerPage.id: (context) => const ScannerPage(),
        // FilesPage.id: (context) => const FilesPage(),
        // DashboardPage.id: (context) => const DashboardPage()
      },
    );
  }
}