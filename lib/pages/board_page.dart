import 'package:flutter/material.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/exceptions/explosion_exception.dart';
import 'package:minefield/models/field.dart';
import 'package:minefield/widgets/board_widget.dart';
import 'package:minefield/widgets/result_widget.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key, required this.bombs}) : super(key: key);

  final int bombs;

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  bool? _win;
  Board _board = Board(
    columns: 0,
    lines: 0,
    bombs: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: _win,
        onRestart: _restart,
      ),
      body: Container(
        color: Colors.grey,
        child: LayoutBuilder(builder: (ctx, constraints) {
          return Boardwidget(
            board: _getBoard(
              constraints.maxWidth,
              constraints.maxHeight,
            ),
            onOpen: _open,
            onToggleMark: _toggleMark,
          );
        }),
      ),
    );
  }

  void _restart() {
    setState(() {
      _win = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_win != null) {
      return;
    }

    setState(() {
      try {
        field.open();
        if (_board.resolved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board.showMines();
      }
    });
  }

  void _toggleMark(Field field) {
    setState(() {
      field.toggleMark();
      if (_board.resolved) {
        _win = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board.columns == 0) {
      int columns = 16;
      double fieldSize = width / columns;
      int lines = (height / fieldSize).floor();
      _board = Board(
        lines: lines,
        columns: columns,
        bombs: widget.bombs,
      );
    }
    return _board;
  }
}
