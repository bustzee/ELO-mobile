import 'package:elo_esports/models/admin_role_permission.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../network/dio_client.dart';

class AdminPermissions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminPermissionsListState();
}

class _AdminPermissionsListState extends State<AdminPermissions> {
  final DioClient dioClient = DioClient();

  final TextEditingController _name = TextEditingController();

  final TextEditingController _controller = TextEditingController();
  bool light = true;

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
              'Permissions List',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              children: [
                Expanded(
                    child: CommonTextFiled(
                        controller: _controller, hintText: 'Enter Role Name')),
                Container(
                  width: 10,
                ),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: CommonBtn(
                      btnName: 'Create Role',
                      backgroundColor: Colors.blue,
                    )),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<AdminRolePermission?>(
              future: dioClient.showPermission(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.permissions?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          width: 500,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Color(0xFF322B59),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              printtext: snapshot
                                                      .data
                                                      ?.permissions?[index]
                                                      .name ??
                                                  '--'),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 15, 0),
                                            child:
                                                TitleText(printtext: 'Slug')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot
                                                      .data
                                                      ?.permissions?[index]
                                                      .slug ??
                                                  '--'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 10,
                                      ),
                                      TitleText(printtext: 'Status'),
                                      Switch(
                                        // This bool value toggles the switch.
                                        value: light,
                                        activeColor: Colors.green,
                                        onChanged: (bool value) {
                                          // This is called when the user toggles the switch.
                                          setState(() {
                                            light = value;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 15,
                                  )
                                ],
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
}
