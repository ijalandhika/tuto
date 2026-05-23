class LibraryItem {
  final String titleKey;
  final String subjectKey;
  final int minutes;
  final String? levelKey;
  final bool inProgress;
  final int? minutesLeft;

  const LibraryItem({
    required this.titleKey,
    required this.subjectKey,
    required this.minutes,
    this.levelKey,
    this.inProgress = false,
    this.minutesLeft,
  });
}

class LibraryCollection {
  final String titleKey;
  final String subtitleKey;
  final List<LibraryItem> items;

  const LibraryCollection({
    required this.titleKey,
    required this.subtitleKey,
    required this.items,
  });
}
