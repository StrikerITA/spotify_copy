import 'package:flutter/material.dart';
import 'package:spotify_copy/services/auth.dart';
import 'package:spotify_copy/utils/colors.dart';
import '../utils/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Song> songs = [
    Song(title: "Song 1", artist: "Artist 1"),
    Song(title: "Song 2", artist: "Artist 2"),
    Song(title: "Song 3", artist: "Artist 3"),
    Song(title: "Song 1", artist: "Artist 1"),
    Song(title: "Song 2", artist: "Artist 2"),
    Song(title: "Song 3", artist: "Artist 3"),
    Song(title: "Song 1", artist: "Artist 1"),
    Song(title: "Song 2", artist: "Artist 2"),
    Song(title: "Song 3", artist: "Artist 3"),
    Song(title: "Song 1", artist: "Artist 1"),
    Song(title: "Song 2", artist: "Artist 2"),
    Song(title: "Song 3", artist: "Artist 3"),
  ];

  @override
  Widget build(BuildContext context) {
    var url = Auth().getImageFB("The weeknd.jpg");

    return Scaffold(
      backgroundColor: secondaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Pagina 2"),

              //TODO: fix this url and create a music player
              background: Image.network(
                url as String,
                fit: BoxFit.cover,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index].title, style: songs_txtstyle),
            subtitle: Text(
              songs[index].artist,
              style: const TextStyle(color: Colors.white70),
            ),
            onTap: () {
              // Azioni quando l'elemento della lista viene toccato
              print("Hai toccato la canzone: ${songs[index].title}");
            },
          );
        },
      ),
*/