import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/domain/models/badge_item.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/top_bar.dart';
import 'package:tuto/ui/features/app_view_model.dart';
import 'package:tuto/ui/features/badges/view_models/badges_view_model.dart';

class BadgesScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const BadgesScreen({super.key, this.onBack});

  String _badgeName(AppLocalizations l10n, String key) => switch (key) {
        'badgeStarCounter' => l10n.badgeStarCounter,
        'badgeSeaExplorer' => l10n.badgeSeaExplorer,
        'badgeBraveReader' => l10n.badgeBraveReader,
        'badgeOnFire' => l10n.badgeOnFire,
        'badgeVolcanoPal' => l10n.badgeVolcanoPal,
        'badgeWordWizard' => l10n.badgeWordWizard,
        'badgeNightOwl' => l10n.badgeNightOwl,
        'badgeColorful' => l10n.badgeColorful,
        'badgeStarHoarder' => l10n.badgeStarHoarder,
        _ => key,
      };

  String _badgeSub(AppLocalizations l10n, String key) => switch (key) {
        'badgeStarCounterSub' => l10n.badgeStarCounterSub,
        'badgeSeaExplorerSub' => l10n.badgeSeaExplorerSub,
        'badgeBraveReaderSub' => l10n.badgeBraveReaderSub,
        'badgeOnFireSub' => l10n.badgeOnFireSub,
        'badgeVolcanoPalSub' => l10n.badgeVolcanoPalSub,
        'badgeWordWizardSub' => l10n.badgeWordWizardSub,
        'badgeNightOwlSub' => l10n.badgeNightOwlSub,
        'badgeColorfulSub' => l10n.badgeColorfulSub,
        'badgeStarHoarderSub' => l10n.badgeStarHoarderSub,
        _ => key,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = context.watch<AppViewModel>().stats;
    final vm = context.watch<BadgesViewModel>();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(onBack: onBack, streak: stats.streak, stars: stats.stars, hearts: stats.hearts),
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
            l10n.badgesCount(vm.earnedCount),
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
            itemCount: vm.badges.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (_, i) => _BadgeTile(
              badge: vm.badges[i],
              name: _badgeName(l10n, vm.badges[i].nameKey),
              sub: _badgeSub(l10n, vm.badges[i].subKey),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final BadgeItem badge;
  final String name;
  final String sub;
  const _BadgeTile({required this.badge, required this.name, required this.sub});

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
                  name,
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
                  sub,
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
