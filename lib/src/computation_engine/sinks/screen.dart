import '../../../computation_engine.dart';
import '../../computation_engine/nodes/node_value.dart';
import '../../computation_engine/nodes/terminal_node.dart';

import 'sink_node.dart';

/// A [SinkNode] that dumps the content of data with type T to the screen
class Screen<T> extends SinkNode<T> {
  Screen({required Node<T> input}) : super(input: input);

  @override
  NodeValue<TerminalNode> pullAndReturn() {
    print(input.pullAndReturn());
    return NodeValue(TerminalNode());
  }
}
