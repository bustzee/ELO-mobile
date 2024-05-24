import 'package:elo_esports/models/betting_view_master.dart';
import 'package:elo_esports/models/create_betting_master.dart';
import 'package:elo_esports/models/create_betting_view_master.dart';
import 'package:elo_esports/models/update_betting_view.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminCreateBettingViewMasterPage extends StatefulWidget {
  AdminCreateBettingViewMasterPage({super.key, this.viewbetting});

  Datum? viewbetting;

  @override
  State<StatefulWidget> createState() =>
      _AdminCreateBettingViewMasterPageState();
}

class _AdminCreateBettingViewMasterPageState
    extends State<AdminCreateBettingViewMasterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.viewbetting != null) {
      id = widget.viewbetting!.id ?? 0;
      _no_of_views.text = widget.viewbetting!.noOfViews.toString() ?? '';
      _no_of_bet.text = widget.viewbetting!.noOfBet.toString() ?? '';
    }
  }

  final DioClient dioClient = DioClient();
  int id = 0;
  final TextEditingController _no_of_views = TextEditingController();
  final TextEditingController _no_of_bet = TextEditingController();

  bool validate() {
    return _no_of_views.text.isNotEmpty && _no_of_bet.text.isNotEmpty;
  }

  int? parseToint(String value) {
    return int.tryParse(value);
  }

  createBettingViewMaster() async {
    CreateBettingViewMaster createBettingViewMaster = CreateBettingViewMaster(
      noOfViews: _no_of_views.text,
      noOfBet: _no_of_bet.text,
    );
    await dioClient.CreateBettingView(context, createBettingViewMaster);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Betting view details add successfully'),
    ));
  }

  updateBettingViewMaster() async {
    UpdateBettingViewMaster updateBettingViewMaster = UpdateBettingViewMaster(
      id: widget.viewbetting!.id.toString(),
      noOfViews: _no_of_views.text,
      noOfBet: _no_of_bet.text,
    );
    await dioClient.updatedBettingViewMaster(context, updateBettingViewMaster);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Betting view details update successfully'),
    ));
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
                'Betting View Master',
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
                      'View Record',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'No. Of Views *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _no_of_views,
                      hintText: 'Enter No. Of Views',
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'No. Of Bet *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _no_of_bet,
                      hintText: 'Enter No. Of Bet',
                    ),
                    Container(
                      height: 15,
                    ),
                    CommonBtn(
                      icon: Icon(Icons.save, color: Colors.white),
                      btnName: widget.viewbetting == null ? 'Save' : 'Update',
                      callback: () {
                        if (validate()) {
                          if (widget.viewbetting == null) {
                            createBettingViewMaster();
                          } else {
                            updateBettingViewMaster();
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
