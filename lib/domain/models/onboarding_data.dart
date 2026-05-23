class OnboardingData {
  final String parentName;
  final String email;
  final String password;
  final String kidName;
  final String kidAge;
  final Set<int> selectedGoals;
  final Set<int> selectedInterests;
  final int minutes;
  final Set<int> selectedDays;
  final String enterCode;
  final bool codeError;
  final int selectedAvatar;

  const OnboardingData({
    this.parentName = '',
    this.email = '',
    this.password = '',
    this.kidName = '',
    this.kidAge = '',
    this.selectedGoals = const {},
    this.selectedInterests = const {},
    this.minutes = 15,
    this.selectedDays = const {0, 1, 2, 3, 4},
    this.enterCode = '',
    this.codeError = false,
    this.selectedAvatar = 0,
  });

  OnboardingData copyWith({
    String? parentName,
    String? email,
    String? password,
    String? kidName,
    String? kidAge,
    Set<int>? selectedGoals,
    Set<int>? selectedInterests,
    int? minutes,
    Set<int>? selectedDays,
    String? enterCode,
    bool? codeError,
    int? selectedAvatar,
  }) =>
      OnboardingData(
        parentName: parentName ?? this.parentName,
        email: email ?? this.email,
        password: password ?? this.password,
        kidName: kidName ?? this.kidName,
        kidAge: kidAge ?? this.kidAge,
        selectedGoals: selectedGoals ?? this.selectedGoals,
        selectedInterests: selectedInterests ?? this.selectedInterests,
        minutes: minutes ?? this.minutes,
        selectedDays: selectedDays ?? this.selectedDays,
        enterCode: enterCode ?? this.enterCode,
        codeError: codeError ?? this.codeError,
        selectedAvatar: selectedAvatar ?? this.selectedAvatar,
      );
}
