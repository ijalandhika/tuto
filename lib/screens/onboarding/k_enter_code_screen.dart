import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/animations.dart';
import '../../widgets/icon.dart';
import '../../widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KEnterCodeScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onSuccess;

  const KEnterCodeScreen(
      {super.key, required this.onBack, required this.onSuccess});

  @override
  State<KEnterCodeScreen> createState() => _KEnterCodeScreenState();
}

class _KEnterCodeScreenState extends State<KEnterCodeScreen> {
  final List<String> _digits = List.filled(6, '');
  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _error = false;
  bool _shaking = false;

  @override
  void dispose() {
    for (final fn in _focusNodes) {
      fn.dispose();
    }
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _setAt(int i, String val) {
    final cleaned = val.replaceAll(RegExp(r'\D'), '');
    final char = cleaned.isEmpty ? '' : cleaned[cleaned.length - 1];
    setState(() {
      _digits[i] = char;
      _error = false;
    });
    _controllers[i].text = char;
    if (char.isNotEmpty && i < 5) {
      _focusNodes[i + 1].requestFocus();
    }
    if (_digits.every((d) => d.isNotEmpty)) {
      _checkCode();
    }
  }

  void _checkCode() {
    final code = _digits.join();
    if (code == '000000') {
      setState(() {
        _error = true;
        _shaking = true;
      });
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) setState(() => _shaking = false);
      });
    } else {
      widget.onSuccess();
    }
  }

  void _onBackspace(int i) {
    if (_digits[i].isEmpty && i > 0) {
      _focusNodes[i - 1].requestFocus();
      setState(() => _digits[i - 1] = '');
      _controllers[i - 1].text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.5),
          radius: 0.8,
          colors: [LumioColors.accentSoft, LumioColors.bg],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 32),
          child: Column(
            children: [
              // Back + dots
              Row(
                children: [
                  GestureDetector(
                    onTap: widget.onBack,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: LumioColors.borderStrong, width: 2),
                      ),
                      child: const LumioIcon(LumioIconType.back, size: 18),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 24),

              BobAnimation(
                child: SvgPicture.asset(
                  'assets/tuto-turtle.svg',
                  width: 110,
                  height: 110,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Got a code from your\ngrown-up?',
                style: GoogleFonts.nunito(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Type the 6 numbers they gave you below.',
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: LumioColors.textMuted,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),

              // 6 digit boxes
              _shaking
                  ? ShakeAnimation(child: _DigitRow(
                      digits: _digits,
                      controllers: _controllers,
                      focusNodes: _focusNodes,
                      error: _error,
                      onChanged: _setAt,
                      onBackspace: _onBackspace,
                    ))
                  : _DigitRow(
                      digits: _digits,
                      controllers: _controllers,
                      focusNodes: _focusNodes,
                      error: _error,
                      onChanged: _setAt,
                      onBackspace: _onBackspace,
                    ),

              if (_error) ...[
                const SizedBox(height: 14),
                Text(
                  "Hmm, that code didn't work. Try again? 💛",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: LumioColors.magicalDeep,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 28),

              // Tip
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(LumioRadius.md),
                  border: Border.all(
                      color: LumioColors.border, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('💡', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.textMuted,
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(
                                text:
                                    'Ask a grown-up. They can find the code on '),
                            TextSpan(
                              text: 'their phone',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: LumioColors.text,
                              ),
                            ),
                            const TextSpan(
                                text:
                                    ' in the setup screen — or in Settings → Add another device.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              LumioButton(
                variant: LumioButtonVariant.secondary,
                full: true,
                onPressed: widget.onBack,
                child: const Text("I don't have a code yet"),
              ),
              const SizedBox(height: 10),
              Text(
                'A grown-up has to set up Tuto first 🐢',
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: LumioColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DigitRow extends StatelessWidget {
  final List<String> digits;
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final bool error;
  final void Function(int, String) onChanged;
  final void Function(int) onBackspace;

  const _DigitRow({
    required this.digits,
    required this.controllers,
    required this.focusNodes,
    required this.error,
    required this.onChanged,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (i) {
        final filled = digits[i].isNotEmpty;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: 44,
            height: 60,
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  onBackspace(i);
                }
              },
              child: TextField(
                controller: controllers[i],
                focusNode: focusNodes[i],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: LumioColors.text,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: error
                      ? LumioColors.magicalSoft
                      : filled
                          ? LumioColors.accentSoft
                          : Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: error
                          ? LumioColors.magical
                          : filled
                              ? LumioColors.accent
                              : LumioColors.borderStrong,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                        color: LumioColors.accent, width: 2),
                  ),
                ),
                onChanged: (v) => onChanged(i, v),
              ),
            ),
          ),
        );
      }),
    );
  }
}
