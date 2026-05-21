import 'package:flutter/material.dart';

abstract final class LumioColors {
  // Backgrounds — warm cream, never pure white
  static const bg = Color(0xFFFFF8EE);
  static const bgAlt = Color(0xFFFFEFD9);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceWarm = Color(0xFFFFFBF3);

  // Accent: Sky blue (default tweak)
  static const accent = Color(0xFF3FB8FF);
  static const accentSoft = Color(0xFFE1F4FF);
  static const accentDeep = Color(0xFF1F8FD6);

  // Primary: Berry/purple
  static const primary = Color(0xFF7B5CFF);
  static const primarySoft = Color(0xFFEFEAFF);
  static const primaryDeep = Color(0xFF5638E0);

  // Success: Tuto's signature leaf green (also the shell color)
  static const success = Color(0xFF46C77A);
  static const successSoft = Color(0xFFDDF6E7);
  static const successDeep = Color(0xFF2A9F5A);

  // Warning: sunshine yellow — stars, rewards, sparkle
  static const warning = Color(0xFFFFC83D);
  static const warningSoft = Color(0xFFFFF1C9);
  static const warningDeep = Color(0xFFE0A310);

  // Magical: warm coral — gentle wrong-answer tone, badges
  static const magical = Color(0xFFFF8A7A);
  static const magicalSoft = Color(0xFFFFE4DF);
  static const magicalDeep = Color(0xFFE55F4D);

  // Text: warm brown, never black
  static const text = Color(0xFF4A2E1F);
  static const textMuted = Color(0xFF8A6E5E);
  static const textSoft = Color(0xFFB8A08F);

  // Borders
  static const border = Color(0xFFF1E2CE);
  static const borderStrong = Color(0xFFE5D0B3);

  // Overlay / scrim
  static const overlay = Color(0x8C4A2E1F);
}

abstract final class LumioSpacing {
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16;
  static const double s5 = 20;
  static const double s6 = 24;
  static const double s8 = 32;
  static const double s10 = 40;
  static const double s12 = 48;
  static const double s16 = 64;
  static const double s20 = 80;
}

abstract final class LumioRadius {
  static const double sm = 8;
  static const double md = 14;
  static const double lg = 20;
  static const double xl = 28;
  static const double xxl = 36;
  static const double pill = 999;

  static const smBR = BorderRadius.all(Radius.circular(sm));
  static const mdBR = BorderRadius.all(Radius.circular(md));
  static const lgBR = BorderRadius.all(Radius.circular(lg));
  static const xlBR = BorderRadius.all(Radius.circular(xl));
  static const pillBR = BorderRadius.all(Radius.circular(pill));
}

abstract final class LumioShadows {
  static const sm = [
    BoxShadow(color: Color(0x0F4A2E1F), blurRadius: 2, offset: Offset(0, 1)),
  ];
  static const md = [
    BoxShadow(color: Color(0x144A2E1F), blurRadius: 12, offset: Offset(0, 4)),
  ];
  static const lg = [
    BoxShadow(color: Color(0x1A4A2E1F), blurRadius: 28, offset: Offset(0, 10)),
  ];

  // Chunky 4px-offset button shadow — the tactile "depressable" feel
  static const buttonAccent = [
    BoxShadow(color: LumioColors.accentDeep, blurRadius: 0, offset: Offset(0, 4)),
  ];
  static const buttonSuccess = [
    BoxShadow(color: LumioColors.successDeep, blurRadius: 0, offset: Offset(0, 4)),
  ];
  static const buttonWarning = [
    BoxShadow(color: LumioColors.warningDeep, blurRadius: 0, offset: Offset(0, 4)),
  ];
  static const buttonSecondary = [
    BoxShadow(color: LumioColors.borderStrong, blurRadius: 0, offset: Offset(0, 2)),
  ];
  static const nodeSuccess = [
    BoxShadow(color: LumioColors.successDeep, blurRadius: 0, offset: Offset(0, 5)),
  ];
  static const nodeAccent = [
    BoxShadow(color: LumioColors.accentDeep, blurRadius: 0, offset: Offset(0, 5)),
  ];
  static const nodeLocked = [
    BoxShadow(color: LumioColors.borderStrong, blurRadius: 0, offset: Offset(0, 3)),
  ];
}
