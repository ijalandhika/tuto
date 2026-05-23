import 'package:tuto/domain/models/badge_item.dart';
import 'package:tuto/domain/models/library_item.dart';
import 'package:tuto/domain/models/map_node.dart';
import 'package:tuto/domain/models/node_state.dart';
import 'package:tuto/domain/models/quiz_option.dart';

class ContentRepository {
  List<MapNode> getMapNodes() => const [
        MapNode(emoji: '🐳', labelKey: 'whales', subjectKey: 'science', state: NodeState.done, xOffset: 0),
        MapNode(emoji: '🦊', labelKey: 'foxTale', subjectKey: 'reading', state: NodeState.done, xOffset: 38),
        MapNode(emoji: '🔢', labelKey: 'counting', subjectKey: 'math', state: NodeState.current, xOffset: 0),
        MapNode(emoji: '🌋', labelKey: 'volcano', subjectKey: 'science', state: NodeState.locked, xOffset: -38),
        MapNode(emoji: '📖', labelKey: 'rhymes', subjectKey: 'reading', state: NodeState.locked, xOffset: 0),
        MapNode(emoji: '🏆', labelKey: 'treasure', subjectKey: 'bonus', state: NodeState.locked, xOffset: 38),
      ];

  List<QuizOption> getQuizOptions() => const [
        QuizOption(letter: 'A', isCorrect: true),
        QuizOption(letter: 'B', isCorrect: false),
        QuizOption(letter: 'C', isCorrect: false),
        QuizOption(letter: 'D', isCorrect: false),
      ];

  List<BadgeItem> getBadges() => const [
        BadgeItem(emoji: '🏆', nameKey: 'badgeStarCounter', subKey: 'badgeStarCounterSub', earned: true, fresh: true),
        BadgeItem(emoji: '🐳', nameKey: 'badgeSeaExplorer', subKey: 'badgeSeaExplorerSub', earned: true),
        BadgeItem(emoji: '🦊', nameKey: 'badgeBraveReader', subKey: 'badgeBraveReaderSub', earned: true),
        BadgeItem(emoji: '🔥', nameKey: 'badgeOnFire', subKey: 'badgeOnFireSub', earned: true),
        BadgeItem(emoji: '🌋', nameKey: 'badgeVolcanoPal', subKey: 'badgeVolcanoPalSub'),
        BadgeItem(emoji: '📖', nameKey: 'badgeWordWizard', subKey: 'badgeWordWizardSub'),
        BadgeItem(emoji: '🌙', nameKey: 'badgeNightOwl', subKey: 'badgeNightOwlSub'),
        BadgeItem(emoji: '🎨', nameKey: 'badgeColorful', subKey: 'badgeColorfulSub'),
        BadgeItem(emoji: '⭐', nameKey: 'badgeStarHoarder', subKey: 'badgeStarHoarderSub'),
      ];

  List<LibraryItem> getContinueItems() => const [
        LibraryItem(titleKey: 'libContinueWhales', subjectKey: 'libContinueWhalesSub', minutes: 4, inProgress: true, minutesLeft: 4),
        LibraryItem(titleKey: 'libContinueFox', subjectKey: 'libContinueFoxSub', minutes: 2, inProgress: true, minutesLeft: 2),
        LibraryItem(titleKey: 'libContinueCounting', subjectKey: 'libContinueCountingSub', minutes: 1, inProgress: true),
      ];

  List<LibraryCollection> getCollections() => const [
        LibraryCollection(
          titleKey: 'libColAnimals',
          subtitleKey: 'libColAnimalsSub',
          items: [
            LibraryItem(titleKey: 'libItemWhales', subjectKey: 'subjectScience', minutes: 7, levelKey: 'levelNew'),
            LibraryItem(titleKey: 'libItemLions', subjectKey: 'subjectScience', minutes: 6),
            LibraryItem(titleKey: 'libItemSeaTurtles', subjectKey: 'subjectScience', minutes: 5),
            LibraryItem(titleKey: 'libItemButterflies', subjectKey: 'subjectScience', minutes: 5),
          ],
        ),
        LibraryCollection(
          titleKey: 'libColBedtime',
          subtitleKey: 'libColBedtimeSub',
          items: [
            LibraryItem(titleKey: 'libItemFox', subjectKey: 'subjectReading', minutes: 8, levelKey: 'levelEasy'),
            LibraryItem(titleKey: 'libItemMoon', subjectKey: 'subjectReading', minutes: 7),
            LibraryItem(titleKey: 'libItemBear', subjectKey: 'subjectReading', minutes: 9),
            LibraryItem(titleKey: 'libItemLighthouse', subjectKey: 'subjectReading', minutes: 7),
          ],
        ),
        LibraryCollection(
          titleKey: 'libColWhy',
          subtitleKey: 'libColWhySub',
          items: [
            LibraryItem(titleKey: 'libItemVolcano', subjectKey: 'subjectScience', minutes: 6),
            LibraryItem(titleKey: 'libItemRainbow', subjectKey: 'subjectScience', minutes: 5),
            LibraryItem(titleKey: 'libItemStars', subjectKey: 'subjectScience', minutes: 6),
            LibraryItem(titleKey: 'libItemBees', subjectKey: 'subjectScience', minutes: 7),
          ],
        ),
      ];

  List<String> getSubjectKeys() => const [
        'subjectForYou',
        'subjectReading',
        'subjectMath',
        'subjectScience',
        'subjectWorld',
        'subjectArt',
        'subjectBonus',
      ];
}
