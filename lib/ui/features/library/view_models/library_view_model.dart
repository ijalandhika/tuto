import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/content_repository.dart';
import 'package:tuto/domain/models/library_item.dart';

class LibraryViewModel extends ChangeNotifier {
  LibraryViewModel(ContentRepository repo)
      : _subjects = repo.getSubjectKeys(),
        _continueItems = repo.getContinueItems(),
        _collections = repo.getCollections();

  final List<String> _subjects;
  final List<LibraryItem> _continueItems;
  final List<LibraryCollection> _collections;

  List<String> get subjects => _subjects;
  List<LibraryItem> get continueItems => _continueItems;
  List<LibraryCollection> get collections => _collections;

  int _selectedSubject = 0;
  int get selectedSubject => _selectedSubject;

  void selectSubject(int index) {
    if (_selectedSubject == index) return;
    _selectedSubject = index;
    notifyListeners();
  }
}
