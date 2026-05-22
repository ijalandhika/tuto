import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import '../../widgets/icon.dart';
import 'onboarding_widgets.dart';

class PConnectScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onPassPhone;
  final VoidCallback onCode;

  const PConnectScreen({
    super.key,
    required this.onBack,
    required this.onPassPhone,
    required this.onCode,
  });

  @override
  State<PConnectScreen> createState() => _PConnectScreenState();
}

class _PConnectScreenState extends State<PConnectScreen> {
  late String _code;
  bool _copied = false;

  @override
  void initState() {
    super.initState();
    _regenerate();
  }

  void _regenerate() {
    setState(() {
      _code = (100000 + Random().nextInt(900000)).toString();
    });
  }

  String get _grouped => '${_code.substring(0, 3)} ${_code.substring(3)}';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          OnboardingTopBar(onBack: widget.onBack, step: 4, total: 4),
          const SizedBox(height: 8),

          Text(
            'ALMOST THERE',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Connect Maya's\naccount.",
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Pick how Maya will use Tuto.',
            style: GoogleFonts.nunito(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),

          // Option A — pairing code
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [LumioColors.accentSoft, Color(0xFFFFF1C9)],
              ),
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.accent, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text('📱', style: TextStyle(fontSize: 18))),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Maya has her own device',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: LumioColors.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Open Tuto on her phone/tablet, tap "I\'m a kid", and enter this code:',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: LumioColors.textMuted,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 14),

                // Code display
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: LumioColors.accentDeep,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _grouped,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 6,
                          color: LumioColors.text,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expires in 10 min · ',
                            style: GoogleFonts.nunito(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: LumioColors.textMuted,
                            ),
                          ),
                          GestureDetector(
                            onTap: _regenerate,
                            child: Text(
                              'refresh',
                              style: GoogleFonts.nunito(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: LumioColors.accentDeep,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: LumioButton(
                        variant: LumioButtonVariant.soft,
                        full: true,
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: _code));
                          setState(() => _copied = true);
                          Future.delayed(const Duration(seconds: 2), () {
                            if (mounted) setState(() => _copied = false);
                          });
                        },
                        child: Text(_copied ? '✓ Copied!' : 'Copy code'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LumioButton(
                        variant: LumioButtonVariant.soft,
                        full: true,
                        onPressed: widget.onCode,
                        child: const Text('Waiting for Maya…'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              children: [
                const Expanded(
                    child: Divider(color: LumioColors.border)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'OR',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ),
                const Expanded(
                    child: Divider(color: LumioColors.border)),
              ],
            ),
          ),

          // Option B — pass phone
          GestureDetector(
            onTap: widget.onPassPhone,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(LumioRadius.xl),
                border: Border.all(
                    color: LumioColors.borderStrong, width: 2),
                boxShadow: const [
                  BoxShadow(
                      color: LumioColors.borderStrong,
                      blurRadius: 0,
                      offset: Offset(0, 3))
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: LumioColors.accentSoft,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                        child: Text('🤝',
                            style: TextStyle(fontSize: 22))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maya will use this phone',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: LumioColors.text,
                          ),
                        ),
                        Text(
                          'Pass it to her now — we\'ll set her up',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const LumioIcon(LumioIconType.chevronRight, size: 14, color: LumioColors.textSoft),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Co-parent invite
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: LumioColors.bg,
              borderRadius: BorderRadius.circular(LumioRadius.lg),
              border: Border.all(
                  color: LumioColors.border, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                      child: Text('👨‍👩‍👧',
                          style: TextStyle(fontSize: 18))),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invite another grown-up',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: LumioColors.text,
                        ),
                      ),
                      Text(
                        "Other parent, grandparent or guardian — they'll see Maya's progress too.",
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: LumioColors.textMuted,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: widget.onPassPhone,
                  child: Text(
                    'Skip',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: LumioColors.accentDeep,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
