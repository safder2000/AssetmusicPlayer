import 'package:assets_audio_player/assets_audio_player.dart';

final songList = <Audio>[
  Audio(
    'assets/songs/1.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'H O N E Y',
      title: 'H O N E Y',
      artist: 'Kid POLO',
      album: 'Kid POLO',
      image: MetasImage.asset('assets/covers/1.jpg'),
    ),
  ),
  Audio(
    'assets/songs/2.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'Notice',
      title: 'Notice',
      artist: 'Moe Shop',
      album: 'Moe Shop',
      image: MetasImage.asset('assets/covers/2.jpg'),
    ),
  ),
  Audio(
    'assets/songs/3.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'Pax - Gee',
      title: 'Pax - Gee',
      artist: 'TeaWaaay',
      album: 'TeaWaaay',
      image: MetasImage.asset("assets/covers/3.jpg"),
    ),
  ),
  Audio(
    'assets/songs/4.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'soda city funk',
      title: 'soda city funk',
      artist: 'Tim Legend',
      album: 'Tim Legend',
      image: MetasImage.asset("assets/covers/4.jpg"),
    ),
  ),
  Audio(
    'assets/songs/5.mp3',
    //playSpeed: 2.0,
    metas: Metas(
      id: 'Youve Got Me',
      title: 'Youve Got Me',
      artist: 'Yung Bae; ',
      album: 'Yung Bae; ',
      image: MetasImage.asset("assets/covers/5.jpg"),
    ),
  ),
];

final imgList = <String>[
  'assets/covers/1.jpg',
  'assets/covers/2.jpg',
  'assets/covers/3.jpg',
  'assets/covers/4.jpg',
  'assets/covers/5.jpg'
];
