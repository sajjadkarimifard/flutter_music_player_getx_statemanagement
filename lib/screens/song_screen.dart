import 'package:flutter/material.dart';
import 'package:flutter_music_application/model/song_model.dart';
import 'package:flutter_music_application/widget/seek_bar.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Song song = Get.arguments;
  AudioPlayer audioPlayer = AudioPlayer();
  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
            position: position, duration: duration ?? Duration.zero);
      });

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[2].url}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          BackDropGradient(),
          MusicPlayer(
            seekBarDataStream: _seekBarDataStream,
            audioPlayer: audioPlayer,
            song: song,
          ),
        ],
      ),
    );
  }

  ShaderMask BackDropGradient() {
    return ShaderMask(
      blendMode: BlendMode.xor,
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.0),
          ],
          stops: [0.0, 0.4, 0.6],
        ).createShader(rect);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
    required this.song,
  }) : _seekBarDataStream = seekBarDataStream;

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Text(
            song.description,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: 20),
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                duration: positionData?.duration ?? Duration.zero,
                position: positionData?.position ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<SequenceState?>(
                stream: audioPlayer.sequenceStateStream,
                builder: (context, index) {
                  return IconButton(
                    onPressed: audioPlayer.hasPrevious
                        ? audioPlayer.seekToPrevious
                        : null,
                    icon: Icon(Icons.skip_previous),
                    color: Colors.white,
                    iconSize: 45,
                  );
                },
              ),
              StreamBuilder(
                stream: audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final playerState = snapshot.data;
                    final processingState =
                        (playerState! as PlayerState).processingState;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                          // width: 64,
                          // height: 64,
                          // margin: EdgeInsets.all(10),
                          // color: Colors.amber,
                          // // child: CircularProgressIndicator(),
                          );
                    } else if (!audioPlayer.playing) {
                      return IconButton(
                        iconSize: 65,
                        onPressed: audioPlayer.play,
                        color: Colors.white,
                        icon: Icon(Icons.play_circle),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        iconSize: 65,
                        onPressed: audioPlayer.pause,
                        color: Colors.white,
                        icon: Icon(Icons.pause_circle),
                      );
                    } else {
                      return IconButton(
                        iconSize: 65,
                        onPressed: () => audioPlayer.seek(
                          Duration.zero,
                          index: audioPlayer.effectiveIndices!.first,
                        ),
                        icon: Icon(Icons.replay_circle_filled),
                        color: Colors.white,
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
              StreamBuilder<SequenceState?>(
                stream: audioPlayer.sequenceStateStream,
                builder: (context, index) {
                  return IconButton(
                    onPressed:
                        audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                    icon: Icon(Icons.skip_next),
                    color: Colors.white,
                    iconSize: 45,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
