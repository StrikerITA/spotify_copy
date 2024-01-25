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
      backgroundColor: listColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Auth().signOut();
          },
          icon: const Icon(
            Icons.person,
            color: textColor,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              //TODO: fix this url and create a music player
              background: Container(
                decoration: const BoxDecoration(color: Colors.amber),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_RGB_White.png",
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.transparent, // Opzionale: imposta un colore di sfondo semitrasparente
                    ),
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          SliverList.builder(
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