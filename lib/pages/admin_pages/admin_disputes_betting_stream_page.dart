import 'package:elo_esports/models/betting_disputes.dart';
import 'package:elo_esports/models/reported_streams.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminDisputesBettingStreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminDisputesBettingStreamState();
}

class _AdminDisputesBettingStreamState
    extends State<AdminDisputesBettingStreamPage> {
  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160E42),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Streams Betting Disputes',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: FutureBuilder<BettingDisputes?>(
              future: dioClient.GetBettingDisputes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          width: 500,
                          decoration: const BoxDecoration(
                              color: Color(0xFF322B59),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(printtext: 'Strem Name'),
                                PrintValue(printtext: '--'),
                                Container(
                                  height: 10,
                                ),
                                TitleText(printtext: 'Username'),
                                PrintValue(printtext: '--'),
                                Container(
                                  height: 10,
                                ),
                                TitleText(printtext: 'Bet'),
                                PrintValue(printtext: '--'),
                                Container(
                                  height: 10,
                                ),
                                Container(
                                  height: 10,
                                ),
                                TitleText(printtext: 'Dispute For'),
                                PrintValue(
                                    printtext: snapshot
                                            .data?.data?[index].disputeFor ??
                                        '--'),
                                Container(
                                  height: 10,
                                ),
                                TitleText(printtext: 'Remark'),
                                PrintValue(
                                    printtext:
                                        snapshot.data?.data?[index].remark ??
                                            '--'),
                                Container(
                                  height: 10,
                                ),
                                TitleText(printtext: 'Created Date'),
                                PrintValue(
                                    printtext: snapshot
                                            .data?.data?[index].createdAt
                                            .toString() ??
                                        '--'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
