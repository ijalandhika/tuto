import 'package:tuto/domain/models/kid_settings.dart';

class SettingsRepository {
  KidSettings getSettings() => const KidSettings(soundsOn: true, bedtimeOn: false);
}
