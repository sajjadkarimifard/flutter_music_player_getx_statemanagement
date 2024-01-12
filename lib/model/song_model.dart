class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});
  static List<Song> songs = [
    Song(
      title: 'spit on my face',
      description: 'spit on my face',
      url: 'assets/songs/a.mp3',
      coverUrl: 'assets/images/a.png',
    ),
    Song(
      title: 'spit on my face',
      description: 'spit on my face',
      url: 'assets/songs/b.mp3',
      coverUrl: 'assets/images/b.png',
    ),
    Song(
      title: 'spit on my face',
      description: 'spit on my face',
      url: 'assets/songs/c.mp3',
      coverUrl: 'assets/images/c.png',
    ),
  ];
}
