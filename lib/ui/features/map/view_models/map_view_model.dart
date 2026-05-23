import 'package:flutter/foundation.dart';
import 'package:tuto/data/repositories/content_repository.dart';
import 'package:tuto/domain/models/map_node.dart';

class MapViewModel extends ChangeNotifier {
  MapViewModel(ContentRepository repo) : _nodes = repo.getMapNodes();

  final List<MapNode> _nodes;
  List<MapNode> get nodes => _nodes;

  int get questProgress => 2;
  int get questTotal => 3;
}
