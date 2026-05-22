import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/animations.dart';
import '../../widgets/icon.dart';
import '../../widgets/button.dart';

class KReadyScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onFinish;

  const KReadyScreen({super.key, required this.onBack, required this.onFinish});

  @override
  State<KReadyScreen> createState() => _KReadyScreenState();
}

class _KReadyScreenState extends State<KReadyScreen> {
  bool _shown = false;

  static const _confettiColors = [
    LumioColors.warning,
    LumioColors.accent,
    LumioColors.magical,
    LumioColors.success,
  ];

  static const _confettiPositions = [
    (top: 0.05, left: 0.08),
    (top: 0.10, left: 0.25),
    (top: 0.15, left: 0.60),
    (top: 0.08, left: 0.80),
    (top: 0.20, left: 0.45),
    (top: 0.25, left: 0.90),
    (top: 0.30, left: 0.15),
    (top: 0.18, left: 0.70),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _shown = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.3),
              radius: 0.9,
              colors: [Color(0xFFFFF1C9), LumioColors.bg],
            ),
          ),
        ),

        // Confetti
        ..._confettiPositions.asMap().entries.map((e) {
          final i = e.key;
          final pos = e.value;
          return AnimatedPositioned(
            duration: Duration(milliseconds: 500 + i * 100),
            curve: const Cubic(0.34, 1.56, 0.64, 1),
            top: MediaQuery.of(context).size.height * pos.top +
                (_shown ? (i % 3) * 4.0 : -30),
            left: MediaQuery.of(context).size.width * pos.left,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 350 + i * 50),
              opacity: _shown ? 1 : 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _confettiColors[i % 4],
                ),
              ),
            ),
          );
        }),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: widget.onBack,
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
                ),

                const Spacer(),

                BounceAnimation(
                  child: SvgPicture.asset(
                    'assets/tuto-turtle.svg',
                    width: 140,
                    height: 140,
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  "YOU'RE ALL SET!",
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.72,
                    color: LumioColors.warningDeep,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ready for your first quest?',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                    height: 1.05,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Tuto is waiting for you on the map.\nLet the adventure begin!",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: LumioColors.textMuted,
                    height: 1.45,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 28),

                // First quest preview
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(LumioRadius.xl),
                    border: Border.all(
                        color: LumioColors.border, width: 2),
                    boxShadow: LumioShadows.md,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              LumioColors.accent,
                              LumioColors.accentDeep
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                            child: Text('🐋',
                                style: TextStyle(fontSize: 24))),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FIRST QUEST',
                              style: GoogleFonts.nunito(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.6,
                                color: LumioColors.accentDeep,
                              ),
                            ),
                            Text(
                              'Whales of the Deep',
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: LumioColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const LumioIcon(LumioIconType.chevronRight, size: 14, color: LumioColors.textSoft),
                    ],
                  ),
                ),

                const Spacer(),

                LumioButton(
                  variant: LumioButtonVariant.warning,
                  full: true,
                  onPressed: widget.onFinish,
                  child: const Text('Start my adventure! 🚀'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
