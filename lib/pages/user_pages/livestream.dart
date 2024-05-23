import 'package:elo_esports/models/add_bet.dart';
import 'package:elo_esports/models/bet_details.dart';
import 'package:elo_esports/models/common_response.dart';
import 'package:elo_esports/models/livestream.dart';
import 'package:elo_esports/models/stream_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class LivestreamPage extends StatefulWidget {
  LivestreamPage({super.key, this.livestream});
  static String id = '/LivestreamPage';

  LivestreamElement? livestream;

  @override
  State<LivestreamPage> createState() => LivestreamPageState();
}

class LivestreamPageState extends State<LivestreamPage> {
  final DioClient dioClient = DioClient();
  StreamDetails? streamDetails;

  getStreamDetails() async {
    streamDetails =
        await dioClient.getStreamDetails(context, widget.livestream?.id ?? 0);
    setState(() {});
  }

  showMessage(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    getStreamDetails();
  }

  @override
  void initState() {
    super.initState();

    getStreamDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff160E42),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            YoYoPlayer(
              aspectRatio: 16 / 9,
              // url: "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
              // url: "https://videos.pexels.com/video-files/4247319/4247319-hd_1920_1080_30fps.mp4",
              url:
                  'https://live-streaming.elo-esports.com:8080/hls/${widget.livestream?.streamId ?? '--'}.m3u8',
              videoStyle: const VideoStyle(),
              videoLoadingStyle: const VideoLoadingStyle(),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                widget.livestream?.name ?? '--',
                style: GoogleFonts.getFont(
                  'Open Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: -0.4,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                '298K views',
                style: GoogleFonts.getFont(
                  'Open Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: -0.4,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        CommonResponse? commonResponse = await dioClient.likeStream(context, widget.livestream?.id ?? 0);
                        showMessage(context, commonResponse?.message ?? "Liked successfully");
                      },
                      child: Column(
                        children: [
                          const Icon(LineIcons.thumbsUp),
                          Text(
                            (streamDetails?.data?.likeCount ?? 0).toString(),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        CommonResponse? commonResponse = await dioClient.unlikeStream(context, widget.livestream?.id ?? 0);
                        showMessage(context, commonResponse?.message ?? "UnLiked successfully");
                      },
                      child: Column(
                        children: [
                          const Icon(LineIcons.thumbsDown),
                          Text(
                            (streamDetails?.data?.dislikeCount ?? 0).toString(),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(LineIcons.coins),
                        Text(
                          (streamDetails?.data?.potAmount ?? 0).toString(),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await dioClient.streamReport(
                            context, widget.livestream?.id ?? 0);
                        showMessage(context, "Reported successfully");
                      },
                      child: Column(
                        children: [
                          const Icon(LineIcons.flag),
                          Text(
                            'Report',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(LineIcons.shareSquare),
                        Text(
                          'Share',
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: -0.4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )),

            Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 110,
                height: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffB70018)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size.fromHeight(50)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                      elevation: MaterialStateProperty.all(20),
                      overlayColor:
                          MaterialStateProperty.all(Colors.blue.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ))),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                        child: AddBetPage(game_id: widget.livestream?.id ?? 0)),
                  ),
                  child: const Text(
                    'Create bet',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // BETS
            FutureBuilder<BetDetails?>(
              future:
                  dioClient.getBetDetails(context, widget.livestream?.id ?? 0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loader();
                } else {
                  return BetList(bets: snapshot.data);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class BetList extends StatelessWidget {
  BetList({super.key, this.bets});

  BetDetails? bets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bets?.data?.bets?.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 150,
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bets?.data?.bets?[index].betType ?? '',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'For',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        bets?.data?.bets?[index].betFor ?? '',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Against',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        bets?.data?.bets?[index].betAgainst ?? '',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Hours',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            bets?.data?.bets?[index].activeHours ?? '',
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: -0.4,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Winning Amount',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                bets?.data?.bets?[index].winningAmount ?? '',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff125900)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size.fromHeight(50)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0)),
                                  elevation: MaterialStateProperty.all(20),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.blue.shade900),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ))),
                              onPressed: () {},
                              child: const Text(
                                'Claim bet',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// ignore: must_be_immutable
class AddBetPage extends StatefulWidget {
  AddBetPage({super.key, this.game_id});

  int? game_id;

  @override
  State<AddBetPage> createState() => AddBetPageState();
}

class AddBetPageState extends State<AddBetPage> {
  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    TextEditingController amountEditingController = TextEditingController();
    TextEditingController forEditingController = TextEditingController();
    TextEditingController againstEditingController = TextEditingController();
    TextEditingController descriptionEditingController =
        TextEditingController();

    bool validate() {
      return amountEditingController.text.isNotEmpty &&
          forEditingController.text.isNotEmpty &&
          againstEditingController.text.isNotEmpty &&
          descriptionEditingController.text.isNotEmpty;
    }

    addBet(BuildContext context) async {
      AddBet addBet = AddBet(
          gameId: widget.game_id,
          bettingId: '-1',
          customAmount: int.parse(amountEditingController.text),
          forText: forEditingController.text,
          againstText: againstEditingController.text,
          description: descriptionEditingController.text);

      await dioClient.addBet(context, addBet);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Bet added successfully'),
      ));

      Navigator.pop(context);
      setState(() {});
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff160E42),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bet Amount',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: -0.4,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: amountEditingController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Color(0xff262657),
                      filled: true,
                      hintStyle: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InputField(label: 'For', controller: forEditingController),
            const SizedBox(
              height: 10,
            ),
            InputField(label: 'Against', controller: againstEditingController),
            const SizedBox(
              height: 10,
            ),
            InputField(
                label: 'Description', controller: descriptionEditingController),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff0F38CD)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(50)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  elevation: MaterialStateProperty.all(20),
                  overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ))),
              onPressed: () {
                if (validate()) {
                  addBet(context);
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
              child: const Text('Add bet'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.getFont(
            'Open Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: -0.4,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              fillColor: Color(0xff262657),
              filled: true,
              hintStyle: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
