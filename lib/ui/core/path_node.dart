import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';
import 'icon.dart';

enum PathNodeState { done, current, locked }

class PathNode extends StatefulWidget {
  final String emoji;
  final String label;
  final String subject;
  final PathNodeState state;
  final VoidCallback? onTap;

  const PathNode({
    super.key,
    required this.emoji,
    required this.label,
    required this.subject,
    required this.state,
    this.onTap,
  });

  @override
  State<PathNode> createState() => _PathNodeState();
}

class _PathNodeState extends State<PathNode> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final isDone = widget.state == PathNodeState.done;
    final isCur = widget.state == PathNodeState.current;
    final isLocked = widget.state == PathNodeState.locked;

    final bg = isDone
        ? LumioColors.success
        : isCur
            ? LumioColors.accent
            : const Color(0xFFF1E2CE);
    final shadow = isDone
        ? LumioShadows.nodeSuccess
        : isCur
            ? LumioShadows.nodeAccent
            : LumioShadows.nodeLocked;

    return GestureDetector(
      onTapDown: isLocked ? null : (_) => setState(() => _pressed = true),
      onTapUp: isLocked
          ? null
          : (_) {
              setState(() => _pressed = false);
              widget.onTap?.call();
            },
      onTapCancel: () => setState(() => _pressed = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              if (isCur)
                Positioned(
                  top: -40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: LumioColors.text,
                          borderRadius:
                              BorderRadius.circular(LumioRadius.pill),
                        ),
                        child: Text(
                          'START',
                          style: GoogleFonts.nunito(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CustomPaint(
                        size: const Size(8, 5),
                        painter: _DownArrow(LumioColors.text),
                      ),
                    ],
                  ),
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                transform:
                    Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: bg,
                  shape: BoxShape.circle,
                  boxShadow: _pressed ? [] : shadow,
                ),
                child: Center(
                  child: Opacity(
                    opacity: isLocked ? 0.7 : 1.0,
                    child: isLocked
                        ? const LumioIcon(LumioIconType.lock, size: 32, color: Colors.white)
                        : isDone
                            ? const LumioIcon(LumioIconType.check, size: 36, color: Colors.white)
                            : Text(widget.emoji,
                                style: const TextStyle(fontSize: 38)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.label,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: isLocked ? LumioColors.textSoft : LumioColors.text,
            ),
          ),
          Text(
            widget.subject.toUpperCase(),
            style: GoogleFonts.nunito(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              color: LumioColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _DownArrow extends CustomPainter {
  final Color color;
  const _DownArrow(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width / 2, size.height)
        ..close(),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
