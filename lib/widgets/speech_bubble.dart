import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import 'animations.dart';

class SpeechBubble extends StatelessWidget {
  final String text;
  final bool speaking;
  final bool small;

  const SpeechBubble({
    super.key,
    required this.text,
    this.speaking = false,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = small ? 64.0 : 80.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BobAnimation(
          child: SvgPicture.asset(
            'assets/tuto-turtle.svg',
            width: avatarSize,
            height: avatarSize,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: _Bubble(text: text, speaking: speaking)),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final String text;
  final bool speaking;
  const _Bubble({required this.text, required this.speaking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(LumioSpacing.s4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(LumioRadius.xl),
          topRight: Radius.circular(LumioRadius.xl),
          bottomRight: Radius.circular(LumioRadius.xl),
          bottomLeft: Radius.circular(6),
        ),
        border: Border.all(color: LumioColors.border, width: 2),
        boxShadow: LumioShadows.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: LumioColors.text,
              height: 1.45,
            ),
          ),
          if (speaking) ...[
            const SizedBox(height: 8),
            _SpeakingIndicator(),
          ],
        ],
      ),
    );
  }
}

class _SpeakingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE1F4FF),
        borderRadius: BorderRadius.circular(LumioRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Bar(height: 7, delay: Duration.zero),
          const SizedBox(width: 4),
          _Bar(height: 12, delay: const Duration(milliseconds: 150)),
          const SizedBox(width: 4),
          _Bar(height: 9, delay: const Duration(milliseconds: 300)),
          const SizedBox(width: 6),
          Text(
            'Speaking',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1F8FD6),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final Duration delay;
  const _Bar({required this.height, required this.delay});

  @override
  Widget build(BuildContext context) {
    return PulseAnimation(
      delay: delay,
      child: Container(
        width: 3,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF1F8FD6),
          borderRadius: BorderRadius.circular(LumioRadius.pill),
        ),
      ),
    );
  }
}
