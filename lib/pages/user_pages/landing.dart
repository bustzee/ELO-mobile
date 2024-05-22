import 'package:elo_esports/models/livestream.dart';
import 'package:elo_esports/models/tutorial.dart';
import 'package:elo_esports/models/twitchstream.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/login.dart';
import 'package:elo_esports/pages/user_widgets/livestream_card_listview.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:elo_esports/pages/user_widgets/tutorial_card_listview.dart';
import 'package:elo_esports/pages/user_widgets/twitchstream_card_listview.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});
  static String id = '/LandingPage';

  final DioClient dioClient = DioClient();

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

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
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (_userDetails == null || _userDetails?.data?.token == null)? Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF322B59),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(13, 11, 13, 9.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5.4, 4),
                          child: Text(
                            'Login now to follow streams and interact with other viewers',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: const Color(0xD9FFFFFF),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 110,
                              height: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xff125900)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size.fromHeight(50)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(0)),
                                    elevation: MaterialStateProperty.all(20),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.blue.shade900),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                    ))),
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginPage.id);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 110,
                              height: 30,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xffB70018)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size.fromHeight(50)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(0)),
                                    elevation: MaterialStateProperty.all(20),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.blue.shade900),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                    ))),
                                onPressed: () {},
                                child: const Text(
                                  'Purchase ELO',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ) : const SizedBox(height: 0,),
                const SizedBox(
                  height: 20,
                ),
                SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    hintText: 'Search streams, streamers, etc',
                    controller: controller,
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF322B59)),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
                
                // LIVESTREAMS SECTION
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Livestreams',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: FutureBuilder<Livestream?>(
                    future: widget.dioClient.getLiveStreams(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      } else {
                        return LivestreamCardListview(livestreams: snapshot.data);
                      }
                    },
                  ),
                ),

                // TWITCHSTREAMS SECTION
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Twitch streams',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: FutureBuilder<Twitchstream?>(
                    future: widget.dioClient.getTwitchStreams(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      } else {
                        return TwitchstreamCardListview(twitchstreams: snapshot.data);
                      }
                    },
                  ),
                ),
        
                // TUTORIALS SECTION
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tutorials',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: FutureBuilder<Tutorial?>(
                    future: widget.dioClient.getTutorial(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      } else {
                        return TutorialCardListview(tutorial: snapshot.data);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}
