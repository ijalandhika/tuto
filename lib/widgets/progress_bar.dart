import 'package:flutter/material.dart';
import '../design/tokens.dart';

enum LumioProgressFill { gradient, accent, success, audio }

class LumioProgressBar extends StatelessWidget {
  final double value; // 0–100
  final LumioProgressFill fill;
  final double height;

  const LumioProgressBar({
    super.key,
    required this.value,
    this.fill = LumioProgressFill.gradient,
    this.height = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: LumioColors.bgAlt,
        borderRadius: BorderRadius.circular(LumioRadius.pill),
        border: Border.all(color: LumioColors.border, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(LumioRadius.pill),
        child: AnimatedFractionallySizedBox(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          widthFactor: (value / 100).clamp(0.0, 1.0),
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              gradient: _gradient(fill),
              color: _solidColor(fill),
            ),
          ),
        ),
      ),
    );
  }
}

LinearGradient? _gradient(LumioProgressFill f) {
  switch (f) {
    case LumioProgressFill.gradient:
      return const LinearGradient(
        colors: [Color(0xFFFFC83D), Color(0xFFFF8A7A)],
      );
    case LumioProgressFill.accent:
      return const LinearGradient(
        colors: [LumioColors.accent, LumioColors.accentDeep],
      );
    default:
      return null;
  }
}

Color? _solidColor(LumioProgressFill f) {
  switch (f) {
    case LumioProgressFill.success:
      return LumioColors.success;
    case LumioProgressFill.audio:
      return const Color(0xFF3FB8FF);
    default:
      return null;
  }
}
