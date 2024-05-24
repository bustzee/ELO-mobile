import 'package:elo_esports/models/admin_betting_master_list.dart';
import 'package:elo_esports/models/create_betting_master.dart';
import 'package:elo_esports/models/update_betting_master.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_pages/admin_betting_master_page.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminBettingAmountMasterPage extends StatefulWidget {
  AdminBettingAmountMasterPage({super.key, this.bettingRecord});

  Betting? bettingRecord;

  @override
  State<StatefulWidget> createState() => _AdminBettingAmountMasterPage();
}

class _AdminBettingAmountMasterPage
    extends State<AdminBettingAmountMasterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.bettingRecord != null) {
      _betting_amount.text = widget.bettingRecord!.bettingAmount ?? '';
      _description.text = widget.bettingRecord!.description ?? '';
      id = widget.bettingRecord!.id ?? 0;
    }
  }

  final DioClient dioClient = DioClient();

  final TextEditingController _betting_amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool _addedBy = true;
  int id = 0;

  bool validate() {
    return _betting_amount.text.isNotEmpty && _description.text.isNotEmpty;
  }

  double? parseTodouble(String value) {
    return double.tryParse(value);
  }

  createBettingMaster() async {
    CreateBettingMaster createBettingMaster = CreateBettingMaster(
      bettingAmount: parseTodouble(_betting_amount.text),
      description: _description.text,
      addedBy: _addedBy,
    );
    await dioClient.createBettingMaster(context, createBettingMaster);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Betting details add successfully'),
    ));

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AdminBettingMasterPage()));
  }

  upadteBettingMaster() async {
    UpdateBettingMaster updateBettingMaster = UpdateBettingMaster(
      id: widget.bettingRecord!.id ?? 0,
      bettingAmount: parseTodouble(_betting_amount.text),
      description: _description.text,
      addedBy: _addedBy,
    );
    await dioClient.updatedBettingMaster(context, updateBettingMaster);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Betting details update successfully'),
    ));

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AdminBettingMasterPage()));
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
                'Betting Amount Master',
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
                      'Betting Record',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Betting Amount *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _betting_amount,
                      hintText: 'Enter Betting Amount',
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Description *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _description,
                      hintText: 'Enter Description',
                    ),
                    Container(
                      height: 15,
                    ),
                    CommonBtn(
                      icon: Icon(Icons.save, color: Colors.white),
                      btnName: widget.bettingRecord == null ? 'Save' : 'Update',
                      callback: () {
                        if (validate()) {
                          if (widget.bettingRecord == null) {
                            createBettingMaster();
                          } else {
                            upadteBettingMaster();
                          }
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
                                content: const Text('Please fill all fields.',
                                    style: TextStyle(color: Colors.white)),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK',
                                        style: TextStyle(color: Colors.white)),
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
    );
  }
}
