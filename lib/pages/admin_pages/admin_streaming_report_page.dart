import 'package:date_field/date_field.dart';
import 'package:elo_esports/models/streaming_report_response.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/print_value.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminStreamingReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminStreamingReportState();
}

class _AdminStreamingReportState extends State<AdminStreamingReportPage> {
  StreamingReportResponse? _streamingReportResponse;
  final DioClient dioClient = DioClient();
  bool isLoading = false;

  DateTime? _from_date;
  DateTime? _to_date;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  // StreamingReport() async {
  //   if (_to_date == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Please select to date'),
  //     ));
  //     return;
  //   }

  //   if (_from_date == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Please select valid from data'),
  //     ));
  //     return;
  //   }
  //   isLoading = true;
  //   _streamingReportResponse = await dioClient.GetStreamingReport(
  //       context, _from_date.toString()!, _to_date.toString()!);
  //   print(_streamingReportResponse);
  //   isLoading = false;
  //   setState(() {});
  // }

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
              'Streaming Report',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'From Date',
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Color(0xff262657),
                      filled: true,
                      hintStyle: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    initialPickerDateTime: DateTime.now(),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {
                      _from_date = value;
                      // StreamingReport();
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'To Date',
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Color(0xff262657),
                      filled: true,
                      hintStyle: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    initialPickerDateTime: DateTime.now(),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {
                      _to_date = value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _from_date == null || _to_date == null
                  ? PrintValue(printtext: 'Select from date and to date')
                  : FutureBuilder<StreamingReportResponse?>(
                      future: dioClient.GetStreamingReport(context,
                          _from_date.toString()!, _to_date.toString()!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Loader();
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data?.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF322B59),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TitleText(printtext: 'Streamer Name'),
                                      PrintValue(
                                          printtext: snapshot.data?.data?[index]
                                                  ?.streamerName ??
                                              '--'),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext: 'Total Stream'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.totalStream
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext:
                                                        'Total Bet Count'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.totalBetCount
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext: 'Total Amount'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.totalAmount
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext:
                                                        'Total Vig Amount'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.totalVigAmount
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext:
                                                        'Total Streamer Fee'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.streamerFee
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleText(
                                                    printtext: 'Total Profit'),
                                                PrintValue(
                                                    printtext: snapshot
                                                            .data
                                                            ?.data?[index]
                                                            ?.profit
                                                            .toString() ??
                                                        '--'),
                                              ],
                                            ),
                                          ),
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
          ),
        ],
      ),
    );
  }
}
