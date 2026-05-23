import 'package:tuto/domain/models/top_bar_stats.dart';

class KidRepository {
  TopBarStats getTopBarStats() => const TopBarStats(streak: 7, stars: 24, hearts: 5);

  String getKidName() => 'Maya';
  int getKidAge() => 8;
  String getKidAvatar() => '🦊';
  int getKidLevel() => 4;
}
