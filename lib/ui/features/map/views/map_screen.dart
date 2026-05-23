import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuto/design/tokens.dart';
import 'package:tuto/domain/models/node_state.dart';
import 'package:tuto/l10n/app_localizations.dart';
import 'package:tuto/ui/core/button.dart';
import 'package:tuto/ui/core/icon.dart';
import 'package:tuto/ui/core/path_node.dart';
import 'package:tuto/ui/core/progress_bar.dart';
import 'package:tuto/ui/core/speech_bubble.dart';
import 'package:tuto/ui/core/top_bar.dart';
import 'package:tuto/ui/features/app_view_model.dart';
import 'package:tuto/ui/features/map/view_models/map_view_model.dart';

class MapScreen extends StatelessWidget {
  final VoidCallback onStartLesson;
  final VoidCallback? onParent;

  const MapScreen({
    super.key,
    required this.onStartLesson,
    this.onParent,
  });

  String _nodeLabel(AppLocalizations l10n, String key) => switch (key) {
        'whales' => l10n.mapNodeWhales,
        'foxTale' => l10n.mapNodeFoxTale,
        'counting' => l10n.mapNodeCounting,
        'volcano' => l10n.mapNodeVolcano,
        'rhymes' => l10n.mapNodeRhymes,
        'treasure' => l10n.mapNodeTreasure,
        _ => key,
      };

  String _subjectLabel(AppLocalizations l10n, String key) => switch (key) {
        'science' => l10n.subjectScience,
        'reading' => l10n.subjectReading,
        'math' => l10n.subjectMath,
        'bonus' => l10n.subjectBonus,
        _ => key,
      };

  PathNodeState _toPathState(NodeState s) => switch (s) {
        NodeState.done => PathNodeState.done,
        NodeState.current => PathNodeState.current,
        NodeState.locked => PathNodeState.locked,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = context.watch<MapViewModel>();
    final stats = context.watch<AppViewModel>().stats;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: Column(
        children: [
          TopBar(
            streak: stats.streak,
            stars: stats.stars,
            hearts: stats.hearts,
            trailing: onParent != null
                ? LumioIconButton(
                    variant: LumioButtonVariant.secondary,
                    icon: const LumioIcon(LumioIconType.settings, size: 18),
                    onPressed: onParent,
                    size: 44,
                  )
                : null,
          ),

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
                      '${vm.questProgress} / ${vm.questTotal}',
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
                          value: (vm.questProgress / vm.questTotal * 100),
                          fill: LumioProgressFill.accent,
                          height: 8),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SpeechBubble(speaking: true, small: true, text: l10n.mapSpeech),
          const SizedBox(height: 36),

          for (final node in vm.nodes) ...[
            Transform.translate(
              offset: Offset(node.xOffset, 0),
              child: PathNode(
                emoji: node.emoji,
                label: _nodeLabel(l10n, node.labelKey),
                subject: _subjectLabel(l10n, node.subjectKey),
                state: _toPathState(node.state),
                onTap: node.state != NodeState.locked ? onStartLesson : null,
              ),
            ),
            const SizedBox(height: 22),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 24, height: 1, color: LumioColors.borderStrong),
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
              Container(width: 24, height: 1, color: LumioColors.borderStrong),
            ],
          ),
        ],
      ),
    );
  }
}
