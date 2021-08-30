import 'package:meta/meta.dart';

import '../../exceptions.dart';
import '../../computation_engine/nodes/node.dart';

import 'node_value.dart';

/// A [Node] in the [ComputationEngine] tree that does not produce any output
///
/// A TerminalNode is a node in the computation graph that has no other parents
/// to consume data.
/// It is useful for writing output to the screen or to a file in the disk.
class TerminalNode extends Node {
  @override
  @nonVirtual
  NodeValue pullAndReturn() {
    throw SinkNodeCannotCollectException(
        'Trying to collect from a terminal node, maybe you used it as a child of another node?');
  }
}
