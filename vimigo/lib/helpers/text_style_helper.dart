import 'package:flutter/cupertino.dart';

class TextStyleHelper {
  static TextStyle _metropolis(Color color, double size, FontWeight fontWeight,
      {double? height}) {
    return TextStyle(
      fontFamily: "Metropolis",
      height: height ?? 1.4,
      color: color,
      fontSize: size,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
    );
  }

  static TextStyle _metropolisShadow(
      Color color, Color colorShadow, double size, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: "Metropolis",
      color: color,
      fontSize: size,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
      shadows: [
        Shadow(
          blurRadius: 4.0,
          color: colorShadow,
          offset: const Offset(2.5, 2.5),
        )
      ],
    );
  }

  static TextStyle appBar(Color color) {
    return h3SemiBold(color);
  }

  static TextStyle alertTitle(Color color) {
    return h3SemiBold(color);
  }

  static TextStyle alertDesc(Color color) {
    return bodyRegular(color);
  }

  static TextStyle textfieldTitle(Color color) {
    return bodySemiBold(color);
  }

  static TextStyle textfieldContent(Color color) {
    return h5Regular(color);
  }

  static TextStyle textfieldError(Color color) {
    return labelRegular(color);
  }

  static TextStyle refresher(Color color) {
    return bodySemiBold(color);
  }

  static TextStyle h1SemiBold(Color color, {double? height}) {
    return _metropolis(color, 36, FontWeight.w600, height: height);
  }

  static TextStyle h2SemiBold(Color color) {
    return _metropolis(color, 24, FontWeight.w600);
  }

  static TextStyle h3SemiBold(Color color) {
    return _metropolis(color, 20, FontWeight.w600);
  }

  static TextStyle h4SemiBold(Color color, {double? height}) {
    return _metropolis(color, 18, FontWeight.w600, height: height);
  }

  static TextStyle h4Regular(Color color, {double? height}) {
    return _metropolis(color, 18, FontWeight.w400, height: height);
  }

  static TextStyle h5Regular(Color color, {double? height}) {
    return _metropolis(color, 16, FontWeight.w400, height: height);
  }

  static TextStyle h5SemiBold(Color color) {
    return _metropolis(color, 16, FontWeight.w600);
  }

  static TextStyle bodyRegular(Color color) {
    return _metropolis(color, 14, FontWeight.w400);
  }

  static TextStyle bodySemiBold(Color color) {
    return _metropolis(color, 14, FontWeight.w600);
  }

  static TextStyle labelRegular(Color color) {
    return _metropolis(color, 12, FontWeight.w400);
  }

  static TextStyle labelSemiBold(Color color, {double? height}) {
    return _metropolis(color, 12, FontWeight.w600, height: height);
  }

  //metropolis shadow
  static TextStyle shadowText(Color color, Color colorShadow) {
    return _metropolisShadow(color, colorShadow, 36, FontWeight.w600);
  }
}
