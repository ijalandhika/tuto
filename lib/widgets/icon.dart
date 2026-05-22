import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../design/tokens.dart';

enum LumioIconType {
  speaker,
  back,
  check,
  star,
  lock,
  heart,
  flame,
  sparkle,
  settings,
  chevronRight,
  close,
}

class LumioIcon extends StatelessWidget {
  final LumioIconType icon;
  final double size;
  final Color color;

  const LumioIcon(
    this.icon, {
    super.key,
    this.size = 22,
    this.color = LumioColors.text,
  });

  static const _paths = {
    LumioIconType.speaker: 'assets/icons/speaker.svg',
    LumioIconType.back: 'assets/icons/back.svg',
    LumioIconType.check: 'assets/icons/check.svg',
    LumioIconType.star: 'assets/icons/star.svg',
    LumioIconType.lock: 'assets/icons/lock.svg',
    LumioIconType.heart: 'assets/icons/heart.svg',
    LumioIconType.flame: 'assets/icons/flame.svg',
    LumioIconType.sparkle: 'assets/icons/sparkle.svg',
    LumioIconType.settings: 'assets/icons/settings.svg',
    LumioIconType.chevronRight: 'assets/icons/chevron_right.svg',
    LumioIconType.close: 'assets/icons/close.svg',
  };

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _paths[icon]!,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
