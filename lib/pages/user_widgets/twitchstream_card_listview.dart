import 'package:elo_esports/models/twitchstream.dart';
import 'package:elo_esports/pages/user_pages/twitchstream.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TwitchstreamCardListview extends StatelessWidget {
  TwitchstreamCardListview({super.key, this.twitchstreams});

  Twitchstream? twitchstreams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: twitchstreams?.twitchLivestreams?.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 150,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwitchstreamPage(twitchlivestream: twitchstreams?.twitchLivestreams?[index])),
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
                            image: NetworkImage(twitchstreams?.twitchLivestreams?[index].thumbnailUrl?.replaceAll('{width}', '150').replaceAll('{height}', '150') ?? '--'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        twitchstreams?.twitchLivestreams?[index].title ?? '--',
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
