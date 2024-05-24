import 'package:elo_esports/models/user_bet_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class MyBetsPage extends StatefulWidget {
  const MyBetsPage({super.key});
  static String id = '/MyBetsPage';

  @override
  State<MyBetsPage> createState() => MyBetsPageState();
}

class MyBetsPageState extends State<MyBetsPage> {

  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: FutureBuilder<UserBetDetails?>(
                    future: dioClient.getBetbyuserId(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      } else {
                        return BetCardsListPage(userBetDetails: snapshot.data);
                      }
                    },
                  ),
    );
  }
}

// ignore: must_be_immutable
class BetCardsListPage extends StatefulWidget {
  BetCardsListPage({super.key, this.userBetDetails});

  UserBetDetails? userBetDetails;

  @override
  State<BetCardsListPage> createState() => BetCardsListPageState();
}

class BetCardsListPageState extends State<BetCardsListPage> {

  final DioClient dioClient = DioClient();

  claimBet(BuildContext context, int? betMainId, String? gameId, int index) async {
    await dioClient.claimBet(context, betMainId, gameId);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
            'Claimed successfully'),
      ));

    setState(() {
      widget.userBetDetails?.data?.userBets?[index].isClaimed = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: widget.userBetDetails?.data?.userBets?.length,
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
                          widget.userBetDetails?.data?.userBets?[index].betDetails?.betType ?? '--',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          widget.userBetDetails?.data?.userBets?[index].betDetails?.betFor ?? '--',
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
                        const SizedBox(
                          height: 10,
                        ),
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
                          widget.userBetDetails?.data?.userBets?[index].betDetails?.betAgainst ?? '--',
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
                        const SizedBox(
                          height: 15,
                        ),
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
                                  widget.userBetDetails?.data?.userBets?[index].betDetails?.winningAmount ?? '--',
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
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(widget.userBetDetails?.data?.userBets?[index].isClaimed == 1 ? Color(0xffB70018) : Color(0xff125900)),
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
                                onPressed: () {
                                  if(widget.userBetDetails?.data?.userBets?[index].isClaimed == 0) {
                                    claimBet(context, widget.userBetDetails?.data?.userBets?[index].betMainId, widget.userBetDetails?.data?.userBets?[index].gameId, index);
                                  }
                                },
                                child: Text(
                                  widget.userBetDetails?.data?.userBets?[index].isClaimed == 1 ? 'Already claimed' : 'Claim bet',
                                  style: const TextStyle(
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
      );
  }
  
}