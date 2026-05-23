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
import 'package:tuto/ui/features/lesson/view_models/mini_game_view_model.dart';

class MiniGameScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const MiniGameScreen({super.key, required this.onBack, required this.onNext});

  @override
  State<MiniGameScreen> createState() => _MiniGameScreenState();
}

class _MiniGameScreenState extends State<MiniGameScreen> {
  late final MiniGameViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = MiniGameViewModel();
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = context.watch<AppViewModel>().stats;
    final lessonVm = context.watch<LessonViewModel>();

    return ListenableBuilder(
      listenable: _vm,
      builder: (context, _) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(onBack: widget.onBack, streak: stats.streak, stars: stats.stars, hearts: stats.hearts),
            const SizedBox(height: 8),
            LumioProgressBar(value: lessonVm.miniGameProgress.toDouble(), fill: LumioProgressFill.accent),
            const SizedBox(height: 16),
            Text(
              l10n.miniGameEyebrow,
              style: GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.66, color: LumioColors.accentDeep),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w900, color: LumioColors.text, height: 1.15),
                children: [
                  TextSpan(text: l10n.miniGamePromptStart),
                  TextSpan(text: l10n.miniGamePromptHighlight, style: const TextStyle(color: LumioColors.accentDeep)),
                  TextSpan(text: l10n.miniGamePromptEnd),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w800, color: LumioColors.textMuted),
                          children: [
                            TextSpan(text: l10n.miniGameTappedLabel),
                            TextSpan(
                              text: '${_vm.tapped.length}',
                              style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w900, color: LumioColors.accentDeep),
                            ),
                            TextSpan(text: ' / ${MiniGameViewModel.target}'),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          MiniGameViewModel.target,
                          (i) => Container(
                            width: 14,
                            height: 14,
                            margin: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i < _vm.tapped.length ? LumioColors.accent : LumioColors.border,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: MiniGameViewModel.totalStars,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, i) => _StarTile(
                      tapped: _vm.tapped.contains(i),
                      disabled: !_vm.tapped.contains(i) && _vm.tapped.length >= MiniGameViewModel.target,
                      onTap: () => _vm.tapStar(i),
                    ),
                  ),
                ],
              ),
            ),
            if (_vm.isDone) ...[
              const SizedBox(height: 16),
              PopIn(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(color: LumioColors.successSoft, borderRadius: BorderRadius.circular(LumioRadius.md)),
                  child: Text(
                    l10n.miniGameSuccess,
                    style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w800, color: LumioColors.successDeep),
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
                    onPressed: _vm.isDone ? widget.onNext : null,
                    child: Text(l10n.actionNext),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StarTile extends StatelessWidget {
  final bool tapped;
  final bool disabled;
  final VoidCallback onTap;

  const _StarTile({required this.tapped, required this.disabled, required this.onTap});

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
          border: Border.all(color: tapped ? LumioColors.accentDeep : LumioColors.borderStrong, width: 2),
        ),
        child: Center(
          child: Text('★', style: TextStyle(fontSize: 32, color: tapped ? Colors.white : LumioColors.warning)),
        ),
      ),
    );
  }
}
