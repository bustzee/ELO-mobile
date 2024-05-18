import 'package:elo_esports/user/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static String id = '/WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

   @override
    void didChangeDependencies() {
      // Adjust the provider based on the image type
      // precacheImage(const AssetImage('assets/images/login_banner.jpg'), context);
      super.didChangeDependencies();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(image: AssetImage('assets/images/splash_banner.png')),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text(
                    'Level up your\ngaming thrills',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      letterSpacing: -0.4,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text(
                    'The Bettor Sport Network for live racing, sports wagering insigts, and analysis from top personalities',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: -0.4,
                       color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 100.0, right: 100.0, top: 10, bottom: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all(const Size.fromHeight(50)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                        elevation: MaterialStateProperty.all(20),
                        overlayColor:
                            MaterialStateProperty.all(Colors.blue.shade900),
                        side:  MaterialStateProperty.all(const BorderSide(
                          width: 3.0,
                          color: Colors.red,
                        ),)
                      ),
                    onPressed: () {
                      Navigator.pushNamed(context, UserDashboardPage.id);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text(
                    'Skip and visit livestreams',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: -0.4,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
                const Image(
                    image: AssetImage('assets/images/splash_bottom_banner.png'))
              ]
            ),
        ),
      ),
    );
  }
}
