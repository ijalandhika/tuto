import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tokens.dart';

/// All text styles use Nunito — warm, rounded, kid-friendly.
/// Body floor is 18px for 6–10 year old readability.
abstract final class LumioText {
  static TextStyle get h1 => GoogleFonts.nunito(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        height: 1.1,
        letterSpacing: -0.42,
        color: LumioColors.text,
      );

  static TextStyle get h2 => GoogleFonts.nunito(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        height: 1.25,
        color: LumioColors.text,
      );

  static TextStyle get h3 => GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: LumioColors.text,
      );

  static TextStyle get h4 => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: LumioColors.text,
      );

  static TextStyle get body => GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: LumioColors.text,
      );

  static TextStyle get bodyMd => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.6,
        color: LumioColors.text,
      );

  static TextStyle get label => GoogleFonts.nunito(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: LumioColors.text,
      );

  static TextStyle get labelSm => GoogleFonts.nunito(
        fontSize: 15,
        fontWeight: FontWeight.w800,
        color: LumioColors.text,
      );

  static TextStyle get sm => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.45,
        color: LumioColors.textMuted,
      );

  static TextStyle get xs => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: LumioColors.textMuted,
      );

  /// Small uppercase with wide letter-spacing — section labels
  static TextStyle get eyebrow => GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.66,
        color: LumioColors.textMuted,
      );

  static TextStyle get tabLabel => GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        color: LumioColors.textSoft,
      );

  static TextStyle get chipLabel => GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w800,
      );
}
