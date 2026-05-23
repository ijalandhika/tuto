import 'node_state.dart';

class MapNode {
  final String emoji;

  /// Matches the suffix of a mapNode l10n key, e.g. 'whales' → mapNodeWhales.
  final String labelKey;

  /// Matches the suffix of a subject l10n key, e.g. 'science' → subjectScience.
  final String subjectKey;

  final NodeState state;
  final double xOffset;

  const MapNode({
    required this.emoji,
    required this.labelKey,
    required this.subjectKey,
    required this.state,
    required this.xOffset,
  });
}
