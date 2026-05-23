import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/icon.dart';

class WeeklyReportScreen extends StatelessWidget {
  final VoidCallback onBack;

  const WeeklyReportScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final highlights = _highlightsFor(l10n);
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
                l10n.weeklyReportTitle,
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
                        l10n.weeklyTutoSaysLabel,
                        style: GoogleFonts.nunito(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                          color: LumioColors.accentDeep,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.weeklyTutoSaysText,
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
            l10n.weeklyHighlightsLabel,
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 10),

          ...highlights.map((h) => Padding(
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
            l10n.weeklyThisWeekLabel,
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
            children: [
              _WeekStat(emoji: '⏱', value: l10n.weeklyStatTimeValue, label: l10n.weeklyStatTimeLabel),
              _WeekStat(emoji: '📘', value: l10n.weeklyStatLessonsValue, label: l10n.weeklyStatLessonsLabel),
              _WeekStat(emoji: '⭐', value: l10n.weeklyStatStarsValue, label: l10n.weeklyStatStarsLabel),
              _WeekStat(emoji: '🏆', value: l10n.weeklyStatBadgeValue, label: l10n.weeklyStatBadgeLabel),
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
                        l10n.weeklyNextWeekTitle,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: LumioColors.successDeep,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        l10n.weeklyNextWeekText,
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

List<_Highlight> _highlightsFor(AppLocalizations l10n) => [
  _Highlight('📖', l10n.weeklyHighlight1),
  _Highlight('🔢', l10n.weeklyHighlight2),
  _Highlight('🔥', l10n.weeklyHighlight3),
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
