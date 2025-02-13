import 'package:elo_esports/models/twitchstream.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class TwitchstreamPage extends StatefulWidget {
  TwitchstreamPage({super.key, this.twitchlivestream});
  static String id = '/TwitchstreamPage';

  TwitchLivestream? twitchlivestream;

  @override
  State<TwitchstreamPage> createState() => TwitchstreamPageState();
}

class TwitchstreamPageState extends State<TwitchstreamPage> {

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
    ..loadRequest(Uri.parse('https://player.twitch.tv/?channel=${widget.twitchlivestream?.userLogin}&height=1000&parent=uat.elo-esports.com&referrer=https://uat.elo-esports.com/streams/525102978&width=100%'));
    return Scaffold(
        backgroundColor: const Color(0xff160E42),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 300,
                  child: WebViewWidget(controller: webViewController),
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    widget.twitchlivestream?.title ?? '--',
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
                    '${widget.twitchlivestream?.viewerCount.toString() ?? '--'} views',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: -0.4,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(LineIcons.thumbsUp),
                          Text(
                            '150K',
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
                      Column(
                        children: [
                          const Icon(LineIcons.thumbsDown),
                          Text(
                            '100K',
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
                          Column(
                        children: [
                          const Icon(LineIcons.coins),
                          Text(
                            '1050K',
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
                          Column(
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
                  )
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                          itemCount: 5,
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
                                        'Basic',
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
                                        'Team A to win: 2.00',
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
                  
                                      const SizedBox(height: 10,),
                  
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
                                        'Virat will score Century in the second inning itself',
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
                  
                                      const SizedBox(height: 10,),
                  
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
                                        'Virat will be ducked in the second inning itself',
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
                  
                                      const SizedBox(height: 15,),
                  
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
                                                '1000K',
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
                                                '603:13:00',
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
                ),
              ]
            ),
          ),
        ),
      );
  }
}
