import '../nodes/node.dart';
import '../nodes/node_value.dart';

/// A [Node] in the ComputationEngine tree
///
/// It transforms a [parent] of type S into an output of type T
class ComputationNode<S, T> extends Node<T> {
  /// A [Node] of type S that provides the input data for this node
  final Node<S> parent;

  /// A [Function] that transforms an input of type S into an output of type T
  final T Function(S) f;

  /// Creates a new [ComputationNode]
  ComputationNode({
    /// The transformation function S -> T
    required T Function(S x) function,

    /// The input [Node]
    required this.parent,
  }) : f = function;

  /// Pull the value of type S from the [parent] node and returns the output
  /// of type T
  @override
  NodeValue<T> recompute() {
    return parent.recompute().map(f);
  }
}
