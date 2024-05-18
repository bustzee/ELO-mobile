import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/user_pages/user_dashboard.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final DioClient dioClient = DioClient();

  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    UserDetails? userDetails = await dioClient.getUserDetails(context, emailController.text, passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Logged in successfully'),
    ));

    if(userDetails != null) {
      SharedPreferencesService.setUserDetails(userDetails);
    }

    Navigator.pushNamed(context, UserDashboardPage.id);
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            fillColor: Color.fromARGB(255, 80, 80, 80),
                            filled: true,
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(
                              fontSize: 10,
                            )
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                      ),

                      const SizedBox(height: 20,),

                      Text(
                        'Password',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      TextFormField(
                          obscureText: _obscureText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            fillColor: const Color.fromARGB(255, 80, 80, 80),
                            filled: true,
                            hintText: 'Enter password',
                            hintStyle: const TextStyle(
                              fontSize: 10,
                            ),
                            suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: IconButton(
                              icon: Icon(
                                _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                                color: Colors.grey.shade800,
                                ),
                                onPressed: () {
                                  setState(() {
                                      _obscureText = !_obscureText;
                                  });
                                },
                              ),
                          ),
                          ),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                      ),

                      const SizedBox(height: 20,),

                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0F38CD)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                            padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                            elevation: MaterialStateProperty.all(20),
                            overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              )
                            )
                          ),
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Text(
                    'Do not have an account yet ?\nRegister now',
                    textAlign: TextAlign.center,
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
