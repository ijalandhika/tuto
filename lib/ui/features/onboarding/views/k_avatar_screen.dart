import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/button.dart';
import 'package:tuto/ui/core/icon.dart';

class KAvatarScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const KAvatarScreen({super.key, required this.onBack, required this.onNext});

  @override
  State<KAvatarScreen> createState() => _KAvatarScreenState();
}

const _avatars = [
  '🦊', '🐼', '🦁', '🐸',
  '🦋', '🐬', '🦄', '🐧',
  '🦝', '🐻', '🦉', '🐙',
];

class _KAvatarScreenState extends State<KAvatarScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Simple back row (no progress on kid path)
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

          // Large preview
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Container(
                key: ValueKey(_selected),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: LumioColors.accentSoft,
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: LumioColors.accent, width: 3),
                  boxShadow: const [
                    BoxShadow(
                        color: LumioColors.accentDeep,
                        blurRadius: 0,
                        offset: Offset(0, 4))
                  ],
                ),
                child: Center(
                  child: Text(
                    _avatars[_selected],
                    style: const TextStyle(fontSize: 56),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: Text(
              l10n.kAvatarTitle,
              style: GoogleFonts.nunito(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: LumioColors.text,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              l10n.kAvatarSubtitle,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: LumioColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 24),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, i) {
              final sel = _selected == i;
              return GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: sel ? LumioColors.accentSoft : Colors.white,
                    borderRadius: BorderRadius.circular(LumioRadius.lg),
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
                    child: Text(
                      _avatars[i],
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 28),

          LumioButton(
            variant: LumioButtonVariant.primary,
            full: true,
            onPressed: widget.onNext,
            child: Text(l10n.kAvatarCta(_avatars[_selected])),
          ),
        ],
      ),
    );
  }
}
