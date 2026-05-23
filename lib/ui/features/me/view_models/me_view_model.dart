import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/kid_repository.dart';
import 'package:tuto/data/repositories/settings_repository.dart';
import 'package:tuto/domain/models/kid_settings.dart';

class MeViewModel extends ChangeNotifier {
  MeViewModel(KidRepository kidRepo, SettingsRepository settingsRepo)
      : _name = kidRepo.getKidName(),
        _age = kidRepo.getKidAge(),
        _avatar = kidRepo.getKidAvatar(),
        _level = kidRepo.getKidLevel(),
        _settings = settingsRepo.getSettings();

  final String _name;
  final int _age;
  final String _avatar;
  final int _level;
  KidSettings _settings;

  String get name => _name;
  int get age => _age;
  String get avatar => _avatar;
  int get level => _level;
  KidSettings get settings => _settings;

  void toggleSounds() {
    _settings = _settings.copyWith(soundsOn: !_settings.soundsOn);
    notifyListeners();
  }

  void toggleBedtime() {
    _settings = _settings.copyWith(bedtimeOn: !_settings.bedtimeOn);
    notifyListeners();
  }
}
