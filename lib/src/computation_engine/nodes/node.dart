import 'node_value.dart';

/// A node in the [ComputationEngine] tree
abstract class Node<T> {
  /// Recomputes the node value
  NodeValue<T> recompute() {
    return pullAndReturn();
  }

  /// Pulls a value from upstream and returns it
  NodeValue<T> pullAndReturn();
}
