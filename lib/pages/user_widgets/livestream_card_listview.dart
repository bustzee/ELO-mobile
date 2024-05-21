import 'package:elo_esports/models/livestream.dart';
import 'package:elo_esports/network/endpoints.dart';
import 'package:elo_esports/pages/user_pages/livestream.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LivestreamCardListview extends StatelessWidget {
  LivestreamCardListview({super.key, this.livestreams});

  Livestream? livestreams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: livestreams?.livestreams?.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 150,
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LivestreamPage(livestream: livestreams?.livestreams?[index])),
                  );
              },
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            Endpoints.baseURL + (livestreams?.livestreams?[index].image ?? '--'),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Image.network(
                        Endpoints.baseURL + (livestreams?.livestreams?[index].image ?? '--'),
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/game_thumbnail_dummy.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        livestreams?.livestreams?[index].name ?? '--',
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
