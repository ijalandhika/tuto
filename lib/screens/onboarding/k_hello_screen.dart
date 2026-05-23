import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/animations.dart';
import '../../widgets/button.dart';

class KHelloScreen extends StatelessWidget {
  final VoidCallback onNext;

  const KHelloScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE1F4FF), LumioColors.bg],
          stops: [0.0, 0.6],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
          child: Column(
            children: [
              const Spacer(),

              BounceAnimation(
                child: SvgPicture.asset(
                  'assets/tuto-turtle.svg',
                  width: 160,
                  height: 160,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                l10n.kHelloTitle,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.kHelloSubtitle,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: LumioColors.textMuted,
                  height: 1.45,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Fun facts row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FunChip(emoji: '⭐', label: l10n.kHelloChipStars),
                  const SizedBox(width: 8),
                  _FunChip(emoji: '🏆', label: l10n.kHelloChipBadges),
                  const SizedBox(width: 8),
                  _FunChip(emoji: '🗺', label: l10n.kHelloChipQuests),
                ],
              ),

              const Spacer(),

              LumioButton(
                variant: LumioButtonVariant.primary,
                full: true,
                onPressed: onNext,
                child: Text(l10n.kHelloCta),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FunChip extends StatelessWidget {
  final String emoji;
  final String label;
  const _FunChip({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(LumioRadius.md),
        border: Border.all(color: LumioColors.borderStrong, width: 1.5),
        boxShadow: LumioShadows.sm,
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: LumioColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
