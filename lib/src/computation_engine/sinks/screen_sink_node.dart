import '../../../computation_engine.dart';
import '../../computation_engine/nodes/node_value.dart';
import '../../computation_engine/nodes/terminal_node.dart';

import 'sink_node.dart';

/// A [SinkNode] that dumps the content of data with type T to the screen
class ScreenSinkNode<T> extends SinkNode<T> {
  ScreenSinkNode({required Node<T> input}) : super(input: input);

  @override
  NodeValue<TerminalNode> recompute() {
    print(input.recompute());
    return NodeValue(TerminalNode());
  }
}
