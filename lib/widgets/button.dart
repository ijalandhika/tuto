import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';

enum LumioButtonVariant { primary, audio, success, warning, secondary, soft, ghost }
enum LumioButtonSize { sm, md }

/// Pill-shaped button with tactile chunky bottom shadow.
/// Pressing translateY(+2px) and removes shadow — the "depressable" feel.
class LumioButton extends StatefulWidget {
  final LumioButtonVariant variant;
  final LumioButtonSize size;
  final VoidCallback? onPressed;
  final Widget child;
  final bool full;
  final Widget? leadingIcon;

  const LumioButton({
    super.key,
    this.variant = LumioButtonVariant.primary,
    this.size = LumioButtonSize.md,
    this.onPressed,
    required this.child,
    this.full = false,
    this.leadingIcon,
  });

  @override
  State<LumioButton> createState() => _LumioButtonState();
}

class _LumioButtonState extends State<LumioButton> {
  bool _pressed = false;

  void _down(_) => setState(() => _pressed = true);
  void _up(_) {
    setState(() => _pressed = false);
    widget.onPressed?.call();
  }
  void _cancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    final cfg = _config(widget.variant);
    final disabled = widget.onPressed == null;
    final height = widget.size == LumioButtonSize.sm ? 44.0 : 56.0;
    final hPad = widget.size == LumioButtonSize.sm ? 18.0 : 24.0;
    final fontSize = widget.size == LumioButtonSize.sm ? 15.0 : 17.0;

    return GestureDetector(
      onTapDown: disabled ? null : _down,
      onTapUp: disabled ? null : _up,
      onTapCancel: _cancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
        height: height,
        width: widget.full ? double.infinity : null,
        padding: EdgeInsets.symmetric(horizontal: hPad),
        decoration: BoxDecoration(
          color: disabled ? cfg.bg.withValues(alpha: 0.5) : cfg.bg,
          borderRadius: BorderRadius.circular(LumioRadius.pill),
          border: cfg.border,
          boxShadow: (_pressed || disabled) ? [] : cfg.shadow,
        ),
        child: Row(
          mainAxisSize: widget.full ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.leadingIcon != null) ...[
              widget.leadingIcon!,
              const SizedBox(width: 10),
            ],
            DefaultTextStyle(
              style: GoogleFonts.nunito(
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                color: disabled ? cfg.fg.withValues(alpha: 0.6) : cfg.fg,
              ),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

/// Circular icon-only button.
class LumioIconButton extends StatefulWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final LumioButtonVariant variant;
  final double size;

  const LumioIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = LumioButtonVariant.secondary,
    this.size = 48,
  });

  @override
  State<LumioIconButton> createState() => _LumioIconButtonState();
}

class _LumioIconButtonState extends State<LumioIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final cfg = _config(widget.variant);
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: cfg.bg,
          shape: BoxShape.circle,
          border: cfg.border,
          boxShadow: _pressed ? [] : cfg.shadow,
        ),
        child: Center(child: widget.icon),
      ),
    );
  }
}

// ── Config ──────────────────────────────────────────────────────────────────

class _BtnCfg {
  final Color bg;
  final Color fg;
  final Border? border;
  final List<BoxShadow> shadow;
  const _BtnCfg({
    required this.bg,
    required this.fg,
    this.border,
    this.shadow = const [],
  });
}

_BtnCfg _config(LumioButtonVariant v) {
  switch (v) {
    case LumioButtonVariant.primary:
      return const _BtnCfg(
        bg: LumioColors.accent,
        fg: Colors.white,
        shadow: LumioShadows.buttonAccent,
      );
    case LumioButtonVariant.audio:
      return _BtnCfg(
        bg: const Color(0xFF3FB8FF),
        fg: Colors.white,
        shadow: const [
          BoxShadow(color: Color(0xFF1F8FD6), blurRadius: 0, offset: Offset(0, 4)),
        ],
      );
    case LumioButtonVariant.success:
      return const _BtnCfg(
        bg: LumioColors.success,
        fg: Colors.white,
        shadow: LumioShadows.buttonSuccess,
      );
    case LumioButtonVariant.warning:
      return const _BtnCfg(
        bg: LumioColors.warning,
        fg: LumioColors.text,
        shadow: LumioShadows.buttonWarning,
      );
    case LumioButtonVariant.secondary:
      return _BtnCfg(
        bg: Colors.white,
        fg: LumioColors.text,
        border: Border.all(color: LumioColors.borderStrong, width: 2),
        shadow: LumioShadows.buttonSecondary,
      );
    case LumioButtonVariant.soft:
      return const _BtnCfg(bg: LumioColors.accentSoft, fg: LumioColors.accentDeep);
    case LumioButtonVariant.ghost:
      return const _BtnCfg(bg: Colors.transparent, fg: LumioColors.accentDeep);
  }
}
