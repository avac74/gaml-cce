import 'package:gaml_cce/computation_engine.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('NodeValue:', () {
    test('Create a NodeValue and check the value is there', () {
      expect(NodeValue(true).data, true);
      expect(NodeValue(1).data, 1);
      expect(NodeValue(2.0).data, 2.0);
      expect(NodeValue(NodeValue('A Nested Value')).data.data,
          NodeValue('A Nested Value').data);
    });

    test('Converting to string should work as expected', () {
      expect(NodeValue(true).toString(), 'true');
      expect(NodeValue(1).toString(), '1');
      expect(NodeValue(2.0).toString(), '2.0');
      expect(
          NodeValue(NodeValue('A Nested Value')).toString(), 'A Nested Value');
    });

    test('Using map should return a proper NodeValue', () {
      expect(NodeValue(true).map((e) => !e), NodeValue(false));
      expect(NodeValue(1).map((e) => e + 1), NodeValue(2));
    });

    test('Using flatMap should return a proper NodeValue', () {
      expect(NodeValue(true).flatMap((e) => NodeValue(!e)), NodeValue(false));
      expect(NodeValue(1).flatMap((e) => NodeValue(e + 1)), NodeValue(2));
    });
  });
}
