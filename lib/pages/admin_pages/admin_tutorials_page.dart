import 'package:elo_esports/models/tutorial.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_pages/admin_add_tutorial_page.dart';
import 'package:elo_esports/pages/admin_pages/admin_permissions_page.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminTutorialsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminTutorialsState();
}

class _AdminTutorialsState extends State<AdminTutorialsPage> {
  final DioClient dioClient = DioClient();
  int? masterId = 0;

  deleteTutorial() async {
    await dioClient.deleteTutorial(context, masterId!);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Tutorial details deleted successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160E42),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Manage Tutorials',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                    width: 120,
                    height: 35,
                    child: CommonBtn(
                      btnName: 'Add Tutorials',
                      backgroundColor: Colors.blue,
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminAddTutorialPage()));
                      },
                    )),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Tutorial?>(
              future: dioClient.getTutorial(),
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
                                            child:
                                                TitleText(printtext: 'Name')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot.data
                                                      ?.data?[index].name ??
                                                  '--'),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 15, 0),
                                            child:
                                                TitleText(printtext: 'Type')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot.data
                                                      ?.data?[index].type ??
                                                  '--'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: 110,
                                          height: 35,
                                          child: CommonBtn(
                                            btnName: 'Edit Tutorial',
                                          )),
                                      Container(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: 110,
                                          height: 35,
                                          child: CommonBtn(
                                            btnName: 'Delete Tutorial',
                                            backgroundColor: Colors.red,
                                            callback: () {
                                              masterId = snapshot
                                                  .data?.data?[index].id;
                                              _dialogBuilder(context);
                                            },
                                          )),
                                    ],
                                  ),
                                  Container(
                                    width: 15,
                                  )
                                ],
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                  child: TitleText(printtext: 'Youtube URL')),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                child: InkWell(
                                  onTap: () {
                                    _launchURL(snapshot
                                            .data?.data?[index].tutorialUrl ??
                                        '');
                                  },
                                  child: PrintValue(
                                      printtext: snapshot
                                              .data?.data?[index].tutorialUrl ??
                                          '--'),
                                ),
                              ),
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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF322B59),
          title: PrintValue(printtext: 'Delete Tutorial Details'),
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
                      deleteTutorial();
                      Navigator.of(context).pop();
                    })),
          ],
        );
      },
    );
  }
}
