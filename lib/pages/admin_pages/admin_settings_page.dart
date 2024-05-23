import 'package:elo_esports/models/admin_update_settings.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/material.dart';

class AdminSettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminSettingPageState();
}

class _AdminSettingPageState extends State<AdminSettingsPage> {
  final DioClient dioClient = DioClient();

  final TextEditingController _vig = TextEditingController();
  final TextEditingController _extraVigDivisionFactor = TextEditingController();
  final TextEditingController _streamerPer = TextEditingController();
  final TextEditingController _noOfUserCanBet = TextEditingController();
  final TextEditingController _minWalletTrasferAmount = TextEditingController();
  bool _hideTwitchStream = true;
  final TextEditingController _clientId = TextEditingController();
  final TextEditingController _apiUsername = TextEditingController();
  final TextEditingController _apiPassword = TextEditingController();
  final TextEditingController _apiSignature = TextEditingController();
  final TextEditingController _environment = TextEditingController();

  bool validate() {
    return _vig.text.isNotEmpty &&
        _extraVigDivisionFactor.text.isNotEmpty &&
        _streamerPer.text.isNotEmpty &&
        _noOfUserCanBet.text.isNotEmpty &&
        _minWalletTrasferAmount.text.isNotEmpty &&
        _clientId.text.isNotEmpty &&
        _apiUsername.text.isNotEmpty &&
        _apiPassword.text.isNotEmpty &&
        _apiSignature.text.isNotEmpty &&
        _environment.text.isNotEmpty;
  }

  int? parseToInt(String value) {
    return int.tryParse(value);
  }

  updateSettings() async {
    AdminUpdateSettings adminUpdateSettings = AdminUpdateSettings(
      vig: parseToInt(_vig.text),
      extraVigDivisionFactor: parseToInt(_extraVigDivisionFactor.text),
      noOfUserCanBet: parseToInt(_noOfUserCanBet.text),
      streamerPer: parseToInt(_streamerPer.text),
      minWalletTrasferAmount: parseToInt(_minWalletTrasferAmount.text),
      clientId: _clientId.text,
      apiUsername: _apiUsername.text,
      apiPassword: _apiPassword.text,
      apiSignature: _apiSignature.text,
      environment: _environment.text,
      hideTwitchStream: _hideTwitchStream,
    );
    await dioClient.updateSettings(context, adminUpdateSettings);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Settings updated successfully'),
    ));
  }

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
                    'Settings',
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
                        Text(
                          'Setting',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
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
                          controller: _extraVigDivisionFactor,
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
                          controller: _noOfUserCanBet,
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
                          controller: _streamerPer,
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
                          controller: _minWalletTrasferAmount,
                          hintText: 'Enter Minimum Wallet Transfer Amount',
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Hide Twitch Stream *'),
                        Switch(
                          // This bool value toggles the switch.
                          value: _hideTwitchStream,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              _hideTwitchStream = value;
                            });
                          },
                        ),
                        // Container(
                        //   height: 15,
                        // ),
                        // CommonBtn(btnName: 'Save Setting')
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
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
                        Text(
                          'Paypal Settings',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TitleText(printtext: 'Client Id*'),
                        Container(
                          height: 5,
                        ),
                        CommonTextFiled(
                          controller: _clientId,
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
                          controller: _apiUsername,
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
                          controller: _apiPassword,
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
                          controller: _apiSignature,
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
                          controller: _environment,
                          hintText: 'Enter Environment',
                        ),
                        Container(
                          height: 15,
                        ),
                        CommonBtn(
                          btnName: 'Save Paypal Setting',
                          callback: () {
                            if (validate()) {
                              updateSettings();
                            } else {
                              // Show error message
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Error',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text(
                                        'Please fill all fields.',
                                        style: TextStyle(color: Colors.white)),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        )
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
