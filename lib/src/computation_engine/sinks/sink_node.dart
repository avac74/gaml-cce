import '../../computation_engine/nodes/node.dart';
import '../../computation_engine/nodes/node_value.dart';
import '../../computation_engine/nodes/terminal_node.dart';

/// A type of [Node] that consumes the data, potentially providing
/// some sort of visual inspection to the data
class SinkNode<T> extends Node<TerminalNode> {
  final Node<T> input;

  /// Creates a new instance of a [SinkNode]
  SinkNode({
    /// The [input] [Node]
    required this.input,
  });

  @override
  NodeValue<TerminalNode> recompute() {
    throw UnimplementedError(
        'You must implement the `recompute` method in SinkNode');
  }
}
