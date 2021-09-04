import 'package:gaml_cce/computation_engine.dart';

void main() {
  var compTree = ExampleCompTree();

  // Start running the computation tree
  // Whenever we save the file, the computation is refreshed
  // without the need to rerun from scratch
  compTree.run();
}

class ExampleCompTree extends ComputationTree {
  ExampleCompTree() : super();

  @override
  Node build() {
    // This node outputs things to the screen
    return ScreenSinkNode(
      // This node performs a computation
      input: ComputationNode(
        function: (int x) => x * 2, // this is the function used for computation
        parent: ValueSourceNode(21), // this is the root value
      ),
    );
  }
}
