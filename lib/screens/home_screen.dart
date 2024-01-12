import 'package:flutter/material.dart';
import 'package:flutter_music_application/model/play_list_model.dart';
import 'package:flutter_music_application/model/song_model.dart';
import 'package:flutter_music_application/widget/play_list_widget.dart';
import 'package:flutter_music_application/widget/section_header.dart';
import 'package:flutter_music_application/widget/trendin_music_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final songs = Song.songs;
    final playlist = PlayList.playlists;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 7),
                    Text(
                      'Enjoy your favorit music',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    TextfiledWidget(),
                  ],
                ),
              ),
            ),
            SectionHeader(
              title: 'Trending',
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TrendingMusicWidget(
                        songs: songs[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            SectionHeader(
              title: 'Play Lists',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: playlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PlayListWidget(
                      playList: playlist[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextfiledWidget extends StatelessWidget {
  const TextfiledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.grid_view_rounded,
        color: Colors.white,
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: CircleAvatar(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
