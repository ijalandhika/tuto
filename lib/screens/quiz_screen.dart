import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../widgets/animations.dart';
import '../widgets/button.dart';
import '../widgets/progress_bar.dart';
import '../widgets/top_bar.dart';

enum QuizFeedback { none, correct, gentle }

class _Answer {
  final String letter;
  final String text;
  final bool correct;
  const _Answer(this.letter, this.text, this.correct);
}

const _answers = [
  _Answer('A', 'Five 🌟', true),
  _Answer('B', 'Four', false),
  _Answer('C', 'Six', false),
  _Answer('D', 'Three', false),
];

class QuizScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;

  const QuizScreen({
    super.key,
    required this.onBack,
    required this.onComplete,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? _selected;
  QuizFeedback _feedback = QuizFeedback.none;

  void _answer(String letter, bool correct) {
    if (_selected != null) return;
    setState(() {
      _selected = letter;
      _feedback = correct ? QuizFeedback.correct : QuizFeedback.gentle;
    });
    if (correct) {
      Future.delayed(const Duration(milliseconds: 1100), widget.onComplete);
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) setState(() { _selected = null; _feedback = QuizFeedback.none; });
      });
    }
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
          LumioProgressBar(value: 70, fill: LumioProgressFill.accent),
          const SizedBox(height: 18),

          Text(
            'QUESTION 3 OF 4',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'How many stars did we count?',
            style: GoogleFonts.nunito(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 18),

          // ── 2×2 answer grid ───────────────────────────────────────────
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.4,
            children: _answers.map((a) {
              final tileState = _tileState(a);
              return _AnswerTile(
                answer: a,
                state: tileState,
                onTap: () => _answer(a.letter, a.correct),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // ── Feedback banner ───────────────────────────────────────────
          if (_feedback == QuizFeedback.gentle)
            ShakeAnimation(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: LumioColors.magicalSoft,
                  borderRadius: BorderRadius.circular(LumioRadius.md),
                ),
                child: Text(
                  'Almost! Let\'s try again 💛',
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: LumioColors.magicalDeep,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (_feedback == QuizFeedback.correct)
            PopIn(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: LumioColors.successSoft,
                  borderRadius: BorderRadius.circular(LumioRadius.md),
                ),
                child: Text(
                  "That's right! ✨",
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: LumioColors.successDeep,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          const SizedBox(height: 16),
          Row(
            children: [
              LumioIconButton(
                variant: LumioButtonVariant.audio,
                icon: const Icon(Icons.volume_up_rounded,
                    color: Colors.white, size: 22),
                size: 56,
              ),
              const SizedBox(width: 10),
              LumioButton(
                variant: LumioButtonVariant.soft,
                child: const Text('Hint'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _TileState _tileState(_Answer a) {
    if (_selected == null) return _TileState.neutral;
    if (_selected != a.letter) return _TileState.neutral;
    if (_feedback == QuizFeedback.correct && a.correct) return _TileState.correct;
    if (_feedback == QuizFeedback.gentle && !a.correct) return _TileState.gentle;
    return _TileState.selected;
  }
}

enum _TileState { neutral, selected, correct, gentle }

class _AnswerTile extends StatefulWidget {
  final _Answer answer;
  final _TileState state;
  final VoidCallback onTap;

  const _AnswerTile({
    required this.answer,
    required this.state,
    required this.onTap,
  });

  @override
  State<_AnswerTile> createState() => _AnswerTileState();
}

class _AnswerTileState extends State<_AnswerTile> {
  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    final bg = s == _TileState.correct
        ? LumioColors.successSoft
        : s == _TileState.gentle
            ? LumioColors.magicalSoft
            : s == _TileState.selected
                ? LumioColors.accentSoft
                : Colors.white;
    final border = s == _TileState.correct
        ? LumioColors.success
        : s == _TileState.gentle
            ? LumioColors.magical
            : s == _TileState.selected
                ? LumioColors.accent
                : LumioColors.borderStrong;
    final fg = s == _TileState.correct
        ? LumioColors.successDeep
        : s == _TileState.gentle
            ? LumioColors.magicalDeep
            : s == _TileState.selected
                ? LumioColors.accentDeep
                : LumioColors.text;
    final labelBg = s == _TileState.correct
        ? LumioColors.success
        : s == _TileState.gentle
            ? LumioColors.magical
            : s == _TileState.selected
                ? LumioColors.accent
                : LumioColors.accentSoft;
    final labelFg = (s == _TileState.correct ||
            s == _TileState.gentle ||
            s == _TileState.selected)
        ? Colors.white
        : LumioColors.accentDeep;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: labelBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.answer.letter,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: labelFg,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.answer.text,
              style: GoogleFonts.nunito(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
