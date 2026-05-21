import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/tokens.dart';
import '../../widgets/button.dart';
import 'onboarding_widgets.dart';

class PAccountScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const PAccountScreen({super.key, required this.onBack, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          OnboardingTopBar(onBack: onBack, step: 1, total: 4),
          const SizedBox(height: 24),

          Text(
            'CREATE ACCOUNT',
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Let's set up your\nparent account",
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 28),

          const LumioTextField(label: 'Your name', hint: 'e.g. Sarah'),
          const SizedBox(height: 14),
          const LumioTextField(
              label: 'Email address',
              hint: 'sarah@example.com',
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 14),
          const LumioTextField(
              label: 'Password', hint: '8+ characters', obscure: true),
          const SizedBox(height: 28),

          Row(
            children: [
              const Expanded(child: Divider(color: LumioColors.borderStrong)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'or continue with',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: LumioColors.textSoft,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: LumioColors.borderStrong)),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _SsoButton(label: 'Apple', icon: '🍎', onTap: onNext)),
              const SizedBox(width: 10),
              Expanded(child: _SsoButton(label: 'Google', icon: '🔵', onTap: onNext)),
            ],
          ),
          const SizedBox(height: 28),

          LumioButton(
            variant: LumioButtonVariant.primary,
            full: true,
            onPressed: onNext,
            child: const Text('Continue →'),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'By continuing you agree to Tuto\'s Terms & Privacy Policy.',
              style: GoogleFonts.nunito(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: LumioColors.textSoft,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _SsoButton extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;

  const _SsoButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(LumioRadius.md),
          border: Border.all(color: LumioColors.borderStrong, width: 2),
          boxShadow: LumioShadows.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: LumioColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
