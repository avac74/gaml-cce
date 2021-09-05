import 'package:meta/meta.dart';

import '../../exceptions.dart';
import '../../computation_engine/nodes/node.dart';

import 'node_value.dart';

/// A [Node] in the [ComputationEngine] tree that does not produce any output
///
/// A [TerminalNode] is a node in the computation graph that has no other
/// parents to consume data.
/// A [TerminalNode] should not be part of the [ComputationTree]. It should be
/// used only as a return value from a SinkNode, to indicate to the framework
/// that the bottom of the [ComputationTree] was reached.
class TerminalNode extends Node {
  @override
  @nonVirtual
  NodeValue recompute() {
    throw SinkNodeCannotCollectException(
        'Trying to collect from a terminal node, maybe you used it as a child of another node?');
  }
}
