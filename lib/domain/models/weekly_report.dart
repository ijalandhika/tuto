class WeeklyHighlight {
  final String emoji;
  final String textKey;
  const WeeklyHighlight({required this.emoji, required this.textKey});
}

class WeeklyStatItem {
  final String emoji;
  final String valueKey;
  final String labelKey;
  const WeeklyStatItem({
    required this.emoji,
    required this.valueKey,
    required this.labelKey,
  });
}

class WeeklyReport {
  final List<WeeklyHighlight> highlights;
  final List<WeeklyStatItem> stats;
  const WeeklyReport({required this.highlights, required this.stats});
}
