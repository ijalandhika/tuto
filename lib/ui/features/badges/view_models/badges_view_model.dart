import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/content_repository.dart';
import 'package:tuto/domain/models/badge_item.dart';

class BadgesViewModel extends ChangeNotifier {
  BadgesViewModel(ContentRepository repo) : _badges = repo.getBadges();

  final List<BadgeItem> _badges;
  List<BadgeItem> get badges => _badges;
  int get earnedCount => _badges.where((b) => b.earned).length;
}
