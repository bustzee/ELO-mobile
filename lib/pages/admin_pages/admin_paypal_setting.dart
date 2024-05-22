import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/material.dart';

class AdminPaypalSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminPaypalSettingState();
}

class _AdminPaypalSettingState extends State<AdminPaypalSetting> {
  final TextEditingController _vig = TextEditingController();
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
                    'Paypal Setting',
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
                        TitleText(printtext: 'Client Id*'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Client Id',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'API User Name *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter API User Name',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'API Password *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter API Password',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'API Signature *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter API Signature',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Environment *'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _vig,
                          hintText: 'Enter Environment',
                        ),
                        Container(
                          height: 15,
                        ),
                        CommonBtn(btnName: 'Save Paypal Setting')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
