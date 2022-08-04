import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    Key? key,
    required this.field,
    required this.onOpen,
    required this.onToggleMark,
  }) : super(key: key);

  final Field field;
  final Function(Field) onOpen;
  final Function(Field) onToggleMark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onToggleMark(field),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    if (field.opened && field.blownUp && field.mined) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened && field.minesInNeighborhood > 0) {
      return Image.asset(
          'assets/images/aberto_${field.minesInNeighborhood}.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
