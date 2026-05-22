import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../widgets/animations.dart';
import '../widgets/button.dart';
import '../widgets/icon.dart';
import '../widgets/progress_bar.dart';
import '../widgets/top_bar.dart';

class MiniGameScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const MiniGameScreen({
    super.key,
    required this.onBack,
    required this.onNext,
  });

  @override
  State<MiniGameScreen> createState() => _MiniGameScreenState();
}

class _MiniGameScreenState extends State<MiniGameScreen> {
  final _tapped = <int>{};
  static const _target = 5;
  static const _totalStars = 7;

  bool get _done => _tapped.length == _target;

  void _tap(int i) {
    if (_tapped.contains(i)) return;
    if (_tapped.length >= _target) return;
    setState(() => _tapped.add(i));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(onBack: widget.onBack, streak: 7, stars: 24, hearts: 5),
          const SizedBox(height: 8),
          LumioProgressBar(value: 45, fill: LumioProgressFill.accent),
          const SizedBox(height: 16),

          Text(
            'YOUR TURN',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              style: GoogleFonts.nunito(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: LumioColors.text,
                height: 1.15,
              ),
              children: [
                const TextSpan(text: 'Tap '),
                TextSpan(
                  text: 'Five stars',
                  style: const TextStyle(color: LumioColors.accentDeep),
                ),
                const TextSpan(text: ' to send to Tuto'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Star grid ─────────────────────────────────────────────────
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFFBF3), Color(0xFFE1F4FF)],
              ),
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.border, width: 2),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Counter row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: LumioColors.textMuted,
                        ),
                        children: [
                          const TextSpan(text: 'Tapped: '),
                          TextSpan(
                            text: '${_tapped.length}',
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: LumioColors.accentDeep,
                            ),
                          ),
                          TextSpan(text: ' / $_target'),
                        ],
                      ),
                    ),
                    Row(
                      children: List.generate(
                        _target,
                        (i) => Container(
                          width: 14,
                          height: 14,
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i < _tapped.length
                                ? LumioColors.accent
                                : LumioColors.border,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _totalStars,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (_, i) => _StarTile(
                    tapped: _tapped.contains(i),
                    disabled: !_tapped.contains(i) && _tapped.length >= _target,
                    onTap: () => _tap(i),
                  ),
                ),
              ],
            ),
          ),

          // ── Success feedback ─────────────────────────────────────────
          if (_done) ...[
            const SizedBox(height: 16),
            PopIn(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: LumioColors.successSoft,
                  borderRadius: BorderRadius.circular(LumioRadius.md),
                ),
                child: Text(
                  'Yes! Five shiny stars ✨',
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: LumioColors.successDeep,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],

          const SizedBox(height: 18),
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
                  onPressed: _done ? widget.onNext : null,
                  child: const Text('Next →'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StarTile extends StatelessWidget {
  final bool tapped;
  final bool disabled;
  final VoidCallback onTap;

  const _StarTile({
    required this.tapped,
    required this.disabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: const Cubic(0.34, 1.56, 0.64, 1),
        decoration: BoxDecoration(
          color: tapped ? LumioColors.accent : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: tapped ? LumioColors.accentDeep : LumioColors.borderStrong,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            '★',
            style: TextStyle(
              fontSize: 32,
              color: tapped ? Colors.white : LumioColors.warning,
            ),
          ),
        ),
      ),
    );
  }
}
