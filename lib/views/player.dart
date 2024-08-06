// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_styles.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: QueryArtworkWidget(
                    id: data[controller.playerIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    artworkWidth: double.infinity,
                    nullArtworkWidget: Icon(Icons.music_note),
                  ), // Added missing closing parenthesis
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        data[controller.playerIndex.value].displayNameWOExt,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        data[controller.playerIndex.value].artist.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              controller.position.value,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                                child: Slider(
                                    thumbColor: sliderColor,
                                    activeColor: sliderColor,
                                    inactiveColor: bgColor,
                                    min: Duration(seconds: 0)
                                        .inSeconds
                                        .toDouble(),
                                    max: controller.max.value,
                                    value: controller.value.value,
                                    onChanged: (newValue) {
                                      controller.changeDurationtoSections(
                                          newValue.toInt());
                                      newValue = newValue;
                                    })),
                            Text(
                              controller.duration.value,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.playSong(
                                    data[controller.playerIndex.value - 1].uri,
                                    controller.playerIndex.value - 1);
                              },
                              icon: Icon(
                                Icons.skip_previous_rounded,
                                size: 40,
                              )),
                          Obx(
                            () => CircleAvatar(
                              radius: 35,
                              backgroundColor: bgDarkColor,
                              child: Transform.scale(
                                scale: 3,
                                child: IconButton(
                                    onPressed: () {
                                      if (controller.isPlaying.value) {
                                        controller.audioPlayer.pause();
                                        controller.isPlaying(false);
                                      } else {
                                        controller.audioPlayer.play();
                                        controller.isPlaying(true);
                                      }
                                    },
                                    icon: controller.isPlaying.value
                                        ? Icon(
                                            Icons.pause,
                                            color: whiteColor,
                                          )
                                        : Icon(
                                            color: Colors.amber,
                                            Icons.play_arrow_rounded,
                                          )),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.playSong(
                                    data[controller.playerIndex.value + 1].uri,
                                    controller.playerIndex.value + 1);
                              },
                              icon: Icon(
                                Icons.skip_next_rounded,
                                size: 40,
                              )),
                        ],
                      )
                    ],
                  ),
                ), // Added missing closing square bracket
              ),
            ),
          ],
        ),
      ),
    );
  }
}
