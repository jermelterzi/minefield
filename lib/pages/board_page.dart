import 'package:flutter/material.dart';
import 'package:minefield/widgets/result_widget.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        win: null,
        onRestart: _restart,
      ),
      body: const Center(
        child: Text('Here is the table!'),
      ),
    );
  }

  _restart() {
    print('Reiniciando...');
  }
}
