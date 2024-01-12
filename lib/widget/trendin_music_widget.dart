import 'package:flutter/material.dart';
import 'package:flutter_music_application/model/song_model.dart';

class TrendingMusicWidget extends StatelessWidget {
  const TrendingMusicWidget({super.key, required this.songs});
  final Song songs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: EdgeInsets.only(right: 15, bottom: 25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(songs.coverUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.shade800,
            blurRadius: 15,
            spreadRadius: -5,
            offset: Offset(10, 12),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 20,
            child: Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        songs.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                      ),
                      Text(
                        songs.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.play_circle_fill_outlined,
                    color: Colors.deepPurple.shade700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
