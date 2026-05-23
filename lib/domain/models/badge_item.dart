class BadgeItem {
  final String emoji;

  /// Matches the suffix used to look up nameKey / subKey l10n strings.
  final String nameKey;
  final String subKey;
  final bool earned;
  final bool fresh;

  const BadgeItem({
    required this.emoji,
    required this.nameKey,
    required this.subKey,
    this.earned = false,
    this.fresh = false,
  });
}
