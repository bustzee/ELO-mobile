import 'package:elo_esports/models/livestream.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';

class AdminLivestream extends StatelessWidget {
  AdminLivestream({super.key});

  final DioClient dioClient = DioClient();

  @override
  Widget build(Object context) {
    return Scaffold(
        backgroundColor: const Color(0xff160E42),
        body: FutureBuilder<Livestream?>(
          future: dioClient.getLiveStreams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            } else {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      width: 500,
                      height: 270,
                      decoration: const BoxDecoration(
                          color: Color(0xFF25275A),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 11, 158, 48),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 2, 15, 2),
                                      child: PrintValue(
                                          printtext: snapshot.data
                                                  ?.livestreams?[index].type ??
                                              '--')),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: TitleText(printtext: 'Stream Name')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                            child: PrintValue(
                                printtext:
                                    snapshot.data?.livestreams?[index].name ??
                                        '--'),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: TitleText(printtext: 'Email')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                            child: PrintValue(
                                printtext: snapshot.data?.livestreams?[index]
                                        .user?.email ??
                                    '--'),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: TitleText(printtext: 'Username')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                            child: PrintValue(
                                printtext: snapshot.data?.livestreams?[index]
                                        .user?.username ??
                                    '--'),
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 5),
                                  child: TitleText(printtext: 'Start Date : ')),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 15, 5),
                                child: PrintValue(
                                    printtext: '	2024-05-18 10:12:07 AM'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 5),
                                  child: TitleText(printtext: 'End Date : ')),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 15, 5),
                                child: PrintValue(
                                    printtext: '2024-05-18 12:30:12 AM'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 35,
                                  child: CommonBtn(
                                    btnName: 'Visit',
                                    backgroundColor:
                                        const Color.fromARGB(255, 4, 124, 8),
                                    callback: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 35,
                                  child: CommonBtn(
                                    btnName: 'View',
                                    backgroundColor: Colors.blue,
                                    callback: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 95,
                                  height: 35,
                                  child: CommonBtn(
                                    btnName: 'Add Delay',
                                    backgroundColor:
                                        const Color.fromARGB(255, 199, 111, 10),
                                    callback: () {},
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
