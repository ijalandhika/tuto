import 'dart:math';
import 'package:flutter/foundation.dart';

class ParentGateViewModel extends ChangeNotifier {
  late int _a;
  late int _b;
  late int _answer;
  String _input = '';
  bool _shaking = false;
  bool _isUnlocked = false;

  int get a => _a;
  int get b => _b;
  String get input => _input;
  bool get shaking => _shaking;
  bool get isUnlocked => _isUnlocked;

  ParentGateViewModel() {
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final rng = Random();
    _a = rng.nextInt(9) + 2;
    _b = rng.nextInt(9) + 2;
    _answer = _a * _b;
    _input = '';
  }

  void press(String digit) {
    if (_input.length >= 3) return;
    _input += digit;
    notifyListeners();
  }

  void backspace() {
    if (_input.isEmpty) return;
    _input = _input.substring(0, _input.length - 1);
    notifyListeners();
  }

  void submit(VoidCallback onUnlock) {
    if (_input.isEmpty) return;
    if (int.tryParse(_input) == _answer) {
      _isUnlocked = true;
      notifyListeners();
      onUnlock();
    } else {
      _shaking = true;
      _input = '';
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 400), () {
        _shaking = false;
        notifyListeners();
      });
    }
  }
}
