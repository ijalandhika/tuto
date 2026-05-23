import 'package:tuto/domain/models/parent_stats.dart';
import 'package:tuto/domain/models/weekly_report.dart';

class ParentRepository {
  ParentStats getParentStats() => const ParentStats(
        stars: 24,
        streak: 7,
        lessons: 3,
        minutesTotal: 68,
        weeklyBars: [
          DailyBarData(minutes: 10),
          DailyBarData(minutes: 15),
          DailyBarData(minutes: 8),
          DailyBarData(minutes: 12),
          DailyBarData(minutes: 15),
          DailyBarData(minutes: 5),
          DailyBarData(minutes: 3),
        ],
        subjects: [
          SubjectProgress(emoji: '📖', labelKey: 'subjectReading', value: 0.72),
          SubjectProgress(emoji: '🔢', labelKey: 'parentDashSubjectMaths', value: 0.55),
          SubjectProgress(emoji: '🔬', labelKey: 'subjectScience', value: 0.38),
        ],
      );

  WeeklyReport getWeeklyReport() => const WeeklyReport(
        highlights: [
          WeeklyHighlight(emoji: '📖', textKey: 'weeklyHighlight1'),
          WeeklyHighlight(emoji: '🔢', textKey: 'weeklyHighlight2'),
          WeeklyHighlight(emoji: '🔥', textKey: 'weeklyHighlight3'),
        ],
        stats: [
          WeeklyStatItem(emoji: '⏱', valueKey: 'weeklyStatTimeValue', labelKey: 'weeklyStatTimeLabel'),
          WeeklyStatItem(emoji: '📘', valueKey: 'weeklyStatLessonsValue', labelKey: 'weeklyStatLessonsLabel'),
          WeeklyStatItem(emoji: '⭐', valueKey: 'weeklyStatStarsValue', labelKey: 'weeklyStatStarsLabel'),
          WeeklyStatItem(emoji: '🏆', valueKey: 'weeklyStatBadgeValue', labelKey: 'weeklyStatBadgeLabel'),
        ],
      );
}
