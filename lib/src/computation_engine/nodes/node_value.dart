/// A value that can be produced by a [Node] in the computation [Pipeline]
class NodeValue<T> {
  final T _data;

  T get data => _data;

  /// Creates a new [NodeValue] with data of type T
  NodeValue(T data) : _data = data;

  /// Maps a value of type T into a [NodeValue] of type U using function f
  NodeValue<U> map<U>(U Function(T e) f) {
    return NodeValue(f(_data));
  }

  /// Maps a value of type T into a [NodeValue] of type U using function f
  NodeValue<U> flatMap<U>(NodeValue<U> Function(T e) f) {
    return f(_data);
  }

  @override
  bool operator ==(other) {
    return (other is NodeValue && _data == other._data);
  }

  @override
  int get hashCode => _data.hashCode;

  @override
  String toString() {
    return _data.toString();
  }
}
