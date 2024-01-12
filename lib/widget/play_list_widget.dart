import 'package:flutter/material.dart';
import 'package:flutter_music_application/model/play_list_model.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({super.key, required this.playList});
  final PlayList playList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.all(10),
      height: 80,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade500,
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
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(playList.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 30),
          Column(
            children: [
              Text(
                playList.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${playList.songs.length} Songs',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.play_circle_fill_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
