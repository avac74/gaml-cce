import 'node_value.dart';

/// A node in the [ComputationEngine] tree
abstract class Node<T> {
  /// Pulls a value from upstream and returns it
  NodeValue<T> recompute();
}
