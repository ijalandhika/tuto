import 'package:flutter/material.dart';

/// Gently bobs + rotates — Tuto's idle mascot animation (deliberately slow, turtle pace).
class BobAnimation extends StatefulWidget {
  final Widget child;
  const BobAnimation({super.key, required this.child});

  @override
  State<BobAnimation> createState() => _BobAnimationState();
}

class _BobAnimationState extends State<BobAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _y;
  late final Animation<double> _rot;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
    _y = Tween<double>(begin: 0, end: -4)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
    _rot = Tween<double>(begin: -0.035, end: 0.035)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) => Transform.translate(
          offset: Offset(0, _y.value),
          child: Transform.rotate(angle: _rot.value, child: child),
        ),
        child: widget.child,
      );
}

/// Bounces vertically — reward screen celebration.
class BounceAnimation extends StatefulWidget {
  final Widget child;
  const BounceAnimation({super.key, required this.child});

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _y;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _y = Tween<double>(begin: 0, end: -12)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) =>
            Transform.translate(offset: Offset(0, _y.value), child: child),
        child: widget.child,
      );
}

/// Scales in with an overshoot bounce — success feedback pop.
class PopIn extends StatefulWidget {
  final Widget child;
  const PopIn({super.key, required this.child});

  @override
  State<PopIn> createState() => _PopInState();
}

class _PopInState extends State<PopIn> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    )..forward();
    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: const Cubic(0.34, 1.56, 0.64, 1)),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: _scale, child: widget.child);
}

/// Pulses scale — TTS speaking waveform bars.
class PulseAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const PulseAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _scale = Tween<double>(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _scale,
        builder: (_, child) =>
            Transform.scale(scaleY: _scale.value, child: child),
        child: widget.child,
      );
}

/// Fades + slides up on mount — entrance animation.
class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const FadeInUp({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;
  late final Animation<double> _y;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _y = Tween<double>(begin: 8, end: 0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) => Opacity(
          opacity: _opacity.value,
          child: Transform.translate(offset: Offset(0, _y.value), child: child),
        ),
        child: widget.child,
      );
}

/// Shakes horizontally — gentle wrong-answer feedback.
class ShakeAnimation extends StatefulWidget {
  final Widget child;
  const ShakeAnimation({super.key, required this.child});

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _x;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    )..forward();
    _x = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -6), weight: 20),
      TweenSequenceItem(tween: Tween(begin: -6, end: 6), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 6, end: -4), weight: 20),
      TweenSequenceItem(tween: Tween(begin: -4, end: 4), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 4, end: 0), weight: 20),
    ]).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _x,
        builder: (_, child) =>
            Transform.translate(offset: Offset(_x.value, 0), child: child),
        child: widget.child,
      );
}
