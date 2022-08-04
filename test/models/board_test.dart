import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('Winning the game', () {
    // Creating the board
    Board board = Board(lines: 2, columns: 2, bombs: 0);

    // Mining a field
    board.fields[0].mine();

    // Playing...
    board.fields[0].toggleMark();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].open();

    expect(board.resolved, isTrue);
  });
}
