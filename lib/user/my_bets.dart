import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class MyBetsPage extends StatefulWidget {
  const MyBetsPage({super.key});
  static String id = '/MyBetsPage';

  @override
  State<MyBetsPage> createState() => MyBetsPageState();
}

class MyBetsPageState extends State<MyBetsPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: const Color(0xff160E42),
      appBar: AppBar(
        backgroundColor: const Color(0xFF322B59),
        title: Text(
            'My Bets',
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
        bottom: const TabBar(
          tabs: [
            Tab(icon: LineIcon(LineIcons.gavel), text: 'Confirmed',),
            Tab(icon: LineIcon(LineIcons.pauseCircle), text: 'Pending',),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TabBarView(
          children: [
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              color: const Color(0xFF322B59),
                              shape: const RoundedRectangleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Basic',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Team A to win: 2.00',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),

                                    const SizedBox(height: 10,),

                                    Text(
                                      'For',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Virat will score Century in the second inning itself',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),

                                    const SizedBox(height: 10,),

                                    Text(
                                      'Against',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Virat will be ducked in the second inning itself',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: -0.4,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),

                                    const SizedBox(height: 15,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Winning Amount',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: -0.4,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              '1000K',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                letterSpacing: -0.4,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Active Hours',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: -0.4,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              '603:13:00',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                letterSpacing: -0.4,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                              width: 100,
                                              height: 40,
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
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(5)),
                                                    ))),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Claim bet',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    ),
  );
  }
}
