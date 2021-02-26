// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';
// import 'package:music_app/music_player.dart';

// class Tracks extends StatefulWidget {
//   @override
//   _TracksState createState() => _TracksState();
// }

// class _TracksState extends State<Tracks> {
//   final FlutterAudioQuery audioQuery = FlutterAudioQuery();
//   List<SongInfo> songs = [];
//   int currentIndex = 0;

//   void initState() {
//     super.initState();
//     getTracks();
//   }

//   void getTracks() async {
//     songs = await audioQuery.getSongs();
//     setState(() {
//       songs = songs;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Icon(Icons.music_note, color: Colors.black),
//         title: Text(
//           "μ6 APP",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ),
//       body: ListView.separated(
//         separatorBuilder: (context, index) => Divider(),
//         itemCount: songs.length,
//         itemBuilder: (context, index) => ListTile(
//           leading: CircleAvatar(
//             backgroundImage: songs[index].albumArtwork == null
//                 ? AssetImage('assets/images/musiclogo.jpg')
//                 : FileImage(File(songs[index].albumArtwork)),
//           ),
//           title: Text(songs[index].title),
//           subtitle: Text(songs[index].artist),
//           onTap: () {
//             currentIndex = index;
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => MusicPlayer(
//                       songInfo: songs[currentIndex],
//                     )));
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/config.dart';
import 'package:music_app/music_player.dart';

class Tracks extends StatefulWidget {
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];
  int currentIndex = 0;
  final GlobalKey<MusicPlayerState> key = GlobalKey<MusicPlayerState>();

  get floatingActionButtonLocation => null;

  ///
  void initState() {
    super.initState();
    getTracks();
  }

  ///

  void getTracks() async {
    songs = await audioQuery.getSongs();
    setState(() {
      songs = songs;
    });
  }

  void changeTrack(bool isNext) {
    if (isNext) {
      if (currentIndex != songs.length - 1) {
        currentIndex++;
      } else
        currentIndex = 0;
    } else {
      if (currentIndex != 0) {
        currentIndex--;
      } else
        currentIndex = songs.length - 1;
    }
    key.currentState.setSong(songs[currentIndex]);
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Icon(Icons.music_note, color: Colors.black),
        title: Text('Musix', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          FlatButton(
            //textColor: Colors.white,
            onPressed: () {
              currentTheme.switchTheme();
            },
            child: Icon(Icons.star_border_purple500_sharp, color: Colors.black),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: songs.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: songs[index].albumArtwork == null
                ? AssetImage('assets/images/musiclogo.jpg')
                : FileImage(File(songs[index].albumArtwork)),
          ),
          title: Text(songs[index].title),
          subtitle: Text(songs[index].artist),
          onTap: () {
            currentIndex = index;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MusicPlayer(
                    changeTrack: changeTrack,
                    songInfo: songs[currentIndex],
                    key: key)));
          },
        ),
      ),
    );
  }
}
