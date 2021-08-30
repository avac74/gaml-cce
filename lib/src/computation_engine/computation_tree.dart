import 'dart:async';
import 'dart:developer';

import 'package:path/path.dart' as p;
import 'package:vm_service/utils.dart';
import 'package:vm_service/vm_service.dart';
import 'package:vm_service/vm_service_io.dart';
import 'package:watcher/watcher.dart';

import '../../computation_engine.dart';

/// The core definition of the computation engine
///
/// The ComputationTree defines the structure of the computation nodes.
/// It also monitors source files for changes. Whenever a file is changed
/// (if in debug mode), source files are reloaded, the tree is rebuilt and
/// nodes are recomputed
abstract class ComputationTree {
  final StreamController<String> _logStreamController =
      StreamController<String>();

  late final VmService _vmService;
  late final VM _vm;

  final String _sourcePath;

  late final bool _isDebugging;

  /// A stream that emits log messages related to the computations in the pipeline
  Stream<String> get logStream => _logStreamController.stream;

  /// Creates a new instance of a [ComputationTree]
  ComputationTree({
    /// The folder to monitor for changes in the source code
    ///
    /// If files are changed in the folder, the [ComputationTree] is rebuilt
    /// and the nodes are recomputed
    String? sourcePath,
  }) : _sourcePath = sourcePath ?? p.current {
    Service.getInfo().then((value) async {
      _logStreamController.add('Got info about the VM service: $value');

      if (value.serverUri != null) {
        _logStreamController.add('Running in debug mode, hot reload available');
        _isDebugging = true;
      } else {
        _isDebugging = false;
      }

      if (_isDebugging) {
        _vmService = await vmServiceConnectUri(
            convertToWebSocketUrl(serviceProtocolUrl: value.serverUri!)
                .toString());

        _logStreamController.add('Getting info about the VM');
        _vm = await _vmService.getVM();
        _logStreamController.add('Got it! The VM name is ${_vm.name}');

        _logStreamController.add('Installing Watcher on folder $_sourcePath');
        Watcher(_sourcePath).events.listen((event) {
          _manageWatcherEvent(event);
        });
        _logStreamController.add('Ready to watch file changes');
      }
    });
  }

  /// Callback that reload the source code and recompute nodes in case of
  /// a modification event
  void _manageWatcherEvent(WatchEvent event) async {
    _logStreamController.add('File ${event.path} had a `${event.type}` event');
    _logStreamController.add('Preparing to reload changes into the VM');

    var report = await _vmService.reloadSources(_vm.isolates!.first.id!);
    _logStreamController.add('Done with result ${report.json}');

    run();
  }

  void run() {
    _logStreamController.add('Starting computation');
    final stopwatch = Stopwatch()..start();
    build().recompute();
    stopwatch.stop();
    _logStreamController.add('Finished computation in ${stopwatch.elapsed}');
  }

  Node build();
}
