class KidSettings {
  final bool soundsOn;
  final bool bedtimeOn;

  const KidSettings({
    required this.soundsOn,
    required this.bedtimeOn,
  });

  KidSettings copyWith({bool? soundsOn, bool? bedtimeOn}) => KidSettings(
        soundsOn: soundsOn ?? this.soundsOn,
        bedtimeOn: bedtimeOn ?? this.bedtimeOn,
      );
}
