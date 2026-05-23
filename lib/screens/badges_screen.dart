import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/top_bar.dart';

class _Badge {
  final String emoji;
  final String name;
  final String sub;
  final bool earned;
  final bool fresh;
  const _Badge(this.emoji, this.name, this.sub,
      {this.earned = false, this.fresh = false});
}

List<_Badge> _badgesFor(AppLocalizations l10n) => [
      _Badge('🏆', l10n.badgeStarCounter, l10n.badgeStarCounterSub,
          earned: true, fresh: true),
      _Badge('🐳', l10n.badgeSeaExplorer, l10n.badgeSeaExplorerSub,
          earned: true),
      _Badge('🦊', l10n.badgeBraveReader, l10n.badgeBraveReaderSub,
          earned: true),
      _Badge('🔥', l10n.badgeOnFire, l10n.badgeOnFireSub, earned: true),
      _Badge('🌋', l10n.badgeVolcanoPal, l10n.badgeVolcanoPalSub),
      _Badge('📖', l10n.badgeWordWizard, l10n.badgeWordWizardSub),
      _Badge('🌙', l10n.badgeNightOwl, l10n.badgeNightOwlSub),
      _Badge('🎨', l10n.badgeColorful, l10n.badgeColorfulSub),
      _Badge('⭐', l10n.badgeStarHoarder, l10n.badgeStarHoarderSub),
    ];

class BadgesScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const BadgesScreen({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final badges = _badgesFor(l10n);
    final earned = badges.where((b) => b.earned).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(onBack: onBack, streak: 7, stars: 24, hearts: 5),
          const SizedBox(height: 6),

          Text(
            l10n.badgesEyebrow,
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.66,
              color: LumioColors.textMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.badgesCount(earned),
            style: GoogleFonts.nunito(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: LumioColors.text,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 18),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: badges.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (_, i) => _BadgeTile(badge: badges[i]),
          ),
        ],
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final _Badge badge;
  const _BadgeTile({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Opacity(
          opacity: badge.earned ? 1.0 : 0.55,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            decoration: BoxDecoration(
              color: badge.earned ? Colors.white : LumioColors.bg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: badge.fresh
                    ? LumioColors.accent
                    : LumioColors.border,
                width: 2,
              ),
              boxShadow: badge.earned
                  ? const [
                      BoxShadow(
                          color: LumioColors.border,
                          blurRadius: 0,
                          offset: Offset(0, 2))
                    ]
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  badge.emoji,
                  style: TextStyle(
                    fontSize: 36,
                    color: badge.earned ? null : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  badge.name,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                    height: 1.15,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  badge.sub,
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: LumioColors.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        if (badge.fresh)
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: LumioColors.accent,
                borderRadius: BorderRadius.circular(LumioRadius.pill),
                boxShadow: const [
                  BoxShadow(
                      color: LumioColors.accentDeep,
                      blurRadius: 0,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Text(
                AppLocalizations.of(context).badgesNewTag,
                style: GoogleFonts.nunito(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
