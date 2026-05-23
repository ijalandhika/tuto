import 'package:flutter/foundation.dart';

class MiniGameViewModel extends ChangeNotifier {
  final _tapped = <int>{};

  static const int target = 5;
  static const int totalStars = 7;

  Set<int> get tapped => Set.unmodifiable(_tapped);
  bool get isDone => _tapped.length == target;

  void tapStar(int index) {
    if (_tapped.contains(index)) return;
    if (_tapped.length >= target) return;
    _tapped.add(index);
    notifyListeners();
  }
}
