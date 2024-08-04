import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_styles.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgDarkColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: whiteColor),
            ),
          ],
          leading: Icon(Icons.sort_rounded, color: whiteColor),
          title: Text(
            "Beats",
            style: ourStyle(
              family: bold,
              size: 18,
            ),
          ),
        ),
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL,
            ),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                print(snapshot.data);

                return Center(
                    child: Text(
                  "No song found",
                  style: ourStyle(),
                ));
              } else
                print(snapshot.data);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 4),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Obx(
                        () => ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: bgColor,
                          title: Text(
                            snapshot.data![index].displayNameWOExt,
                            style: TextStyle(
                              fontFamily: bold,
                              fontSize: 15,
                              color: whiteColor,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data![index].artist}",
                            style: TextStyle(
                              fontFamily: regular,
                              fontSize: 12,
                            ),
                          ),
                          leading: QueryArtworkWidget(
                            id: snapshot.data![index].id,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: const Icon(Icons.music_note,
                                color: whiteColor, size: 32),
                          ),
                          trailing: controller.playerIndex.value == index &&
                                  controller.isPlaying.value
                              ? const Icon(
                                  Icons.play_arrow,
                                  color: whiteColor,
                                  size: 36,
                                )
                              : null,
                          onTap: () {
                            controller.playSong(
                                snapshot.data![index].uri, index);
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                ),
              );
            }));
  }
}
