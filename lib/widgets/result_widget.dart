import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSize {
  const ResultWidget({Key? key, required this.win, required this.onRestart})
      : super(key: key);

  final bool? win;
  final Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 32,
              ),
              onPressed: onRestart,
            )),
      )),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(120);

  Color _getColor() {
    if (win == null) return Colors.yellow;
    if (win == true) return Colors.green;
    return Colors.red;
  }

  IconData _getIcon() {
    if (win == null) return Icons.sentiment_satisfied;
    if (win == true) return Icons.sentiment_very_satisfied;
    return Icons.sentiment_dissatisfied;
  }
}
