import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/pages/admin_pages/admin_account_page.dart';
import 'package:elo_esports/pages/user_pages/create_stream.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  static String id = '/MenuPage';

  @override
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff160E42),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF322B59),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _userDetails?.data?.user?.imageLink ??
                                          '--'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _userDetails?.data?.user?.username ?? '--',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                letterSpacing: -0.4,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Stream key :\n${_userDetails?.data?.user?.streamKey ?? '--'}',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: -0.4,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.home),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Home',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                if (_userDetails != null &&
                    _userDetails?.data?.token != null &&
                    _userDetails?.data?.user?.userType == 'admin')
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AdminAccount.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(LineIcons.home),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Admin panel',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_userDetails != null && _userDetails?.data?.token != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(LineIcons.userCircle),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'My profile',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                if (_userDetails != null && _userDetails?.data?.token != null)
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CreateStreamPage.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(LineIcons.userCircle),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Create stream',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_userDetails != null && _userDetails?.data?.token != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(LineIcons.gavel),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Betting history',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.barChart),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Leaderboard',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                if (_userDetails != null && _userDetails?.data?.token != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(LineIcons.wallet),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Deposits and withdrawals',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.fileContract),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Privacy policy',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.fileContract),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Terms & conditions',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.questionCircle),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Frequently asked questions',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(LineIcons.photoVideo),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Tutorials',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
