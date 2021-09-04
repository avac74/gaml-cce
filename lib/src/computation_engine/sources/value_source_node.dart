import '../../../computation_engine.dart';

/// A [SourceNode] that stores a value of type T
class ValueSourceNode<T> extends SourceNode<T> {
  final T _value;

  ValueSourceNode(
    /// The [value] to be stored in this [Node]
    T value,
  ) : _value = value;

  @override
  NodeValue<T> recompute() {
    return NodeValue(_value);
  }
}
