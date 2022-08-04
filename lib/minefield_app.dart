import 'package:flutter/material.dart';
import 'package:minefield/pages/board_page.dart';

class MinefieldApp extends StatelessWidget {
  const MinefieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoardPage(),
    );
  }
}
