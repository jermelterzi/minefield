import 'package:flutter/cupertino.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/field.dart';
import 'package:minefield/widgets/field_widget.dart';

class Boardwidget extends StatelessWidget {
  const Boardwidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onToggleMark,
  }) : super(key: key);

  final Board board;
  final Function(Field) onOpen;
  final Function(Field) onToggleMark;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: board.columns,
      children: board.fields.map((field) {
        return FieldWidget(
          field: field,
          onOpen: onOpen,
          onToggleMark: onToggleMark,
        );
      }).toList(),
    ));
  }
}
