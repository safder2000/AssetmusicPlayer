import 'package:flutter/material.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';

class PlayListTile extends StatefulWidget {
  PlayListTile(
      {Key? key, this.icon = const Icon(Icons.punch_clock), required this.name})
      : super(key: key);
  Icon icon;
  String name;

  @override
  State<PlayListTile> createState() => _PlayListTileState();
}

class _PlayListTileState extends State<PlayListTile> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4, right: 8, left: 8),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx1) => const ScreenMainPlaylist(),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.9,
                ],
                colors: [
                  Color.fromARGB(255, 219, 242, 39),
                  Color.fromARGB(225, 159, 193, 49),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    widget.icon,
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${widget.name}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 41, 64),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      icon: isChecked == true
                          ? const Icon(
                              Icons.play_arrow,
                              color: Color.fromARGB(255, 93, 114, 22),
                              size: 30,
                            )
                          : const Icon(
                              Icons.pause,
                              color: Color.fromARGB(255, 4, 41, 64),
                              size: 30,
                            ),
                    )),
              ],
            ),
          ),
        ),
      );
}
