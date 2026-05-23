class DailyBarData {
  final int minutes;
  const DailyBarData({required this.minutes});
}

class SubjectProgress {
  final String emoji;
  final String labelKey;
  final double value;

  const SubjectProgress({
    required this.emoji,
    required this.labelKey,
    required this.value,
  });
}

class ParentStats {
  final int stars;
  final int streak;
  final int lessons;
  final int minutesTotal;
  final List<DailyBarData> weeklyBars;
  final List<SubjectProgress> subjects;

  const ParentStats({
    required this.stars,
    required this.streak,
    required this.lessons,
    required this.minutesTotal,
    required this.weeklyBars,
    required this.subjects,
  });
}
