import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/ui/core/icon.dart';

class OnboardingTopBar extends StatelessWidget {
  final VoidCallback onBack;
  final int step;
  final int total;

  const OnboardingTopBar(
      {super.key, required this.onBack, required this.step, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: LumioColors.borderStrong, width: 2),
            ),
            child: const LumioIcon(LumioIconType.back,
                size: 18, color: LumioColors.text),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(LumioRadius.pill),
            child: LinearProgressIndicator(
              value: step / total,
              minHeight: 8,
              backgroundColor: LumioColors.border,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(LumioColors.accent),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$step / $total',
          style: GoogleFonts.nunito(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: LumioColors.textMuted,
          ),
        ),
      ],
    );
  }
}

class LumioTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType? keyboardType;

  const LumioTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: LumioColors.text,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscure,
          keyboardType: keyboardType,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: LumioColors.text,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: LumioColors.textSoft,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(LumioRadius.md),
              borderSide:
                  const BorderSide(color: LumioColors.borderStrong, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(LumioRadius.md),
              borderSide: const BorderSide(color: LumioColors.accent, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
