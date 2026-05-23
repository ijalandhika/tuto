import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/domain/models/library_item.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/button.dart';
import 'package:tuto/ui/core/icon.dart';
import 'package:tuto/ui/core/top_bar.dart';
import 'package:tuto/ui/features/app_view_model.dart';
import 'package:tuto/ui/features/library/view_models/library_view_model.dart';

class LibraryScreen extends StatelessWidget {
  final VoidCallback onPick;

  const LibraryScreen({super.key, required this.onPick});

  // ── Subject helpers ────────────────────────────────────────────────────────

  String _subjectEmoji(String key) => switch (key) {
        'subjectForYou' => '✨',
        'subjectReading' => '📖',
        'subjectScience' => '🔬',
        'subjectMath' => '🔢',
        'subjectWorld' => '🌍',
        'subjectArt' => '🎨',
        'subjectBonus' => '🏆',
        _ => '📚',
      };

  String _subjectLabel(AppLocalizations l10n, String key) => switch (key) {
        'subjectForYou' => l10n.subjectForYou,
        'subjectReading' => l10n.subjectReading,
        'subjectScience' => l10n.subjectScience,
        'subjectMath' => l10n.subjectMath,
        'subjectWorld' => l10n.subjectWorld,
        'subjectArt' => l10n.subjectArt,
        'subjectBonus' => l10n.subjectBonus,
        _ => key,
      };

  // ── Item helpers ───────────────────────────────────────────────────────────

  String _itemTitle(AppLocalizations l10n, String key) => switch (key) {
        'libContinueWhales' => l10n.libContinueWhales,
        'libContinueFox' => l10n.libContinueFox,
        'libContinueCounting' => l10n.libContinueCounting,
        'libItemWhales' => l10n.libItemWhales,
        'libItemLions' => l10n.libItemLions,
        'libItemSeaTurtles' => l10n.libItemSeaTurtles,
        'libItemButterflies' => l10n.libItemButterflies,
        'libItemFox' => l10n.libItemFox,
        'libItemMoon' => l10n.libItemMoon,
        'libItemBear' => l10n.libItemBear,
        'libItemLighthouse' => l10n.libItemLighthouse,
        'libItemVolcano' => l10n.libItemVolcano,
        'libItemRainbow' => l10n.libItemRainbow,
        'libItemStars' => l10n.libItemStars,
        'libItemBees' => l10n.libItemBees,
        _ => key,
      };

  String _itemSub(AppLocalizations l10n, String key) => switch (key) {
        'libContinueWhalesSub' => l10n.libContinueWhalesSub,
        'libContinueFoxSub' => l10n.libContinueFoxSub,
        'libContinueCountingSub' => l10n.libContinueCountingSub,
        _ => key,
      };

  String _levelLabel(AppLocalizations l10n, String key) => switch (key) {
        'levelNew' => l10n.levelNew,
        'levelEasy' => l10n.levelEasy,
        _ => key,
      };

  String _collectionTitle(AppLocalizations l10n, String key) => switch (key) {
        'libColAnimals' => l10n.libColAnimals,
        'libColBedtime' => l10n.libColBedtime,
        'libColWhy' => l10n.libColWhy,
        _ => key,
      };

  String _collectionSub(AppLocalizations l10n, String key) => switch (key) {
        'libColAnimalsSub' => l10n.libColAnimalsSub,
        'libColBedtimeSub' => l10n.libColBedtimeSub,
        'libColWhySub' => l10n.libColWhySub,
        _ => key,
      };

  // ── Item gradient / dark flag (presentation-only) ─────────────────────────

