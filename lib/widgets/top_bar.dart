import 'package:flutter/material.dart';
import '../design/tokens.dart';
import 'button.dart';
import 'chip.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onBack;
  final int streak;
  final int stars;
  final int hearts;
  final bool hideStreak;
  final bool hideStars;
  final bool hideHearts;
  final Widget? trailing;

  const TopBar({
    super.key,
    this.onBack,
    this.streak = 7,
    this.stars = 24,
    this.hearts = 5,
    this.hideStreak = false,
    this.hideStars = false,
    this.hideHearts = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          if (onBack != null)
            LumioIconButton(
              variant: LumioButtonVariant.secondary,
              icon: const Icon(Icons.arrow_back_rounded,
                  color: LumioColors.text, size: 22),
              onPressed: onBack,
              size: 44,
            ),
          const Spacer(),
          if (!hideStreak)
            LumioChip(
              variant: LumioChipVariant.streak,
              size: LumioChipSize.sm,
              icon: const Text('🔥', style: TextStyle(fontSize: 12)),
              label: '$streak',
            ),
          if (!hideHearts) ...[
            const SizedBox(width: 6),
            LumioChip(
              variant: LumioChipVariant.streak,
              size: LumioChipSize.sm,
              icon: const Text('❤️', style: TextStyle(fontSize: 12)),
              label: '$hearts',
            ),
          ],
          if (!hideStars) ...[
            const SizedBox(width: 6),
            LumioChip(
              variant: LumioChipVariant.star,
              size: LumioChipSize.sm,
              icon: const Text('★',
                  style: TextStyle(fontSize: 12, color: Color(0xFFE0A310))),
              label: '$stars',
            ),
          ],
          if (trailing != null) ...[
            const SizedBox(width: 6),
            trailing!,
          ],
        ],
      ),
    );
  }
}
