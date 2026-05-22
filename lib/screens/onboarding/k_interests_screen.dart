import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import '../../widgets/icon.dart';

class KInterestsScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const KInterestsScreen(
      {super.key, required this.onBack, required this.onNext});

  @override
  State<KInterestsScreen> createState() => _KInterestsScreenState();
}

class _Interest {
  final String emoji;
  final String label;
  const _Interest(this.emoji, this.label);
}

const _interests = [
  _Interest('🦕', 'Dinosaurs'),
  _Interest('🚀', 'Space'),
  _Interest('🐋', 'Ocean'),
  _Interest('🔬', 'Science'),
  _Interest('🦸', 'Heroes'),
  _Interest('🌿', 'Nature'),
  _Interest('🎨', 'Art'),
  _Interest('🎵', 'Music'),
  _Interest('⚽', 'Sports'),
];

class _KInterestsScreenState extends State<KInterestsScreen> {
  final _selected = <int>{};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          GestureDetector(
            onTap: widget.onBack,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: LumioColors.borderStrong, width: 2),
              ),
              child: const LumioIcon(LumioIconType.back, size: 18),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'WHAT DO YOU LOVE?',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Pick your favourites!',
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tuto will weave them into your lessons.',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 24),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _interests.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (_, i) {
              final it = _interests[i];
              final sel = _selected.contains(i);
              return GestureDetector(
                onTap: () => setState(() =>
                    sel ? _selected.remove(i) : _selected.add(i)),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      decoration: BoxDecoration(
                        color: sel
                            ? LumioColors.accentSoft
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(LumioRadius.lg),
                        border: Border.all(
                          color: sel
                              ? LumioColors.accent
                              : LumioColors.borderStrong,
                          width: sel ? 2.5 : 2,
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(it.emoji,
                                style: const TextStyle(fontSize: 36)),
                            const SizedBox(height: 6),
                            Text(
                              it.label,
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: sel
                                    ? LumioColors.accentDeep
                                    : LumioColors.text,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (sel)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: LumioColors.accent,
                            shape: BoxShape.circle,
                          ),
                          child: const LumioIcon(LumioIconType.check, size: 12, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 28),

          LumioButton(
            variant: LumioButtonVariant.primary,
            full: true,
            onPressed: _selected.isNotEmpty ? widget.onNext : null,
            child: const Text("That's me! →"),
          ),
        ],
      ),
    );
  }
}
