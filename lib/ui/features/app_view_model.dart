import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/kid_repository.dart';
import 'package:tuto/domain/models/top_bar_stats.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel(KidRepository repo) : _stats = repo.getTopBarStats();

  final TopBarStats _stats;
  TopBarStats get stats => _stats;
}
