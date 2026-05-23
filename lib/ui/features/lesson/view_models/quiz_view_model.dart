import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/content_repository.dart';
import 'package:tuto/domain/models/quiz_option.dart';

enum QuizFeedback { none, correct, gentle }

class QuizViewModel extends ChangeNotifier {
  QuizViewModel(ContentRepository repo) : _options = repo.getQuizOptions();

  final List<QuizOption> _options;
  List<QuizOption> get options => _options;

  String? _selected;
  String? get selected => _selected;

  QuizFeedback _feedback = QuizFeedback.none;
  QuizFeedback get feedback => _feedback;

  bool _isComplete = false;
  bool get isComplete => _isComplete;

  void selectAnswer(String letter, bool isCorrect) {
    if (_selected != null) return;
    _selected = letter;
    _feedback = isCorrect ? QuizFeedback.correct : QuizFeedback.gentle;
    notifyListeners();

    if (isCorrect) {
      Future.delayed(const Duration(milliseconds: 1100), () {
        _isComplete = true;
        notifyListeners();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        _selected = null;
        _feedback = QuizFeedback.none;
        notifyListeners();
      });
    }
  }
}
