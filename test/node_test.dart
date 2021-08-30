import 'package:gaml_cce/computation_engine.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Node:', () {
    test('Check that ValueSourceNode propagates properly for different types',
        () {
      expect(ValueSourceNode(10).pullAndReturn(), NodeValue(10));
      expect(ValueSourceNode(true).pullAndReturn(), NodeValue(true));
      expect(
          ValueSourceNode('A String').pullAndReturn(), NodeValue('A String'));
    });

    test('Check that the identity node returns the correct value', () {
      expect(
        Identity(input: ValueSourceNode(10)).pullAndReturn(),
        NodeValue(10),
      );
      expect(
        Identity(input: ValueSourceNode(true)).pullAndReturn(),
        NodeValue(true),
      );
      expect(
        Identity(input: ValueSourceNode('A string')).pullAndReturn(),
        NodeValue('A string'),
      );
    });

    test('Check that the ComputationNode performs transformations properly',
        () {
      expect(
          ComputationNode(
            function: (int x) => x + 1,
            input: ValueSourceNode(10),
          ).pullAndReturn(),
          NodeValue(11));
    });

    test(
        'Check that monadic properties hold for a node: unit is a left-identity for flatMap',
        () {
      NodeValue<int> f(int x) => NodeValue(x + 1);
      expect(
        NodeValue(10).flatMap(f),
        f(10),
      );
    });
    test(
        'Check that monadic properties hold for a node: unit is a right-identity for flatMap',
        () {
      expect(
        NodeValue(10).flatMap((x) => NodeValue(x)),
        NodeValue(10),
      );
    });
    test(
        'Check that monadic properties hold for a node: flatMap is associative',
        () {
      NodeValue<int> f(int x) => NodeValue(x + 1);
      NodeValue<int> g(int x) => NodeValue(x * 2);
      expect(
        NodeValue(10).flatMap((x) => f(x).flatMap(g)),
        NodeValue(10).flatMap(f).flatMap(g),
      );
    });
  });
}
