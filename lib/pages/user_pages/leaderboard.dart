import 'package:elo_esports/models/leaderboard.dart';
import 'package:elo_esports/models/twitch_leaderboard.dart';
import 'package:elo_esports/models/withdrawal.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/network/endpoints.dart';
import 'package:elo_esports/pages/user_pages/livestream.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});
  static String id = '/LeaderboardPage';

  @override
  State<LeaderboardPage> createState() => LeaderboardPageState();
}

class LeaderboardPageState extends State<LeaderboardPage> {
  final DioClient dioClient = DioClient();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff160E42),
        appBar: AppBar(
          backgroundColor: const Color(0xFF322B59),
          title: Text(
            'Leaderboard',
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
              Tab(
                icon: LineIcon(LineIcons.barChartAlt),
                text: 'Leaderboard',
              ),
              Tab(
                icon: LineIcon(LineIcons.barChartAlt),
                text: 'Twitch Leaderboard',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            FutureBuilder<Leaderboard?>(
                future: dioClient.getHomeLeaderBoardStreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else {
                    return LeaderboardList(leaderboard: snapshot.data);
                  }
                }),

            // TWITCH
             FutureBuilder<TwitchLeaderboard?>(
                future: dioClient.getTwitchLeaderBoardStreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else {
                    return TwitchLeaderboardList(leaderboard: snapshot.data);
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LeaderboardList extends StatelessWidget {
  LeaderboardList({super.key, this.leaderboard});

  Leaderboard? leaderboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: leaderboard?.data?.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
            width: 150,
            child: InkWell(
              onTap: () {},
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Row(
                  children: [
                     Container(
                       height: 110,
                       width: 150,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: NetworkImage(
                             Endpoints.baseURL + (leaderboard?.data?[index].image ?? '--'),
                           ),
                           fit: BoxFit.cover,
                         ),
                       ),
                       child: Image.network(
                         Endpoints.baseURL + (leaderboard?.data?[index].image ?? '--'),
                         fit: BoxFit.cover,
                         errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                           return Image.asset(
                             'assets/images/game_thumbnail_dummy.png',
                             fit: BoxFit.cover,
                           );
                         },
                       ),
                     ),
                     const SizedBox(width: 20,),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          leaderboard?.data?[index].name ?? '--',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Viewers : ${leaderboard?.data?[index].viewCounter ?? '--'}',
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
                        Text(
                          'Likes : ${leaderboard?.data?[index].likeCount ?? '--'}',
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
                        Text(
                          'Pot amount : ${leaderboard?.data?[index].potAmount ?? '--'}',
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
                      ],
                     )
                  ]
                ),
              ),
            ),
          );
          }),
    );
  }
}


// ignore: must_be_immutable
class TwitchLeaderboardList extends StatelessWidget {
  TwitchLeaderboardList({super.key, this.leaderboard});

  TwitchLeaderboard? leaderboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: leaderboard?.data?.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
            width: 150,
            child: InkWell(
              onTap: () {},
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Row(
                  children: [
                     Container(
                       height: 110,
                       width: 150,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: NetworkImage(
                             leaderboard?.data?[index].stream?.thumbnailUrl?.replaceAll('{width}', '150').replaceAll('{height}', '150') ?? '',
                           ),
                           fit: BoxFit.cover,
                         ),
                       ),
                       child: Image.network(
                        leaderboard?.data?[index].stream?.thumbnailUrl?.replaceAll('{width}', '150').replaceAll('{height}', '150') ?? '',
                         fit: BoxFit.cover,
                         errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                           return Image.asset(
                             'assets/images/game_thumbnail_dummy.png',
                             fit: BoxFit.cover,
                           );
                         },
                       ),
                     ),
                     const SizedBox(width: 20,),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            leaderboard?.data?[index].stream?.title ?? '--',
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
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Viewers : ${leaderboard?.data?[index].stream?.viewerCount ?? '--'}',
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
                        Text(
                          'Likes : ${leaderboard?.data?[index].likeCount ?? '--'}',
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
                        Text(
                          'Pot amount : ${leaderboard?.data?[index].potAmount ?? '--'}',
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
                      ],
                     )
                  ]
                ),
              ),
            ),
          );
          }),
    );
  }
}
