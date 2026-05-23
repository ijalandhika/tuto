import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/button.dart';
import '../widgets/icon.dart';
import '../widgets/top_bar.dart';

class LibraryScreen extends StatefulWidget {
  final VoidCallback onPick;

  const LibraryScreen({super.key, required this.onPick});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _Subject {
  final String id;
  final String emoji;
  final String label;
  const _Subject(this.id, this.emoji, this.label);
}

List<_Subject> _subjectsFor(AppLocalizations l10n) => [
      _Subject('all', '✨', l10n.subjectForYou),
      _Subject('reading', '📖', l10n.subjectReading),
      _Subject('science', '🔬', l10n.subjectScience),
      _Subject('math', '🔢', l10n.subjectMath),
      _Subject('world', '🌍', l10n.subjectWorld),
      _Subject('art', '🎨', l10n.subjectArt),
    ];

class _ContinueItem {
  final String emoji;
  final String title;
  final String sub;
  final int pct;
  const _ContinueItem(this.emoji, this.title, this.sub, this.pct);
}

List<_ContinueItem> _continueRowFor(AppLocalizations l10n) => [
      _ContinueItem('🐳', l10n.libContinueWhales, l10n.libContinueWhalesSub, 65),
      _ContinueItem('🦊', l10n.libContinueFox, l10n.libContinueFoxSub, 80),
      _ContinueItem(
          '🔢', l10n.libContinueCounting, l10n.libContinueCountingSub, 15),
    ];

class _CollectionItem {
  final String emoji;
  final String title;
  final List<Color> gradient;
  final int minutes;
  final String? level;
  final bool dark;
  const _CollectionItem(this.emoji, this.title, this.gradient, this.minutes,
      {this.level, this.dark = false});
}

class _Collection {
  final String title;
  final String sub;
  final List<_CollectionItem> items;
  const _Collection(this.title, this.sub, this.items);
}

List<_Collection> _collectionsFor(AppLocalizations l10n) => [
      _Collection(l10n.libColAnimals, l10n.libColAnimalsSub, [
        _CollectionItem('🐳', l10n.libItemWhales,
            const [Color(0xFFB8E6FF), Color(0xFFE1F4FF)], 8,
            level: l10n.levelNew),
        _CollectionItem('🦁', l10n.libItemLions,
            const [Color(0xFFFFE6C2), Color(0xFFFFF1C9)], 6,
            level: l10n.levelEasy),
        _CollectionItem('🐢', l10n.libItemSeaTurtles,
            const [Color(0xFFC8F1DD), Color(0xFFDDF6E7)], 7),
        _CollectionItem('🦋', l10n.libItemButterflies,
            const [Color(0xFFFFD9EA), Color(0xFFFFE4DF)], 5),
      ]),
      _Collection(l10n.libColBedtime, l10n.libColBedtimeSub, [
        _CollectionItem('🦊', l10n.libItemFox,
            const [Color(0xFFFFE4DF), Color(0xFFFFF1C9)], 6,
            level: '★★☆'),
        _CollectionItem('🌙', l10n.libItemMoon,
            const [Color(0xFFE0DAFF), Color(0xFFEFEAFF)], 8,
            level: '★★★'),
        _CollectionItem('🐻', l10n.libItemBear,
            const [Color(0xFFFFE6C2), Color(0xFFFFE4DF)], 5,
            level: '★☆☆'),
        _CollectionItem('🗼', l10n.libItemLighthouse,
            const [Color(0xFFFFD3CB), Color(0xFFFFE4DF)], 7,
            level: l10n.levelNew),
      ]),
      _Collection(l10n.libColWhy, l10n.libColWhySub, [
        _CollectionItem('🌋', l10n.libItemVolcano,
            const [Color(0xFFFFD3CB), Color(0xFFFFE6C2)], 6),
        _CollectionItem('🌈', l10n.libItemRainbow,
            const [Color(0xFFE1F4FF), Color(0xFFFFE4DF)], 5),
        _CollectionItem('⭐', l10n.libItemStars,
            const [Color(0xFF2D1B4E), Color(0xFF5638E0)], 6,
            dark: true),
        _CollectionItem('🍯', l10n.libItemBees,
            const [Color(0xFFFFF1C9), Color(0xFFFFE6C2)], 4),
      ]),
    ];

class _LibraryScreenState extends State<LibraryScreen> {
  String _tab = 'all';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final subjects = _subjectsFor(l10n);
    final continueRow = _continueRowFor(l10n);
    final collections = _collectionsFor(l10n);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(streak: 7, stars: 24, hearts: 5),
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
                    border: Border.all(
                        color: LumioColors.borderStrong, width: 2),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 14),
                      const Icon(Icons.search_rounded,
                          size: 18, color: LumioColors.textMuted),
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
              itemCount: subjects.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final s = subjects[i];
                final sel = _tab == s.id;
                return GestureDetector(
                  onTap: () => setState(() => _tab = s.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: sel ? LumioColors.text : Colors.white,
                      borderRadius:
                          BorderRadius.circular(LumioRadius.pill),
                      border: Border.all(
                        color: sel
                            ? LumioColors.text
                            : LumioColors.borderStrong,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(s.emoji,
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 6),
                        Text(
                          s.label,
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: sel
                                ? Colors.white
                                : LumioColors.text,
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
              onTap: widget.onPick,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 9),
                            decoration: BoxDecoration(
                              color: LumioColors.text,
                              borderRadius: BorderRadius.circular(
                                  LumioRadius.pill),
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
              itemCount: continueRow.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final c = continueRow[i];
                return GestureDetector(
                  onTap: widget.onPick,
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: LumioColors.border, width: 2),
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
                            child: Text(c.emoji,
                                style: const TextStyle(fontSize: 44)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          c.title,
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
                          c.sub,
                          style: GoogleFonts.nunito(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: LumioColors.textMuted,
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(LumioRadius.pill),
                          child: LinearProgressIndicator(
                            value: c.pct / 100,
                            minHeight: 6,
                            backgroundColor: LumioColors.border,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(
                                    LumioColors.accent),
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
          for (final col in collections) ...[
            _ShelfHeader(
                title: col.title, sub: col.sub, onSeeAll: () {}),
            const SizedBox(height: 10),
            SizedBox(
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: col.items.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  final it = col.items[i];
                  return GestureDetector(
                    onTap: widget.onPick,
                    child: _LibraryCard(item: it),
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
          ],

          // Tuto picks tip
          Padding(
            padding:
                const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: LumioColors.accentSoft,
                borderRadius: BorderRadius.circular(LumioRadius.xl),
                border: Border.all(
                    color: LumioColors.accent.withValues(alpha: 0.5),
                    width: 2),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/tuto-turtle.svg',
                      width: 48, height: 48),
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
  const _SmallBadge(
      {required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
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

  const _ShelfHeader(
      {required this.title, required this.sub, required this.onSeeAll});

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
  final _CollectionItem item;
  const _LibraryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: item.gradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color(0x144A2E1F),
              blurRadius: 6,
              offset: Offset(0, 3))
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            bottom: -8,
            right: -6,
            child: Text(
              item.emoji,
              style: TextStyle(
                fontSize: 64,
                color: item.dark
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
                if (item.level != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.82),
                      borderRadius:
                          BorderRadius.circular(LumioRadius.pill),
                    ),
                    child: Text(
                      item.level!,
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
                    color: item.dark
                        ? Colors.white.withValues(alpha: 0.9)
                        : LumioColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.title,
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: item.dark ? Colors.white : LumioColors.text,
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
