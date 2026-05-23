import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/animations.dart';
import 'package:tuto/ui/core/button.dart';
import 'package:tuto/ui/core/icon.dart';
import 'package:tuto/ui/core/progress_bar.dart';
import 'package:tuto/ui/core/top_bar.dart';
import 'package:tuto/ui/features/app_view_model.dart';
import 'package:tuto/ui/features/lesson/view_models/lesson_view_model.dart';
import 'package:tuto/data/repositories/content_repository.dart';
import 'package:tuto/ui/features/lesson/view_models/quiz_view_model.dart';

class QuizScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;

  const QuizScreen({super.key, required this.onBack, required this.onComplete});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizViewModel _vm;
  bool _navigationTriggered = false;

  @override
  void initState() {
    super.initState();
    _vm = QuizViewModel(context.read<ContentRepository>());
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  String _answerText(AppLocalizations l10n, String letter) => switch (letter) {
        'A' => l10n.quizAnswerFive,
        'B' => l10n.quizAnswerFour,
        'C' => l10n.quizAnswerSix,
        'D' => l10n.quizAnswerThree,
        _ => letter,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = context.watch<AppViewModel>().stats;
    final lessonVm = context.watch<LessonViewModel>();

    return ListenableBuilder(
      listenable: _vm,
      builder: (context, _) {
        if (_vm.isComplete && !_navigationTriggered) {
          _navigationTriggered = true;
          WidgetsBinding.instance.addPostFrameCallback((_) => widget.onComplete());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(onBack: widget.onBack, streak: stats.streak, stars: stats.stars, hearts: stats.hearts),
              const SizedBox(height: 8),
              LumioProgressBar(value: lessonVm.quizProgress.toDouble(), fill: LumioProgressFill.accent),
              const SizedBox(height: 18),
              Text(
                l10n.quizEyebrow,
                style: GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.66, color: LumioColors.accentDeep),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.quizQuestion,
                style: GoogleFonts.nunito(fontSize: 26, fontWeight: FontWeight.w900, color: LumioColors.text, height: 1.15),
              ),
              const SizedBox(height: 18),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.4,
                children: _vm.options.map((opt) {
                  final tileState = _tileState(opt.letter, opt.isCorrect);
                  return _AnswerTile(
                    letter: opt.letter,
                    text: _answerText(l10n, opt.letter),
                    state: tileState,
                    onTap: () => _vm.selectAnswer(opt.letter, opt.isCorrect),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (_vm.feedback == QuizFeedback.gentle)
                ShakeAnimation(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(color: LumioColors.magicalSoft, borderRadius: BorderRadius.circular(LumioRadius.md)),
                    child: Text(l10n.quizGentle,
                        style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w800, color: LumioColors.magicalDeep),
                        textAlign: TextAlign.center),
                  ),
                ),
              if (_vm.feedback == QuizFeedback.correct)
                PopIn(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(color: LumioColors.successSoft, borderRadius: BorderRadius.circular(LumioRadius.md)),
                    child: Text(l10n.quizCorrect,
                        style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w800, color: LumioColors.successDeep),
                        textAlign: TextAlign.center),
                  ),
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  LumioIconButton(
                    variant: LumioButtonVariant.audio,
                    icon: const LumioIcon(LumioIconType.speaker, size: 22, color: Colors.white),
                    size: 56,
                  ),
                  const SizedBox(width: 10),
                  LumioButton(variant: LumioButtonVariant.soft, child: Text(l10n.quizHint)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _TileState _tileState(String letter, bool isCorrect) {
    if (_vm.selected == null) return _TileState.neutral;
    if (_vm.selected != letter) return _TileState.neutral;
    if (_vm.feedback == QuizFeedback.correct && isCorrect) return _TileState.correct;
    if (_vm.feedback == QuizFeedback.gentle && !isCorrect) return _TileState.gentle;
    return _TileState.selected;
  }
}

enum _TileState { neutral, selected, correct, gentle }

class _AnswerTile extends StatelessWidget {
  final String letter;
  final String text;
  final _TileState state;
  final VoidCallback onTap;

  const _AnswerTile({required this.letter, required this.text, required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = state;
    final bg = s == _TileState.correct ? LumioColors.successSoft : s == _TileState.gentle ? LumioColors.magicalSoft : s == _TileState.selected ? LumioColors.accentSoft : Colors.white;
    final border = s == _TileState.correct ? LumioColors.success : s == _TileState.gentle ? LumioColors.magical : s == _TileState.selected ? LumioColors.accent : LumioColors.borderStrong;
    final fg = s == _TileState.correct ? LumioColors.successDeep : s == _TileState.gentle ? LumioColors.magicalDeep : s == _TileState.selected ? LumioColors.accentDeep : LumioColors.text;
    final labelBg = s == _TileState.correct ? LumioColors.success : s == _TileState.gentle ? LumioColors.magical : s == _TileState.selected ? LumioColors.accent : LumioColors.accentSoft;
    final labelFg = (s == _TileState.correct || s == _TileState.gentle || s == _TileState.selected) ? Colors.white : LumioColors.accentDeep;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18), border: Border.all(color: border, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(color: labelBg, shape: BoxShape.circle),
              child: Center(child: Text(letter, style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w900, color: labelFg))),
            ),
            const SizedBox(height: 8),
            Text(text, style: GoogleFonts.nunito(fontSize: 17, fontWeight: FontWeight.w800, color: fg)),
          ],
        ),
      ),
    );
  }
}
