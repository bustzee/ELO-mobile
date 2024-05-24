import 'package:elo_esports/models/admin_betting_master_list.dart';
import 'package:elo_esports/models/betting_view_master.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_pages/admin_create_betting_view_master_page.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminBettingViewMasterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminBettingViewMasterState();
}

class _AdminBettingViewMasterState extends State<AdminBettingViewMasterPage> {
  final DioClient dioClient = DioClient();
  int? masterId = 0;

  deleteBettingViewMaster() async {
    await dioClient.DeleteBettingViewMasterRecord(context, masterId!);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Betting view details deleted successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160E42),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Betting View Master',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: FutureBuilder<BettingViewMaster?>(
                future: dioClient.GetListOfBettingViewMaster(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 500,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          decoration: const BoxDecoration(
                              color: Color(0xFF322B59),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleText(printtext: 'No. Of Views'),
                                        PrintValue(
                                            printtext: snapshot.data
                                                    ?.data?[index].noOfViews
                                                    .toString() ??
                                                '--'),
                                        Container(
                                          height: 10,
                                        ),
                                        TitleText(printtext: 'No. Of Bets'),
                                        PrintValue(
                                            printtext: snapshot
                                                    .data?.data?[index].noOfBet
                                                    .toString() ??
                                                '--'),
                                        Container(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            height: 35,
                                            child: CommonBtn(
                                              btnName: 'Edit',
                                              callback: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdminCreateBettingViewMasterPage(
                                                              viewbetting:
                                                                  snapshot.data
                                                                          ?.data?[
                                                                      index])),
                                                );
                                              },
                                            )),
                                        Container(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          height: 35,
                                          child: CommonBtn(
                                            btnName: 'Delete',
                                            backgroundColor: Colors.red,
                                            callback: () {
                                              masterId = snapshot
                                                  .data?.data?[index].id;
                                              _dialogBuilder(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TitleText(printtext: 'Created Date'),
                                PrintValue(
                                    printtext: DateFormat('yyyy-MM-dd hh:mm a')
                                            .format(snapshot.data?.data?[index]
                                                    .createdAt ??
                                                DateTime.now()) ??
                                        '--'),
                              ],
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
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF322B59),
          title: PrintValue(printtext: 'Delete Betting View Details'),
          content: Container(
            height: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleText(printtext: 'Do you want to delete this record.')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
                width: 100,
                height: 35,
                child: CommonBtn(
                    btnName: 'Yes Delete',
                    backgroundColor: Colors.red,
                    callback: () {
                      deleteBettingViewMaster();
                      Navigator.of(context).pop();
                    })),
          ],
        );
      },
    );
  }
}
