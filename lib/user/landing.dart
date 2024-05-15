import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static String id = '/LandingPage';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void didChangeDependencies() {
    // Adjust the provider based on the image type
    // precacheImage(const AssetImage('assets/images/login_banner.jpg'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff160E42),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                                  onPressed: () {},
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      hintText: 'Search streams, streamers, etc',
                      controller: controller,
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFF322B59)),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Streams leaderboard',
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              color: const Color(0xFF322B59),
                              shape: const RoundedRectangleBorder(),
                              child: Column(
                                children: [
                                  Container(
                                    height: 110,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      color: Colors.greenAccent,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/game_thumbnail_dummy.png'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'Call of Duty: Vanguard Activision Vanguard Activision',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
