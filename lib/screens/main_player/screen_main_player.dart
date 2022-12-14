import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';

import 'package:music_player/screens/menu/screen_main.dart';
import 'package:music_player/screens/playlist/screen_playlist.dart';
import 'package:music_player/widgets/song_list.dart';
import 'package:music_player/widgets/song_list.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class ScreenMainPlayer extends StatefulWidget {
  ScreenMainPlayer({
    Key? key,
    // required this.songInfo,

    // this.songDuration,
    required this.songIndex,
    required this.assetsAudioPlayer,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);

  AssetImage songImg;
  // SongModel songInfo;
  // final songDuration;
  int songIndex;
  AssetsAudioPlayer assetsAudioPlayer;

  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  // final _audioQuery = OnAudioQuery();

  @override
  State<ScreenMainPlayer> createState() => ScreenMainPlayerState();
}

class ScreenMainPlayerState extends State<ScreenMainPlayer> {
  bool isFavorate = true;
  bool isPause = true;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  int _selectedIndex = 0;
  void _onPrevSong(int _currentIndex) {
    _selectedIndex = _currentIndex;
    setState(
      () {
        if (_selectedIndex <= 0) {
          _selectedIndex = (songList.length) - 1;
          widget.assetsAudioPlayer
              .open(songList[_selectedIndex], showNotification: true);
        } else {
          _selectedIndex = _selectedIndex - 1;
          widget.assetsAudioPlayer
              .open(songList[_selectedIndex], showNotification: true);
        }
        widget.assetsAudioPlayer.play();
        isPause = true;
        imgList[widget.songIndex + 1].toString();
      },
    );
  }

  void _onNextSong(int _currentIndex) {
    _selectedIndex = _currentIndex;
    setState(
      () {
        if (_selectedIndex >= songList.length - 1) {
          _selectedIndex = 0;
          widget.assetsAudioPlayer
              .open(songList[_selectedIndex], showNotification: true);
        } else {
          widget.assetsAudioPlayer
              .open(songList[_selectedIndex + 1], showNotification: true);
          _selectedIndex = _selectedIndex + 1;
        }

        widget.assetsAudioPlayer.play();
        isPause = true;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    playSong();
  }

  playSong() async {
    _selectedIndex = widget.songIndex + 1;
    // await widget.assetsAudioPlayer.open(Audio.file(widget.songInfo.uri!),
    //     autoStart: false, showNotification: true);
    await widget.assetsAudioPlayer.open(songList[_selectedIndex],
        autoStart: false, showNotification: true);
    widget.assetsAudioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx1) => const ScreenMain(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color.fromARGB(182, 255, 255, 255),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx1) => const ScreenPlaylist(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.queue_music,
                          size: 29,
                          color: Color.fromARGB(206, 255, 255, 255),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image:
                        AssetImage('assets/covers/${_selectedIndex + 1}.jpg'),
                    fit: BoxFit.none,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.00,
                        0.3,
                        0.7,
                      ],
                      colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                //========================
                                songList[_selectedIndex].metas.title.toString(),
                                // widget.songInfo.title,
                                style: const TextStyle(
                                  color: Color.fromARGB(196, 244, 244, 244),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    // '${widget.songInfo.album}',
                                    songList[_selectedIndex]
                                        .metas
                                        .album
                                        .toString(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(125, 167, 167, 167),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Iconify(
                                  MdiLight.repeat,
                                  color: Color.fromARGB(255, 255, 234, 234),
                                  size: 30,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorate = !isFavorate;
                                  });
                                },
                                icon: isFavorate == true
                                    ? const Icon(
                                        Icons.favorite,
                                        color:
                                            Color.fromARGB(255, 255, 234, 234),
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color:
                                            Color.fromARGB(255, 219, 242, 39),
                                        size: 30,
                                      )),
                          ),
                        ],
                      ),
//============================ Seekbar =======================================================
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: widget.assetsAudioPlayer
                            .builderRealtimePlayingInfos(
                          builder: (ctx, infos) {
                            Duration currentPos = infos.currentPosition;
                            Duration total = infos.duration;
                            return ProgressBar(
                              progress: currentPos,
                              total: total,
                              progressBarColor:
                                  const Color.fromARGB(255, 219, 242, 39),
                              baseBarColor: Colors.white.withOpacity(0.24),
                              bufferedBarColor: Colors.white.withOpacity(0.24),
                              thumbColor: Colors.white,
                              barHeight: 3.0,
                              thumbRadius: 5.0,
                              timeLabelTextStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              onSeek: (to) {
                                widget.assetsAudioPlayer.seek(to);
                              },
                            );
                          },
                        ),
                      ),
//========================= Seekbar End ================================================================
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed: () {
                                  _onPrevSong(_selectedIndex);
                                }, //FaIcon(FontAwesomeIcons.gamepad),
                                icon: const Iconify(
                                  RadixIcons.track_previous,
                                  color: Colors.white,
                                  size: 60,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isPause) {
                                        widget.assetsAudioPlayer.pause();
                                      } else {
                                        widget.assetsAudioPlayer.play();
                                      }

                                      isPause = !isPause;
                                    });
                                  }, //FaIcon(FontAwesomeIcons.gamepad),
                                  icon: isPause == true
                                      ? const Iconify(
                                          MdiLight.pause,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 190,
                                        )
                                      : const Iconify(
                                          MdiLight.play,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 190,
                                        )),
                            ),
                            IconButton(
                                onPressed: () {
                                  _onNextSong(_selectedIndex);
                                }, //FaIcon(FontAwesomeIcons.gamepad),
                                icon: const Iconify(
                                  RadixIcons.track_next,
                                  color: Colors.white,
                                  size: 60,
                                )),
                            const SizedBox(
                              width: 15,
                            )
                            // SizedBox(
                            //   width: 35,
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
