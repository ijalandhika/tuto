import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/animations.dart';
import '../widgets/icon.dart';


class ParentGateScreen extends StatefulWidget {
  final VoidCallback onUnlock;
  final VoidCallback onCancel;

  const ParentGateScreen(
      {super.key, required this.onUnlock, required this.onCancel});

  @override
  State<ParentGateScreen> createState() => _ParentGateScreenState();
}

class _ParentGateScreenState extends State<ParentGateScreen> {
  late int _a, _b, _answer;
  String _input = '';
  bool _shaking = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final rng = Random();
    _a = rng.nextInt(9) + 2;
    _b = rng.nextInt(9) + 2;
    _answer = _a * _b;
    _input = '';
  }

  void _press(String digit) {
    if (_input.length >= 3) return;
    setState(() => _input += digit);
  }

  void _backspace() {
    if (_input.isEmpty) return;
    setState(() => _input = _input.substring(0, _input.length - 1));
  }

  void _submit() {
    if (_input.isEmpty) return;
    if (int.tryParse(_input) == _answer) {
      widget.onUnlock();
    } else {
      setState(() {
        _shaking = true;
        _input = '';
      });
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) setState(() => _shaking = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [LumioColors.bg, Color(0xFFFFF1C9)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: widget.onCancel,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: LumioColors.borderStrong, width: 2),
                      ),
                      child: const LumioIcon(LumioIconType.close, size: 18),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    l10n.parentGateTitle,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.text,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: LumioColors.warningSoft,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: LumioColors.warning, width: 2),
                    ),
                    child: const LumioIcon(LumioIconType.lock, size: 28, color: LumioColors.warningDeep),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.parentGateSolve,
                    style: GoogleFonts.nunito(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.text,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.parentGateHint,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: LumioColors.textMuted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),

                  // Puzzle
                  Text(
                    '$_a × $_b = ?',
                    style: GoogleFonts.nunito(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.text,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Input display
                  _shaking
                      ? ShakeAnimation(child: _InputDisplay(input: _input))
                      : _InputDisplay(input: _input),

                  const SizedBox(height: 28),
                ],
              ),
            ),

            // Numpad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  for (final row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                    ['⌫', '0', '✓'],
                  ])
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: row.map((k) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: _NumKey(
                                label: k,
                                onTap: () {
                                  if (k == '⌫') {
                                    _backspace();
                                  } else if (k == '✓') {
                                    _submit();
                                  } else {
                                    _press(k);
                                  }
                                },
                                isPrimary: k == '✓',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _InputDisplay extends StatelessWidget {
  final String input;
  const _InputDisplay({required this.input});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(LumioRadius.md),
        border: Border.all(color: LumioColors.borderStrong, width: 2),
        boxShadow: LumioShadows.sm,
      ),
      child: Center(
        child: Text(
          input.isEmpty ? '—' : input,
          style: GoogleFonts.nunito(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color:
                input.isEmpty ? LumioColors.textSoft : LumioColors.text,
          ),
        ),
      ),
    );
  }
}

class _NumKey extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
  const _NumKey(
      {required this.label, required this.onTap, this.isPrimary = false});

  @override
  State<_NumKey> createState() => _NumKeyState();
}

class _NumKeyState extends State<_NumKey> {
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
        duration: const Duration(milliseconds: 80),
        transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
        height: 56,
        decoration: BoxDecoration(
          color: widget.isPrimary ? LumioColors.success : Colors.white,
          borderRadius: BorderRadius.circular(LumioRadius.md),
          border: Border.all(
            color: widget.isPrimary
                ? LumioColors.successDeep
                : LumioColors.borderStrong,
            width: 2,
          ),
          boxShadow: _pressed
              ? []
              : [
                  BoxShadow(
                    color: widget.isPrimary
                        ? LumioColors.successDeep
                        : LumioColors.borderStrong,
                    blurRadius: 0,
                    offset: const Offset(0, 3),
                  )
                ],
        ),
        child: Center(
          child: Text(
            widget.label,
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: widget.isPrimary ? Colors.white : LumioColors.text,
            ),
          ),
        ),
      ),
    );
  }
}

