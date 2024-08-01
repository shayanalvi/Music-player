import 'package:flutter/material.dart';
import 'package:music_app/consts/colors.dart';

const bold = "bold";
const regular = "regular";

ourStyle({family = regular, double? size = 14, color = whiteColor}) {
  return TextStyle(
    fontSize: 18,
    color: whiteColor,
    fontFamily: family,
  );
}
