import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../widgets/icon.dart';

class WeeklyReportScreen extends StatelessWidget {
  final VoidCallback onBack;

  const WeeklyReportScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: LumioColors.borderStrong, width: 2),
                  ),
                  child: const LumioIcon(LumioIconType.back, size: 18),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Weekly Report',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Tuto says card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE1F4FF), Color(0xFFD0EEFF)],
              ),
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.accent, width: 2),
              boxShadow: LumioShadows.md,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/tuto-turtle.svg',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TUTO SAYS',
                        style: GoogleFonts.nunito(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                          color: LumioColors.accentDeep,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Maya is really finding her groove! She improved her reading speed by 15% and attempted maths every single day.",
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: LumioColors.text,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Highlights
          Text(
            'HIGHLIGHTS',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 10),

          ..._highlights.map((h) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(LumioRadius.md),
                    border: Border.all(
                        color: LumioColors.border, width: 1.5),
                    boxShadow: LumioShadows.sm,
                  ),
                  child: Row(
                    children: [
                      Text(h.emoji,
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          h.text,
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.text,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),

          const SizedBox(height: 20),

          // 2×2 stats grid
          Text(
            'THIS WEEK',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 10),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.6,
            children: const [
              _WeekStat(emoji: '⏱', value: '68 min', label: 'Learning time'),
              _WeekStat(emoji: '📘', value: '3', label: 'Lessons done'),
              _WeekStat(emoji: '⭐', value: '+12', label: 'Stars earned'),
              _WeekStat(emoji: '🏆', value: '1 new', label: 'Badge unlocked'),
            ],
          ),

          const SizedBox(height: 20),

          // Next week tip
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: LumioColors.successSoft,
              borderRadius: BorderRadius.circular(LumioRadius.md),
              border: Border.all(color: LumioColors.success, width: 1.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🌱', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next week suggestion',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: LumioColors.successDeep,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Try adding a weekend session — Maya is most engaged on Saturdays!",
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: LumioColors.text,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Highlight {
  final String emoji;
  final String text;
  const _Highlight(this.emoji, this.text);
}

const _highlights = [
  _Highlight('📖', 'Finished the Whales of the Deep quest — first time in under 8 minutes!'),
  _Highlight('🔢', 'Got 4/4 on the counting quiz. No hints needed!'),
  _Highlight('🔥', 'Kept a 7-day streak going — her longest ever!'),
];

class _WeekStat extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;

  const _WeekStat(
      {required this.emoji, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(LumioRadius.lg),
        border: Border.all(color: LumioColors.border, width: 1.5),
        boxShadow: LumioShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
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
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: LumioColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
