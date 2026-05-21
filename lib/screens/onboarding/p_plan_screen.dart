import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import 'onboarding_widgets.dart';

class PPlanScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onFinish;

  const PPlanScreen({super.key, required this.onBack, required this.onFinish});

  @override
  State<PPlanScreen> createState() => _PPlanScreenState();
}

class _PPlanScreenState extends State<PPlanScreen> {
  int _minutes = 15;
  final _days = <int>{1, 2, 3, 4, 5}; // Mon-Fri default

  static const _minuteOptions = [10, 15, 20, 30];
  static const _dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          OnboardingTopBar(onBack: widget.onBack, step: 4, total: 4),
          const SizedBox(height: 24),

          Text(
            'LEARNING PLAN',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'How much time\neach day?',
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Even 10 minutes a day builds big skills over time.',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 28),

          // Minutes selector
          Text(
            'Daily goal',
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: LumioColors.text,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: _minuteOptions.map((m) {
              final sel = _minutes == m;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _minutes = m),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 64,
                      decoration: BoxDecoration(
                        color: sel ? LumioColors.accent : Colors.white,
                        borderRadius: BorderRadius.circular(LumioRadius.md),
                        border: Border.all(
                          color: sel
                              ? LumioColors.accentDeep
                              : LumioColors.borderStrong,
                          width: 2,
                        ),
                        boxShadow: sel
                            ? const [
                                BoxShadow(
                                    color: LumioColors.accentDeep,
                                    blurRadius: 0,
                                    offset: Offset(0, 3))
                              ]
                            : LumioShadows.sm,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$m',
                            style: GoogleFonts.nunito(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color:
                                  sel ? Colors.white : LumioColors.text,
                            ),
                          ),
                          Text(
                            'min',
                            style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: sel
                                  ? Colors.white.withValues(alpha: 0.85)
                                  : LumioColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 28),

          // Day toggles
          Text(
            'Which days?',
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: LumioColors.text,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(7, (i) {
              final sel = _days.contains(i);
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () => setState(() =>
                        sel ? _days.remove(i) : _days.add(i)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 48,
                      decoration: BoxDecoration(
                        color:
                            sel ? LumioColors.accent : Colors.white,
                        borderRadius:
                            BorderRadius.circular(LumioRadius.md),
                        border: Border.all(
                          color: sel
                              ? LumioColors.accentDeep
                              : LumioColors.borderStrong,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _dayLabels[i],
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: sel
                                ? Colors.white
                                : LumioColors.textMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 32),

          // Summary card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LumioColors.successSoft,
              borderRadius: BorderRadius.circular(LumioRadius.lg),
              border: Border.all(color: LumioColors.success, width: 1.5),
            ),
            child: Row(
              children: [
                const Text('🐢', style: TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$_minutes minutes, ${_days.length} days a week. That\'s a great plan!',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.successDeep,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          LumioButton(
            variant: LumioButtonVariant.success,
            full: true,
            onPressed: _days.isNotEmpty ? widget.onFinish : null,
            child: const Text("All set — let's go! 🚀"),
          ),
        ],
      ),
    );
  }
}
