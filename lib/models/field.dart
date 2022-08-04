import 'package:minefield/models/exceptions/explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];
  bool _open = false;
  bool _marked = false;
  bool _mined = false;
  bool _blownUp = false;

  Field({
    required this.line,
    required this.column,
  });

  bool get mined => _mined;
  bool get blownUp => _blownUp;
  bool get opened => _open;
  bool get marked => _marked;
  bool get resolved {
    bool minedAndMarked = mined && marked;
    bool safeAndOpened = !mined && opened;
    return minedAndMarked || safeAndOpened;
  }

  bool get safeNeighborhood => neighbors.every((neighbor) => !neighbor.mined);
  int get minesInNeighborhood =>
      neighbors.where((neighbor) => neighbor.mined).length;

  void addNeighbor(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) return;

    if (deltaLine <= 1 && deltaColumn <= 1) return neighbors.add(neighbor);
  }

  void open() {
    if (_open) return;

    _open = true;

    if (_mined) {
      _blownUp = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      for (Field neighbor in neighbors) {
        neighbor.open();
      }
    }
  }

  void showMines() {
    if (_mined) {
      _open = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void toggleMark() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _mined = false;
    _blownUp = false;
  }
}
