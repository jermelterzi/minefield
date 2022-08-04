import 'dart:math';

import 'package:minefield/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int bombs;
  final List<Field> _fields = [];

  Board({
    required this.lines,
    required this.columns,
    required this.bombs,
  }) {
    _createFields();
    _connectNeighborhood();
    _raffleMines();
  }

  List<Field> get fields => _fields;
  bool get resolved => _fields.every((field) => field.resolved);

  void restart() {
    for (Field field in _fields) {
      field.restart();
    }
    _raffleMines();
  }

  void showMines() {
    for (Field field in _fields) {
      field.showMines();
    }
  }

  void _createFields() {
    for (int line = 0; line < lines; line++) {
      for (int column = 0; column < columns; column++) {
        _fields.add(Field(line: line, column: column));
      }
    }
  }

  void _connectNeighborhood() {
    for (Field field in _fields) {
      for (Field neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _raffleMines() {
    int raffleds = 0;

    if (bombs > lines * columns) return;

    while (raffleds < bombs) {
      int i = Random().nextInt(_fields.length);
      if (!_fields[i].mined) {
        raffleds++;
        _fields[i].mine();
      }
    }
  }
}
