import 'package:elo_esports/models/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class TutorialCardListview extends StatelessWidget {
  TutorialCardListview({super.key, this.tutorial});

  Tutorial? tutorial;

  // Function to open a URL
  Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tutorial?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 150,
            child: InkWell(
              onTap: () {
                if(tutorial?.data?[index].tutorialUrl != null) {
                  openUrl(tutorial?.data?[index].tutorialUrl ?? '');
                }

                 if(tutorial?.data?[index].documentAttachment != null) {
                  openUrl('https://elo.takshmahajan.in/${tutorial?.data?[index].documentAttachment ?? ''}');
                }
              },
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/tutorial_thumbnail_dummy.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        tutorial?.data?[index].name ?? '--',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
