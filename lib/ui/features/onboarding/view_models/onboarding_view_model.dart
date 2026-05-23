import 'package:flutter/foundation.dart';
import 'package:tuto/domain/models/onboarding_data.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingData _data = const OnboardingData();
  OnboardingData get data => _data;

  void setParentName(String v) => _update(_data.copyWith(parentName: v));
  void setEmail(String v) => _update(_data.copyWith(email: v));
  void setPassword(String v) => _update(_data.copyWith(password: v));
  void setKidName(String v) => _update(_data.copyWith(kidName: v));
  void setKidAge(String v) => _update(_data.copyWith(kidAge: v));
  void setMinutes(int v) => _update(_data.copyWith(minutes: v));
  void setSelectedAvatar(int i) => _update(_data.copyWith(selectedAvatar: i));

  void setEnterCode(String v) =>
      _update(_data.copyWith(enterCode: v, codeError: false));

  void setCodeError(bool v) => _update(_data.copyWith(codeError: v));

  void toggleGoal(int i) {
    final next = Set<int>.from(_data.selectedGoals);
    if (!next.add(i)) next.remove(i);
    _update(_data.copyWith(selectedGoals: next));
  }

  void toggleInterest(int i) {
    final next = Set<int>.from(_data.selectedInterests);
    if (!next.add(i)) next.remove(i);
    _update(_data.copyWith(selectedInterests: next));
  }

  void toggleDay(int i) {
    final next = Set<int>.from(_data.selectedDays);
    if (!next.add(i)) next.remove(i);
    _update(_data.copyWith(selectedDays: next));
  }

  void _update(OnboardingData next) {
    _data = next;
    notifyListeners();
  }
}
