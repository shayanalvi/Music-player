// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_styles.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                child:
                    Icon(Icons.music_note), // Added missing closing parenthesis
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
                child: Column(
                  children: [
                    Text(
                      "Music name",
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
                      "Artist Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "0:0",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: Slider(
                                thumbColor: sliderColor,
                                activeColor: sliderColor,
                                inactiveColor: bgColor,
                                value: 0.0,
                                onChanged: (newValue) {})),
                        Text(
                          "04:00",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_previous_rounded)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow_rounded)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_next_rounded)),
                      ],
                    )
                  ],
                ), // Added missing closing square bracket
              ),
            ),
          ],
        ),
      ),
    );
  }
}
