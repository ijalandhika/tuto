import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/animations.dart';
import 'package:tuto/ui/core/icon.dart';

class KickoffScreen extends StatelessWidget {
  final VoidCallback onParent;
  final VoidCallback onChild;

  const KickoffScreen({
    super.key,
    required this.onParent,
    required this.onChild,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.6),
          radius: 0.8,
          colors: [LumioColors.accentSoft, LumioColors.bg],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 32),
          child: Column(
            children: [
              const SizedBox(height: 8),
              BobAnimation(
                child: SvgPicture.asset(
                  'assets/tuto-turtle.svg',
                  width: 110,
                  height: 110,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                l10n.kickoffEyebrow,
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.08 * 13,
                  color: LumioColors.accentDeep,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.kickoffTitle,
                style: GoogleFonts.nunito(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                  height: 1.05,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.kickoffSubtitle,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: LumioColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              _RoleCard(
                emoji: '👋',
                title: l10n.kickoffGrownupTitle,
                subtitle: l10n.kickoffGrownupSubtitle,
                bgColor: Colors.white,
                iconBg: LumioColors.accentSoft,
                borderColor: LumioColors.borderStrong,
                onTap: onParent,
              ),
              const SizedBox(height: 12),
              _RoleCard(
                emoji: '✨',
                title: l10n.kickoffKidTitle,
                subtitle: l10n.kickoffKidSubtitle,
                bgColor: LumioColors.accentSoft,
                iconBg: Colors.white,
                borderColor: LumioColors.accent,
                onTap: onChild,
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.kickoffHaveAccount,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.textMuted,
                    ),
                  ),
                  Text(
                    l10n.kickoffLogIn,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: LumioColors.accentDeep,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color bgColor;
  final Color iconBg;
  final Color borderColor;
  final VoidCallback onTap;

  const _RoleCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.iconBg,
    required this.borderColor,
    required this.onTap,
  });

  @override
  State<_RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<_RoleCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(LumioRadius.xl),
          border: Border.all(color: widget.borderColor, width: 2),
          boxShadow: _pressed
              ? []
              : const [
                  BoxShadow(
                      color: LumioColors.borderStrong,
                      blurRadius: 0,
                      offset: Offset(0, 3))
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: widget.iconBg,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(widget.emoji,
                    style: const TextStyle(fontSize: 30)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.nunito(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.text,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            const LumioIcon(LumioIconType.chevronRight, size: 16, color: LumioColors.textSoft),
          ],
        ),
      ),
    );
  }
}
