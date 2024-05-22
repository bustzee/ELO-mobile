import 'package:elo_esports/models/admin_role.dart';
import 'package:elo_esports/models/admin_role_permission.dart';
import 'package:elo_esports/pages/admin_pages/admin_permissions_page.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../network/dio_client.dart';

class AdminRoleList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminRoleListState();
}

class _AdminRoleListState extends State<AdminRoleList> {
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
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Role List',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                    width: 100,
                    height: 35,
                    child: CommonBtn(
                      btnName: 'Create Role',
                      backgroundColor: Colors.blue,
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminPermissions()));
                      },
                    )),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<AdminRole?>(
              future: dioClient.getAllRoles(),
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
                                                TitleText(printtext: 'Slug')),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: PrintValue(
                                              printtext: snapshot.data
                                                      ?.data?[index].slug ??
                                                  '--'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: 80,
                                          height: 35,
                                          child: CommonBtn(
                                            btnName: 'Edit Role',
                                          )),
                                      Container(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: 80,
                                          height: 35,
                                          child: CommonBtn(
                                            btnName: 'Delete Role',
                                            backgroundColor: Colors.red,
                                          )),
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
