import 'package:flutter/material.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: bgColor,
                title: Text(
                  "Music Player",
                  style: TextStyle(
                    fontFamily: bold,
                    fontSize: 15,
                    color: whiteColor,
                  ),
                ),
                subtitle: Text(
                  "Artist name",
                  style: TextStyle(
                    fontFamily: regular,
                    fontSize: 12,
                  ),
                ),
                leading: Icon(Icons.music_note, color: whiteColor, size: 32),
                trailing: Icon(Icons.play_arrow, color: whiteColor, size: 36),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
