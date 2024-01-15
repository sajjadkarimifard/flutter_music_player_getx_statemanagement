import 'package:flutter/material.dart';
import 'package:flutter_music_application/model/play_list_model.dart';
import 'package:get/get.dart';

import '../widget/play_list_widget.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayList playList = PlayList.playlists[1];
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
        appBar: AppBar(
          title: Text(
            'PlayList',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  playList.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                playList.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              PlayandShuffleButton(),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle),
                iconSize: 70,
                color: Colors.white,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return PlayListWidget(
                      playList: playList,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayandShuffleButton extends StatefulWidget {
  const PlayandShuffleButton({
    super.key,
  });

  @override
  State<PlayandShuffleButton> createState() => _PlayandShuffleButtonState();
}

class _PlayandShuffleButtonState extends State<PlayandShuffleButton> {
  bool isPlaying = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(left: isPlaying ? 0 : 182),
                width: 190,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Play',
                        style: TextStyle(
                          fontSize: 17,
                          color: (isPlaying == true)
                              ? Colors.white
                              : Colors.deepPurple,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.play_circle,
                        color: (isPlaying == true)
                            ? Colors.white
                            : Colors.deepPurple.shade700,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Shuffle',
                        style: TextStyle(
                          fontSize: 17,
                          color: (isPlaying == true)
                              ? Colors.deepPurple.shade700
                              : Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.shuffle,
                        color: (isPlaying == true)
                            ? Colors.deepPurple.shade700
                            : Colors.white,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