  List<Color> _itemGradient(String titleKey) => switch (titleKey) {
        'libItemWhales' || 'libContinueWhales' => const [Color(0xFFB8E6FF), Color(0xFFE1F4FF)],
        'libItemLions' => const [Color(0xFFFFE6C2), Color(0xFFFFF1C9)],
        'libItemSeaTurtles' => const [Color(0xFFC8F1DD), Color(0xFFDDF6E7)],
        'libItemButterflies' => const [Color(0xFFFFD9EA), Color(0xFFFFE4DF)],
        'libItemFox' || 'libContinueFox' => const [Color(0xFFFFE4DF), Color(0xFFFFF1C9)],
        'libItemMoon' => const [Color(0xFFE0DAFF), Color(0xFFEFEAFF)],
        'libItemBear' => const [Color(0xFFFFE6C2), Color(0xFFFFE4DF)],
        'libItemLighthouse' => const [Color(0xFFFFD3CB), Color(0xFFFFE4DF)],
        'libItemVolcano' => const [Color(0xFFFFD3CB), Color(0xFFFFE6C2)],
        'libItemRainbow' => const [Color(0xFFE1F4FF), Color(0xFFFFE4DF)],
        'libItemStars' => const [Color(0xFF2D1B4E), Color(0xFF5638E0)],
        'libItemBees' => const [Color(0xFFFFF1C9), Color(0xFFFFE6C2)],
        'libContinueCounting' => const [Color(0xFFE1F4FF), Color(0xFFFFF1C9)],
        _ => const [Color(0xFFE1F4FF), Color(0xFFFFF1C9)],
      };

  bool _itemDark(String titleKey) => titleKey == 'libItemStars';

  // ── Item emoji ─────────────────────────────────────────────────────────────

  String _itemEmoji(String titleKey) => switch (titleKey) {
        'libItemWhales' || 'libContinueWhales' => '🐳',
        'libItemLions' => '🦁',
        'libItemSeaTurtles' => '🐢',
        'libItemButterflies' => '🦋',
        'libItemFox' || 'libContinueFox' => '🦊',
        'libItemMoon' => '🌙',
        'libItemBear' => '🐻',
        'libItemLighthouse' => '🗼',
        'libItemVolcano' => '🌋',
        'libItemRainbow' => '🌈',
        'libItemStars' => '⭐',
        'libItemBees' => '🍯',
        'libContinueCounting' => '🔢',
        _ => '📚',
      };

  // ──────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = context.watch<AppViewModel>().stats;
    final vm = context.watch<LibraryViewModel>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(streak: stats.streak, stars: stats.stars, hearts: stats.hearts),
                const SizedBox(height: 4),
                Text(
                  l10n.libraryEyebrow,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.66,
                    color: LumioColors.textMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.libraryTitle,
                  style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 14),

