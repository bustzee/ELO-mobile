import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/material.dart';

class AdminRoleList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminRoleListState();
}

class _AdminRoleListState extends State<AdminRoleList> {
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
              'Role List',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  width: 500,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Color(0xFF322B59),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 0),
                                    child: TitleText(printtext: 'First Name')),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                  child: PrintValue(
                                    printtext: 'Test',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 0),
                                    child: TitleText(printtext: 'Last Name')),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                  child: PrintValue(
                                    printtext: 'Test',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TitleText(printtext: 'Email')),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: PrintValue(
                          printtext: 'Test',
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: TitleText(printtext: 'Username')),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 80,
                                height: 35,
                                child: CommonBtn(
                                  btnName: 'Add Role',
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
