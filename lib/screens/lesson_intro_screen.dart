import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/animations.dart';
import '../widgets/button.dart';
import '../widgets/icon.dart';
import '../widgets/chip.dart';
import '../widgets/progress_bar.dart';
import '../widgets/speech_bubble.dart';
import '../widgets/top_bar.dart';

class LessonIntroScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const LessonIntroScreen({
    super.key,
    required this.onBack,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(onBack: onBack, streak: 7, stars: 24, hearts: 5),
          const SizedBox(height: 8),
          LumioProgressBar(value: 20, fill: LumioProgressFill.accent),
          const SizedBox(height: 14),

          // ── Hero card ─────────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(22, 28, 22, 22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE1F4FF), Color(0xFFFFF1C9)],
              ),
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.accentSoft, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  l10n.lessonEyebrow,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.66,
                    color: LumioColors.accentDeep,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.lessonTitle,
                  style: GoogleFonts.nunito(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                BobAnimation(
                  child: const Text('🔢', style: TextStyle(fontSize: 80)),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    LumioChip(
                      variant: LumioChipVariant.defaultChip,
                      size: LumioChipSize.sm,
                      icon: const Text('⏱', style: TextStyle(fontSize: 12)),
                      label: l10n.lessonChipTime,
                    ),
                    LumioChip(
                      variant: LumioChipVariant.star,
                      size: LumioChipSize.sm,
                      icon: const Text('★',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xFFE0A310))),
                      label: l10n.lessonChipStars,
                    ),
                    LumioChip(
                      variant: LumioChipVariant.bonus,
                      size: LumioChipSize.sm,
                      label: l10n.lessonChipWords,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),
          SpeechBubble(
            speaking: true,
            text: l10n.lessonSpeech,
          ),
          const SizedBox(height: 22),

          // ── Actions ───────────────────────────────────────────────────
          Row(
            children: [
              LumioIconButton(
                variant: LumioButtonVariant.audio,
                icon: const LumioIcon(LumioIconType.speaker, size: 22, color: Colors.white),
                size: 56,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: LumioButton(
                  variant: LumioButtonVariant.primary,
                  full: true,
                  onPressed: onNext,
                  child: Text(l10n.lessonCta),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
