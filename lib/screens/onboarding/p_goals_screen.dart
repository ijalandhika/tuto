import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import 'onboarding_widgets.dart';

class PGoalsScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const PGoalsScreen({super.key, required this.onBack, required this.onNext});

  @override
  State<PGoalsScreen> createState() => _PGoalsScreenState();
}

class _Goal {
  final String emoji;
  final String title;
  final String sub;
  const _Goal(this.emoji, this.title, this.sub);
}

const _goals = [
  _Goal('📖', 'Build reading skills', 'Stories, phonics & more'),
  _Goal('🔬', 'Stay curious', 'Science, nature & wonder'),
  _Goal('🔢', 'Love maths', 'Numbers made fun'),
  _Goal('⏱', 'Less screen guilt', 'Quality learning time'),
  _Goal('💪', 'Build confidence', 'Try, learn, grow'),
  _Goal('🌍', 'Explore the world', 'Geography & cultures'),
];

class _PGoalsScreenState extends State<PGoalsScreen> {
  final _selected = <int>{};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          OnboardingTopBar(onBack: widget.onBack, step: 3, total: 4),
          const SizedBox(height: 24),

          Text(
            'LEARNING GOALS',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'What matters most\nto your family?',
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Pick all that apply. Tuto will personalise the experience.',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 24),

          ...List.generate(_goals.length, (i) {
            final g = _goals[i];
            final sel = _selected.contains(i);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => setState(() =>
                    sel ? _selected.remove(i) : _selected.add(i)),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: sel ? LumioColors.accentSoft : Colors.white,
                    borderRadius: BorderRadius.circular(LumioRadius.lg),
                    border: Border.all(
                      color: sel
                          ? LumioColors.accent
                          : LumioColors.borderStrong,
                      width: 2,
                    ),
                    boxShadow: sel
                        ? const [
                            BoxShadow(
                                color: LumioColors.accentDeep,
                                blurRadius: 0,
                                offset: Offset(0, 3))
                          ]
                        : LumioShadows.sm,
                  ),
                  child: Row(
                    children: [
                      Text(g.emoji, style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              g.title,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: sel
                                    ? LumioColors.accentDeep
                                    : LumioColors.text,
                              ),
                            ),
                            Text(
                              g.sub,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: LumioColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: sel
                              ? LumioColors.accent
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: sel
                                ? LumioColors.accent
                                : LumioColors.borderStrong,
                            width: 2,
                          ),
                        ),
                        child: sel
                            ? const Icon(Icons.check_rounded,
                                color: Colors.white, size: 14)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 8),

          LumioButton(
            variant: LumioButtonVariant.primary,
            full: true,
            onPressed: _selected.isNotEmpty ? widget.onNext : null,
            child: const Text('Continue →'),
          ),
        ],
      ),
    );
  }
}
