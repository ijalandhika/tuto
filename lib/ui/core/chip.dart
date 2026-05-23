import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';

enum LumioChipVariant { defaultChip, streak, star, badge, bonus, audio }
enum LumioChipSize { sm, md }

class LumioChip extends StatelessWidget {
  final LumioChipVariant variant;
  final LumioChipSize size;
  final Widget? icon;
  final String label;

  const LumioChip({
    super.key,
    this.variant = LumioChipVariant.defaultChip,
    this.size = LumioChipSize.md,
    this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final cfg = _config(variant);
    final vPad = size == LumioChipSize.sm ? 5.0 : 7.0;
    final hPad = size == LumioChipSize.sm ? 10.0 : 13.0;
    final fontSize = size == LumioChipSize.sm ? 12.0 : 13.0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: hPad),
      decoration: BoxDecoration(
        color: cfg.bg,
        borderRadius: BorderRadius.circular(LumioRadius.pill),
        border: cfg.border,
        boxShadow: const [
          BoxShadow(color: Color(0x0D4A2E1F), blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 5)],
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              color: cfg.fg,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipCfg {
  final Color bg;
  final Color fg;
  final Border? border;
  const _ChipCfg({required this.bg, required this.fg, this.border});
}

_ChipCfg _config(LumioChipVariant v) {
  switch (v) {
    case LumioChipVariant.defaultChip:
      return _ChipCfg(
        bg: Colors.white,
        fg: LumioColors.text,
        border: Border.all(color: LumioColors.borderStrong, width: 1.5),
      );
    case LumioChipVariant.streak:
      return const _ChipCfg(bg: LumioColors.magicalSoft, fg: LumioColors.magicalDeep);
    case LumioChipVariant.star:
      return const _ChipCfg(bg: LumioColors.warningSoft, fg: LumioColors.warningDeep);
    case LumioChipVariant.badge:
      return const _ChipCfg(bg: LumioColors.accentSoft, fg: LumioColors.accentDeep);
    case LumioChipVariant.bonus:
      return const _ChipCfg(bg: LumioColors.successSoft, fg: LumioColors.successDeep);
    case LumioChipVariant.audio:
      return const _ChipCfg(
        bg: Color(0xFFE1F4FF),
        fg: Color(0xFF1F8FD6),
      );
  }
}
