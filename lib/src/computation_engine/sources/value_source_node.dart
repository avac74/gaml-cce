import '../../../computation_engine.dart';

/// A [SourceNode] that stores a value of type T
class ValueSourceNode<T> extends SourceNode<T> {
  final T value;

  ValueSourceNode(
    /// The [value] to be stored in this [Node]
    this.value,
  );

  @override
  NodeValue<T> recompute() {
    return NodeValue(value);
  }

  @override
  String toString() {
    return value.toString();
  }
}
