import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import 'onboarding_widgets.dart';

class PKidScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const PKidScreen({super.key, required this.onBack, required this.onNext});

  @override
  State<PKidScreen> createState() => _PKidScreenState();
}

class _PKidScreenState extends State<PKidScreen> {
  int? _selectedAge;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          OnboardingTopBar(onBack: widget.onBack, step: 2, total: 4),
          const SizedBox(height: 24),

          Text(
            'ABOUT YOUR CHILD',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Tell us a bit about\nyour little learner",
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 28),

          const LumioTextField(label: "Child's name", hint: 'e.g. Maya'),
          const SizedBox(height: 24),

          Text(
            'Age',
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: LumioColors.text,
            ),
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(8, (i) {
              final age = i + 5;
              final selected = _selectedAge == age;
              return GestureDetector(
                onTap: () => setState(() => _selectedAge = age),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: selected ? LumioColors.accent : Colors.white,
                    borderRadius: BorderRadius.circular(LumioRadius.md),
                    border: Border.all(
                      color: selected
                          ? LumioColors.accentDeep
                          : LumioColors.borderStrong,
                      width: 2,
                    ),
                    boxShadow: selected
                        ? const [
                            BoxShadow(
                                color: LumioColors.accentDeep,
                                blurRadius: 0,
                                offset: Offset(0, 3))
                          ]
                        : LumioShadows.sm,
                  ),
                  child: Center(
                    child: Text(
                      '$age',
                      style: GoogleFonts.nunito(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: selected ? Colors.white : LumioColors.text,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: LumioColors.warningSoft,
              borderRadius: BorderRadius.circular(LumioRadius.md),
              border: Border.all(color: LumioColors.warning, width: 1.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💡', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Tuto adapts lessons to your child's age so content feels just right — not too easy, not too hard.",
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.text,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          LumioButton(
            variant: LumioButtonVariant.primary,
            full: true,
            onPressed: _selectedAge != null ? widget.onNext : null,
            child: const Text('Continue →'),
          ),
        ],
      ),
    );
  }
}
