import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('Field Test', () {
    test('Open field WITH explosion', () {
      Field f = Field(line: 0, column: 0);
      f.mine();
      expect(f.open, throwsException);
    });
    test('Open field WITHOUT explosion', () {
      Field f = Field(line: 0, column: 0);
      f.open();
      expect(f.opened, isTrue);
    });
    test('Add neighbor field', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 0, column: 1);
      Field f3 = Field(line: 1, column: 1);
      Field f4 = Field(line: 1, column: 0);
      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);
      expect(f1.neighbors.length, 3);
    });
    test('Add NO neighbor field ', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 4);
      f1.addNeighbor(f2);
      expect(f1.neighbors.isEmpty, isTrue);
    });
    test('SAFE neighborhood', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 0, column: 1);
      f2.mine();
      Field f3 = Field(line: 1, column: 1);
      Field f4 = Field(line: 1, column: 0);
      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);
      expect(f1.safeNeighborhood, isFalse);
    });
    test('How many bombs in the neighborhood', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 0, column: 1);
      f2.mine();
      Field f3 = Field(line: 1, column: 1);
      Field f4 = Field(line: 1, column: 0);
      f4.mine();
      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);
      expect(f1.minesInNeighborhood, 2);
    });
  });
}
