import 'package:gaml_cce/computation_engine.dart';

void main() {
  var pipeline = ExampleCompTree();

  // pipeline.logStream.listen((event) => print(event));

  pipeline.run();
}

class ExampleCompTree extends ComputationTree {
  ExampleCompTree() : super();

  @override
  Node build() {
    return Screen(
      input: ComputationNode(
        function: (int x) => x * 3,
        input: ValueSourceNode(10),
      ),
    );
  }
}
