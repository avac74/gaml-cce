import '../nodes/node.dart';

import 'computation_node.dart';

/// A [ComputationNode] for which the output is equal to the input
///
/// This is a node that performs no operations, it just copies the input to the
/// output
class Identity<S> extends ComputationNode<S, S> {
  Identity({
    /// The input [Node]
    required Node<S> input,
  }) : super(
          parent: input,
          function: (x) => x,
        );
}
