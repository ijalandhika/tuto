import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../widgets/top_bar.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(streak: 7, stars: 24, hearts: 5),
          const SizedBox(height: 8),

          // Profile — centered
          Center(
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [LumioColors.accentSoft, Color(0xFFFFF1C9)],
                    ),
                    border: Border.fromBorderSide(
                        BorderSide(color: LumioColors.accent, width: 3)),
                    boxShadow: [
                      BoxShadow(
                          color: LumioColors.accentDeep,
                          blurRadius: 0,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: const Center(
                    child: Text('🦊', style: TextStyle(fontSize: 64)),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Maya, 8',
                  style: GoogleFonts.nunito(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Learning since April · Level 4',
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: LumioColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // 3-stat grid
          Row(
            children: const [
              _MeStat(emoji: '🔥', value: '7', label: 'STREAK'),
              SizedBox(width: 8),
              _MeStat(emoji: '★', value: '24', label: 'STARS'),
              SizedBox(width: 8),
              _MeStat(emoji: '🏆', value: '4', label: 'BADGES'),
            ],
          ),

          const SizedBox(height: 22),

          _SectionLabel(label: 'SETTINGS'),
          const SizedBox(height: 8),
          _SettingRow(emoji: '🎨', title: 'Change avatar', sub: 'Pick a new buddy'),
          _SettingRow(emoji: '🔊', title: "Tuto's voice", sub: 'Cheery'),
          _SettingRow(emoji: '🎵', title: 'Sounds & music', sub: 'On'),
          _SettingRow(emoji: '🌙', title: 'Bedtime mode', sub: 'Off'),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.66,
        color: LumioColors.textMuted,
      ),
    );
  }
}

class _MeStat extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  const _MeStat(
      {required this.emoji, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LumioColors.border, width: 2),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 2),
            Text(
              value,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: LumioColors.text,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: LumioColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final String emoji;
  final String title;
  final String sub;
  const _SettingRow(
      {required this.emoji, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LumioColors.border, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: LumioColors.bg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.text,
                    ),
                  ),
                  Text(
                    sub,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: LumioColors.textSoft),
          ],
        ),
      ),
    );
  }
}
