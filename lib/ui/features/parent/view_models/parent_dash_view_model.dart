import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/parent_repository.dart';
import 'package:tuto/domain/models/parent_stats.dart';

class ParentDashViewModel extends ChangeNotifier {
  ParentDashViewModel(ParentRepository repo) : _stats = repo.getParentStats();

  final ParentStats _stats;
  ParentStats get stats => _stats;
}
