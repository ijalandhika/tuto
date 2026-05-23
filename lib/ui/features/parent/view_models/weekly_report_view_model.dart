import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/parent_repository.dart';
import 'package:tuto/domain/models/weekly_report.dart';

class WeeklyReportViewModel extends ChangeNotifier {
  WeeklyReportViewModel(ParentRepository repo) : _report = repo.getWeeklyReport();

  final WeeklyReport _report;
  WeeklyReport get report => _report;
}
