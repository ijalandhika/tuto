import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/tokens.dart';
import '../widgets/button.dart';
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

const _nodes = [
  _NodeData('🐳', 'Whales', 'Science', PathNodeState.done, 0),
  _NodeData('🦊', 'Fox tale', 'Reading', PathNodeState.done, 38),
  _NodeData('🔢', 'Counting', 'Math', PathNodeState.current, 0),
  _NodeData('🌋', 'Volcano', 'Science', PathNodeState.locked, -38),
  _NodeData('📖', 'Rhymes', 'Reading', PathNodeState.locked, 0),
  _NodeData('🏆', 'Treasure', 'Bonus', PathNodeState.locked, 38),
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
                    icon: const Icon(Icons.settings_outlined,
                        color: LumioColors.text, size: 18),
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
                        "TODAY'S QUEST",
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.66,
                          color: LumioColors.accentDeep,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '3 lessons to find the treasure',
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
          const SpeechBubble(
            speaking: true,
            small: true,
            text: "Slow and steady — let's count some stars together.",
          ),

          const SizedBox(height: 36),

          // ── Zigzag path ──────────────────────────────────────────────
          for (final n in _nodes) ...[
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
                'finish all to unlock treasure',
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