                // Search bar
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: LumioColors.borderStrong, width: 2),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 14),
                      const Icon(Icons.search_rounded, size: 18, color: LumioColors.textMuted),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: l10n.librarySearchHint,
                            hintStyle: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: LumioColors.textSoft,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.text,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const LumioIcon(LumioIconType.speaker, size: 16, color: LumioColors.accentDeep),
                      const SizedBox(width: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Subject filter — horizontal scroll
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: vm.subjects.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final key = vm.subjects[i];
                final sel = vm.selectedSubject == i;
                return GestureDetector(
                  onTap: () => vm.selectSubject(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: sel ? LumioColors.text : Colors.white,
                      borderRadius: BorderRadius.circular(LumioRadius.pill),
                      border: Border.all(
                        color: sel ? LumioColors.text : LumioColors.borderStrong,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_subjectEmoji(key), style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 6),
                        Text(
                          _subjectLabel(l10n, key),
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: sel ? Colors.white : LumioColors.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),

          // Featured card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: onPick,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFFE0CD), Color(0xFFFFF1C9)],
                  ),
                  borderRadius: BorderRadius.circular(LumioRadius.xl),
                  boxShadow: LumioShadows.md,
                ),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned(
                      bottom: -16,
                      right: -10,
                      child: Text('🗼',
                          style: TextStyle(
                              fontSize: 130,
                              color: Colors.black.withValues(alpha: 0.08))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _SmallBadge(
                                  label: l10n.libraryFeaturedTag,
                                  color: LumioColors.accentDeep,
                                  bg: LumioColors.accentSoft),
                              const SizedBox(width: 6),
                              _SmallBadge(
                                  label: l10n.libraryFeaturedSubject,
                                  color: LumioColors.text,
                                  bg: Colors.white.withValues(alpha: 0.8)),
                            ],
                          ),
                          const SizedBox(height: 60),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              l10n.libraryFeaturedTitle,
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: LumioColors.text,
                                height: 1.1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.libraryFeaturedDesc,
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: LumioColors.textMuted,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                            decoration: BoxDecoration(
                              color: LumioColors.text,
                              borderRadius: BorderRadius.circular(LumioRadius.pill),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x2E000000),
                                    blurRadius: 0,
                                    offset: Offset(0, 3))
                              ],
                            ),
                            child: Text(
                              l10n.libraryListenNow,
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),

          // Continue learning
          _ShelfHeader(
              title: l10n.libraryContinueTitle,
              sub: l10n.libraryContinueSub,
              onSeeAll: () {}),
          const SizedBox(height: 10),
          SizedBox(
            height: 188,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: vm.continueItems.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final item = vm.continueItems[i];
                return GestureDetector(
                  onTap: onPick,
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: LumioColors.border, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: LumioColors.bg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(_itemEmoji(item.titleKey),
                                style: const TextStyle(fontSize: 44)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _itemTitle(l10n, item.titleKey),
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: LumioColors.text,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          _itemSub(l10n, item.subjectKey),
                          style: GoogleFonts.nunito(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.textMuted,
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(LumioRadius.pill),
                          child: LinearProgressIndicator(
                            value: item.minutesLeft != null && item.minutes > 0
                                ? 1 - (item.minutesLeft! / item.minutes)
                                : 0,
                            minHeight: 6,
                            backgroundColor: LumioColors.border,
                            valueColor: const AlwaysStoppedAnimation<Color>(LumioColors.accent),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 22),

          // Collections
          for (final col in vm.collections) ...[
            _ShelfHeader(
                title: _collectionTitle(l10n, col.titleKey),
                sub: _collectionSub(l10n, col.subtitleKey),
                onSeeAll: () {}),
            const SizedBox(height: 10),
            SizedBox(
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: col.items.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  final item = col.items[i];
                  return GestureDetector(
                    onTap: onPick,
                    child: _LibraryCard(
                      item: item,
                      title: _itemTitle(l10n, item.titleKey),
                      emoji: _itemEmoji(item.titleKey),
                      gradient: _itemGradient(item.titleKey),
                      dark: _itemDark(item.titleKey),
                      levelLabel: item.levelKey != null
                          ? _levelLabel(l10n, item.levelKey!)
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
          ],

          // Tuto picks tip
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: LumioColors.accentSoft,
                borderRadius: BorderRadius.circular(LumioRadius.xl),
                border: Border.all(
                    color: LumioColors.accent.withValues(alpha: 0.5), width: 2),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/tuto-turtle.svg', width: 48, height: 48),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.libraryTipLabel,
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: LumioColors.accentDeep,
                          ),
                        ),
                        Text(
                          l10n.libraryTipTitle,
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: LumioColors.text,
                          ),
                        ),
                        Text(
                          l10n.libraryTipDesc,
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  LumioButton(
                    variant: LumioButtonVariant.primary,
                    size: LumioButtonSize.sm,
                    onPressed: () {},
                    child: Text(l10n.libraryTipCta),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  const _SmallBadge({required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(LumioRadius.pill),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _ShelfHeader extends StatelessWidget {
  final String title;
  final String sub;
  final VoidCallback onSeeAll;

  const _ShelfHeader({required this.title, required this.sub, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: LumioColors.text,
                  ),
                ),
                Text(
                  sub,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: LumioColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context).librarySeeAll,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: LumioColors.accentDeep,
                  ),
                ),
                const LumioIcon(LumioIconType.chevronRight, size: 14, color: LumioColors.accentDeep),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LibraryCard extends StatelessWidget {
  final LibraryItem item;
  final String title;
  final String emoji;
  final List<Color> gradient;
  final bool dark;
  final String? levelLabel;

  const _LibraryCard({
    required this.item,
    required this.title,
    required this.emoji,
    required this.gradient,
    required this.dark,
    this.levelLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Color(0x144A2E1F), blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            bottom: -8,
            right: -6,
            child: Text(
              emoji,
              style: TextStyle(
                fontSize: 64,
                color: dark
                    ? Colors.white.withValues(alpha: 0.4)
                    : Colors.black.withValues(alpha: 0.08),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (levelLabel != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(LumioRadius.pill),
                    ),
                    child: Text(
                      levelLabel!,
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: LumioColors.text,
                      ),
                    ),
                  ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context).libraryCardMinutes(item.minutes),
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: dark
                        ? Colors.white.withValues(alpha: 0.9)
                        : LumioColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: dark ? Colors.white : LumioColors.text,
                    height: 1.15,
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
