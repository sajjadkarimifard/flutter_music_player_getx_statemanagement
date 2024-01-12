import 'package:flutter_music_application/model/song_model.dart';

class PlayList {
  final String title;
  final String imageUrl;
  final List<Song> songs;
  PlayList({required this.title, required this.imageUrl, required this.songs});
  static List<PlayList> playlists = [
    PlayList(title: 'rock', imageUrl: 'assets/images/a.png', songs: Song.songs),
    PlayList(title: 'lofi', imageUrl: 'assets/images/b.png', songs: Song.songs),
    PlayList(title: 'long', imageUrl: 'assets/images/c.png', songs: Song.songs),
  ];
}
