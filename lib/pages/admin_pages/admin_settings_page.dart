import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/material.dart';

class AdminSettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminSettingPage();
}

class _AdminSettingPage extends State<AdminSettingsPage> {
  final TextEditingController _vig = TextEditingController();

  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF160E42),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'Setting',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xFF322B59),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Vig *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Vig',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Extra Vig Division Factor *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Extra Vig Division Factor',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(
                            printtext:
                                'How many No. of users can bet on a Bet *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText:
                              'Enter How many No. of users can bet on a Bet',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Streamer Percentage *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Streamer Percentage',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(
                            printtext: 'Minimum Wallet Transfer Amount *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Minimum Wallet Transfer Amount',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Hide Twitch Stream *'),
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
                        ),
                        Container(
                          height: 15,
                        ),
                        CommonBtn(btnName: 'Save Setting')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
