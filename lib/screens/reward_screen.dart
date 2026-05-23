import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/animations.dart';
import '../widgets/button.dart';
import '../widgets/chip.dart';

class RewardScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBadges;

  const RewardScreen({
    super.key,
    required this.onContinue,
    required this.onBadges,
  });

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  bool _shown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _shown = true);
    });
  }

  static const _confettiColors = [
    LumioColors.warning,
    LumioColors.accent,
    LumioColors.magical,
    LumioColors.success,
  ];

  static const _confettiPositions = [
    (top: 0.20, left: 0.05),
    (top: 0.14, left: 0.23),
    (top: 0.28, left: 0.40),
    (top: 0.10, left: 0.60),
    (top: 0.22, left: 0.78),
    (top: 0.35, left: 0.88),
    (top: 0.42, left: 0.12),
    (top: 0.50, left: 0.30),
    (top: 0.18, left: 0.50),
    (top: 0.32, left: 0.65),
    (top: 0.45, left: 0.82),
    (top: 0.08, left: 0.35),
    (top: 0.38, left: 0.55),
    (top: 0.25, left: 0.92),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Stack(
      children: [
        // Radial bg
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.4),
              radius: 0.8,
              colors: [Color(0xFFE1F4FF), LumioColors.bg],
            ),
          ),
        ),

        // Confetti dots
        ..._confettiPositions.asMap().entries.map((e) {
          final i = e.key;
          final pos = e.value;
          return AnimatedPositioned(
            duration: Duration(milliseconds: 600 + (i % 5) * 120),
            curve: const Cubic(0.34, 1.56, 0.64, 1),
            top: MediaQuery.of(context).size.height * pos.top +
                (_shown ? (i % 3) * 4.0 : -30),
            left: MediaQuery.of(context).size.width * pos.left,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400 + i * 40),
              opacity: _shown ? 1 : 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _confettiColors[i % 4],
                ),
              ),
            ),
          );
        }),

        // Content
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
          child: Column(
            children: [
              BounceAnimation(
                child: SvgPicture.asset(
                  'assets/tuto-turtle.svg',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.rewardEyebrow,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.72,
                  color: LumioColors.warningDeep,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.rewardTitle,
                style: GoogleFonts.nunito(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                  height: 1.05,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                l10n.rewardSubtitle,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: LumioColors.textMuted,
                  height: 1.45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),

              // Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  LumioChip(
                    variant: LumioChipVariant.star,
                    icon: const Text('★',
                        style: TextStyle(
                            fontSize: 12, color: Color(0xFFE0A310))),
                    label: l10n.rewardChipStars,
                  ),
                  LumioChip(
                    variant: LumioChipVariant.badge,
                    icon: const Text('🏆', style: TextStyle(fontSize: 12)),
                    label: l10n.badgeStarCounter,
                  ),
                  LumioChip(
                    variant: LumioChipVariant.streak,
                    icon: const Text('🔥', style: TextStyle(fontSize: 12)),
                    label: l10n.rewardChipStreak,
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // New badge card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(LumioRadius.xl),
                  border: Border.all(
                      color: LumioColors.accent,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignInside),
                  boxShadow: LumioShadows.md,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [LumioColors.accent, LumioColors.accentDeep],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: LumioColors.accentDeep,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: const Center(
                          child: Text('🏆',
                              style: TextStyle(fontSize: 30))),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.rewardNewBadgeLabel,
                            style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.6,
                              color: LumioColors.accentDeep,
                            ),
                          ),
                          Text(
                            l10n.badgeStarCounter,
                            style: GoogleFonts.nunito(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: LumioColors.text,
                            ),
                          ),
                          Text(
                            l10n.rewardBadgeDesc,
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: LumioColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),

              LumioButton(
                variant: LumioButtonVariant.primary,
                full: true,
                onPressed: widget.onContinue,
                child: Text(l10n.rewardContinue),
              ),
              const SizedBox(height: 10),
              LumioButton(
                variant: LumioButtonVariant.ghost,
                onPressed: widget.onBadges,
                child: Text(l10n.rewardSeeBadges),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
