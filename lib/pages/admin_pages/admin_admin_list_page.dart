import 'package:elo_esports/models/admin_userdetails.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../network/dio_client.dart';

class AdminAdminList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminAdminListState();
}

class _AdminAdminListState extends State<AdminAdminList> {
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
              'Admin List',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: FutureBuilder<AdminUserdetails?>(
              future: dioClient.getUsersList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.users?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          width: 500,
                          height: 200,
                          decoration: const BoxDecoration(
                              color: Color(0xFF322B59),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 10, 15, 0),
                                            child: TitleText(
                                                printtext: 'First Name')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot
                                                      .data
                                                      ?.users?[index]
                                                      .firstName ??
                                                  '--'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 10, 15, 0),
                                            child: TitleText(
                                                printtext: 'Last Name')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot
                                                      .data
                                                      ?.users?[index]
                                                      .lastName ??
                                                  '--'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: TitleText(printtext: 'Email')),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                child: PrintValue(
                                    printtext:
                                        snapshot.data?.users?[index]?.email ??
                                            '--'),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: TitleText(printtext: 'Username')),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                child: PrintValue(
                                    printtext: snapshot
                                            .data?.users?[index]?.username ??
                                        '--'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 15, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 15, 0),
                                              child:
                                                  TitleText(printtext: 'Role')),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 15, 5),
                                            child: PrintValue(
                                                printtext: snapshot
                                                        .data
                                                        ?.users?[index]
                                                        ?.userType ??
                                                    '--'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 15, 0),
                                              child: TitleText(
                                                  printtext: 'Status')),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 15, 5),
                                            child: PrintValue(
                                                printtext: snapshot
                                                            .data
                                                            ?.users?[index]
                                                            ?.status ==
                                                        1
                                                    ? 'Active'
                                                    : 'Inactive'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: 80,
                                        height: 35,
                                        child: CommonBtn(
                                            btnName: 'Add Role',
                                            callback: () {
                                              _dialogBuilder(context);
                                            })),
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
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF322B59),
          title: PrintValue(printtext: 'Create Role'),
          content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [TitleText(printtext: 'test')],
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
                width: 120,
                height: 35,
                child: CommonBtn(
                    btnName: 'Save Changes',
                    callback: () {
                      _dialogBuilder(context);
                    })),
          ],
        );
      },
    );
  }
}
