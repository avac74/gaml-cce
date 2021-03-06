import '../../computation_engine/nodes/node.dart';
import '../../computation_engine/nodes/node_value.dart';

/// A [Node] that is used as a data source in the computation [Pipeline]
///
/// This can be used, for example, to read files from disk or to just start
/// a computation from a variable of type T
class SourceNode<T> extends Node<T> {
  @override
  NodeValue<T> recompute() {
    throw UnimplementedError(
        'You must implement the `recompute` method for SourceNode');
  }
}
