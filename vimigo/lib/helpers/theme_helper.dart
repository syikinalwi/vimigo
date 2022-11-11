import 'package:flutter/material.dart';

extension CustomColorContext on BuildContext {
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00

  // // In App
  // Color get colorHover => customColor(light: 0x07000000);
  // Color get colorHighlight => customColor(light: 0x1A000000);

  // Figma
  Color get colorPrimary =>
      customColor(light: 0xFF3B5998, dark: 0xFFBDD536); //done
  Color get colorSecondary => customColor(light: 0xFF00BFDD);
  Color get colorSuccess => customColor(light: 0xFF198754);
  Color get colorDanger => customColor(light: 0xFFDC3545);
  Color get colorWarning => customColor(light: 0xFFFFC107);
  Color get colorLight => customColor(light: 0xFFF8F9FA);
  Color get colorDark => customColor(light: 0xFF212529);

  Color get colorFontPrimary =>
      customColor(light: 0xFF1A1A1A, dark: 0xFFFFFFFF);
  Color get colorFontInactive => customColor(light: 0xFFA3A3A3);
  Color get colorFontWhite => customColor(light: 0xFFFFFFFF);

  Color get colorBgPrimary => customColor(light: 0xFFFFFFFF, dark: 0xFF000000);

  // App Bar
  Color get colorAppBarBG => colorBgPrimary;
  Color get colorAppBarText => colorFontPrimary;
  Color get colorAppBarButton => colorFontPrimary;

  // //Bottom Navigation Bar
  // Color get colorBottomNavigationBarBG => customColor(light: 0xFFFFFFFF);
  // Color get colorBottomNavigationBarSelected => colorPurple;
  // Color get colorBottomNavigationBarUnSelected =>
  //     customColor(light: 0xFF969AC5);

  // TextField
  Color get colorTextFieldTitle => colorFontPrimary;
  Color get colorTextFieldContent => colorFontPrimary;
  Color get colorTextFieldPlaceholder => customColor(light: 0x8030328E);
  Color get colorTextFieldBG => customColor(light: 0xFFF1F1F9);
  Color get colorTextFieldValid => customColor(light: 0x00FFFFFF);
  Color get colorTextFieldFocus => colorPrimary;
  Color get colorTextFieldError => customColor(light: 0xFFFF2070);
  Color get colorTextFieldDisable => colorDisable;
  Color get colorTextFieldCursor => colorPrimary;
  Color get colorTextFieldSearchPlaceholder => customColor(light: 0xFFCED4DA);
  Color get colorTextFieldSearchText => customColor(light: 0xFF000000);

  // Bottom Sheet
  Color get colorBottomSheetBG => customColor(light: 0xFFFFFFFF);
  Color get colorBottomSheetBarrierBG => customColor(light: 0x80000000);

  // Buttons
  Color get colorButtonDisable => colorDisable;
  Color get colorButtonTextDisable => colorFontInactive;

  // Calendar
  Color get colorCalendarSelectedColor => colorPrimary;
  Color get colorCalendarTodayColor => colorPrimary;

  //
  Color get colorMainBG => customColor(light: 0xFFF5F5F5);
  Color get colorDivider => customColor(light: 0xFFE8E8E8);
  Color get colorToggleCheckedColor => customColor(light: 0xFFF94242);
  Color get colorGrayText => customColor(light: 0xFFA2A2C9);
  //
  Color get colorWhite => customColor(light: 0xFFFFFFFF);
  Color get colorBlack => customColor(light: 0xFF000000);
  Color get colorWhite50 => customColor(light: 0x8CFFFFFF);
  // Color get colorOrange => customColor(light: 0xFFFF5F55);
  Color get colorPurple => customColor(light: 0xFF31338F);
  Color get colorLightPurple => customColor(light: 0xFFA2A2C9);
  // Color get colorLightGrayPurple => customColor(light: 0xFFF8F8FC);
  Color get colorGray => customColor(light: (0xFF949494));
  Color get colorClear => customColor(light: (0x00000000));
  Color get colorClearWhite => customColor(light: (0x00FFFFFF));
  // Color get colorFB => customColor(light: 0xFF1A77F2);
  Color get colorAlertBarrier => customColor(light: (0x8A000000));
  Color get colorAlertContent => customColor(light: (0xFF2A2B4B));
  // Color get colorBlue => customColor(light: 0xFF3682D5);
  Color get colorDisable => Colors.grey.shade300;
  Color get colorIconBackground => customColor(light: 0xFFF8F8F9);

  //
  Color get colorToastBg => customColor(light: 0xFFEEEEEE);
  Color get colorDarkLighPurple => customColor(light: 0xFF9F9DCE);

  //Gradients Drawer
  Color get colorGradientDrawerBlue1 => customColor(light: 0xFF3682D5);
  Color get colorGradientDrawerBlue2 => customColor(light: 0xFF27A9F1);
  Color get colorGradientDrawerBlue3 => customColor(light: 0xFF22ACEE);
  Color get colorGradientDrawerBlue4 => customColor(light: 0xFF12B5E6);
  Color get colorGradientDrawerBlue5 => customColor(light: 0xFF00BFDD);
  Color get colorGradientDrawerBlue6 => customColor(light: 0xFF00B3D0);
  List<Color> get colorGradientDrawerBlue => [
        colorGradientDrawerBlue1,
        colorGradientDrawerBlue2,
        colorGradientDrawerBlue3,
        colorGradientDrawerBlue4,
        colorGradientDrawerBlue5,
        colorGradientDrawerBlue6,
      ];

  Color get colorTest => customColor(light: 0xFF000000, dark: 0xFFFFFFFF);
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  hoverColor: const Color(0x07000000),
  highlightColor: const Color(0x1A000000),
  // dividerColor: Colors.transparent,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  hoverColor: const Color(0x07FFFFFF),
  highlightColor: const Color(0x1AFFFFFF),
  // dividerColor: Colors.transparent,
);

extension ColorContext on BuildContext {
  Color customColor({required int light, int? dark}) {
    int finalDark = dark ?? light;

    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(finalDark);
  }
}
