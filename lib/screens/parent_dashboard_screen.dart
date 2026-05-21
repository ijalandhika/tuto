import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';


class ParentDashboardScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onWeekly;

  const ParentDashboardScreen(
      {super.key, required this.onBack, required this.onWeekly});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Header row
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: LumioColors.borderStrong, width: 2),
                  ),
                  child: const Icon(Icons.arrow_back_rounded,
                      size: 18, color: LumioColors.text),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Hey, Parent 👋",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Text(
              "Here's how Maya is doing this week.",
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: LumioColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 3-stat row
          Row(
            children: [
              _StatCard(
                  emoji: '⭐', value: '24', label: 'Stars', color: LumioColors.warning),
              const SizedBox(width: 10),
              _StatCard(
                  emoji: '🔥', value: '7', label: 'Day streak', color: LumioColors.magical),
              const SizedBox(width: 10),
              _StatCard(
                  emoji: '📘', value: '3', label: 'Lessons', color: LumioColors.accent),
            ],
          ),
          const SizedBox(height: 20),

          // Bar chart card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.border, width: 1.5),
              boxShadow: LumioShadows.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MINUTES THIS WEEK',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.66,
                    color: LumioColors.textMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '68 min total',
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                  ),
                ),
                const SizedBox(height: 16),
                const _BarChart(),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Subject progress
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.border, width: 1.5),
              boxShadow: LumioShadows.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUBJECTS',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.66,
                    color: LumioColors.textMuted,
                  ),
                ),
                const SizedBox(height: 14),
                _SubjectBar(label: 'Reading', emoji: '📖', value: 0.72, color: LumioColors.accent),
                const SizedBox(height: 12),
                _SubjectBar(label: 'Maths', emoji: '🔢', value: 0.55, color: LumioColors.success),
                const SizedBox(height: 12),
                _SubjectBar(label: 'Science', emoji: '🔬', value: 0.38, color: LumioColors.magical),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Action rows
          _ActionRow(
            emoji: '📈',
            title: 'Weekly report',
            subtitle: 'Full breakdown + Tuto insights',
            onTap: onWeekly,
          ),
          const SizedBox(height: 10),
          _ActionRow(
            emoji: '⏱',
            title: 'Daily limit',
            subtitle: '15 min / day · Mon–Fri',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          _ActionRow(
            emoji: '🎯',
            title: 'Learning goals',
            subtitle: 'Reading, Curiosity, Maths',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color color;

  const _StatCard(
      {required this.emoji,
      required this.value,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(LumioRadius.lg),
          border: Border.all(color: LumioColors.border, width: 1.5),
          boxShadow: LumioShadows.sm,
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.nunito(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: LumioColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  static const _data = [
    (day: 'M', min: 10),
    (day: 'T', min: 15),
    (day: 'W', min: 8),
    (day: 'T', min: 12),
    (day: 'F', min: 15),
    (day: 'S', min: 5),
    (day: 'S', min: 3),
  ];

  @override
  Widget build(BuildContext context) {
    final maxVal = _data.map((d) => d.min).reduce((a, b) => a > b ? a : b);
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _data.map((d) {
          final frac = d.min / maxVal;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      heightFactor: frac,
                      child: Container(
                        decoration: BoxDecoration(
                          color: d.day == 'T' && d.min == 15
                              ? LumioColors.accent
                              : LumioColors.accentSoft,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    d.day,
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SubjectBar extends StatelessWidget {
  final String label;
  final String emoji;
  final double value;
  final Color color;

  const _SubjectBar(
      {required this.label,
      required this.emoji,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: LumioColors.text,
                    ),
                  ),
                  Text(
                    '${(value * 100).round()}%',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(LumioRadius.pill),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor: LumioColors.border,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionRow extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionRow(
      {required this.emoji,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(LumioRadius.lg),
          border: Border.all(color: LumioColors.border, width: 1.5),
          boxShadow: LumioShadows.sm,
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: LumioColors.text,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: LumioColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: LumioColors.textSoft),
          ],
        ),
      ),
    );
  }
}
