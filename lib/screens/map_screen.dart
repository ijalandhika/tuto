import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../l10n/app_localizations.dart';
import '../widgets/button.dart';
import '../widgets/icon.dart';
import '../widgets/path_node.dart';
import '../widgets/progress_bar.dart';
import '../widgets/speech_bubble.dart';
import '../widgets/top_bar.dart';

class _NodeData {
  final String emoji;
  final String label;
  final String subject;
  final PathNodeState state;
  final double xOffset;
  const _NodeData(
      this.emoji, this.label, this.subject, this.state, this.xOffset);
}

List<_NodeData> _nodesFor(AppLocalizations l10n) => [
      _NodeData('🐳', l10n.mapNodeWhales, l10n.subjectScience,
          PathNodeState.done, 0),
      _NodeData('🦊', l10n.mapNodeFoxTale, l10n.subjectReading,
          PathNodeState.done, 38),
      _NodeData('🔢', l10n.mapNodeCounting, l10n.subjectMath,
          PathNodeState.current, 0),
      _NodeData('🌋', l10n.mapNodeVolcano, l10n.subjectScience,
          PathNodeState.locked, -38),
      _NodeData('📖', l10n.mapNodeRhymes, l10n.subjectReading,
          PathNodeState.locked, 0),
      _NodeData('🏆', l10n.mapNodeTreasure, l10n.subjectBonus,
          PathNodeState.locked, 38),
    ];

class MapScreen extends StatelessWidget {
  final VoidCallback onStartLesson;
  final VoidCallback? onParent;

  const MapScreen({
    super.key,
    required this.onStartLesson,
    this.onParent,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nodes = _nodesFor(l10n);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: Column(
        children: [
          TopBar(
            streak: 7,
            stars: 24,
            hearts: 5,
            trailing: onParent != null
                ? LumioIconButton(
                    variant: LumioButtonVariant.secondary,
                    icon: const LumioIcon(LumioIconType.settings, size: 18),
                    onPressed: onParent,
                    size: 44,
                  )
                : null,
          ),

          // ── Daily quest banner ───────────────────────────────────────
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 18),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE1F4FF), Color(0xFFFFF1C9)],
              ),
              borderRadius: BorderRadius.circular(LumioRadius.xl),
              border: Border.all(color: LumioColors.accentSoft, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: LumioShadows.sm,
                  ),
                  child: const Center(
                      child: Text('🗺️', style: TextStyle(fontSize: 24))),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.mapQuestLabel,
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.66,
                          color: LumioColors.accentDeep,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.mapQuestTitle,
                        style: GoogleFonts.nunito(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: LumioColors.text,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '2 / 3',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: LumioColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 56,
                      child: LumioProgressBar(
                          value: 66,
                          fill: LumioProgressFill.accent,
                          height: 8),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Tuto speech bubble ───────────────────────────────────────
          SpeechBubble(
            speaking: true,
            small: true,
            text: l10n.mapSpeech,
          ),

          const SizedBox(height: 36),

          // ── Zigzag path ──────────────────────────────────────────────
          for (final n in nodes) ...[
            Transform.translate(
              offset: Offset(n.xOffset, 0),
              child: PathNode(
                emoji: n.emoji,
                label: n.label,
                subject: n.subject,
                state: n.state,
                onTap:
                    n.state != PathNodeState.locked ? onStartLesson : null,
              ),
            ),
            const SizedBox(height: 22),
          ],

          // ── Treasure hint ────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 24, height: 1, color: LumioColors.borderStrong),
              const SizedBox(width: 8),
              Text(
                l10n.mapTreasureHint,
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: LumioColors.textMuted,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                  width: 24, height: 1, color: LumioColors.borderStrong),
            ],
          ),
        ],
      ),
    );
  }
}
