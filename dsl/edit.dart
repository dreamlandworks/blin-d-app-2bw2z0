library;

import 'dart:io';

import 'package:flutterflow_ai/flutterflow_ai.dart';

import '../lib/flutterflow_project/schemas.dart' show CustomWidgets;

Future<void> main(List<String> args) async {
  if (Platform.environment['_FF_AI_DSL_LAUNCHER'] != '1') {
    stdout.writeln(
      'Tip: run this through `flutterflow ai run` (validated, faster)',
    );
  }
  final options = _parseCliOptions(args);
  try {
    await flutterFlowAI(
      buildStarterEditFlow,
      apiKey: options.apiKey,
      baseUrl: options.baseUrl,
      projectName: options.projectName,
      projectId: options.projectId,
      findOrCreate: options.findOrCreate,
      allowNewProject: options.allowNewProject,
      dryRun: options.dryRun,
      commitMessage: options.commitMessage,
    );
  } catch (error, stackTrace) {
    stderr.writeln('Error: ${formatFlutterFlowAIError(error, stackTrace: stackTrace)}');
    exit(1);
  }
}

final class _CliOptions {
  const _CliOptions({
    this.apiKey,
    this.baseUrl,
    this.projectName,
    this.projectId,
    this.findOrCreate = false,
    this.allowNewProject = false,
    this.dryRun = false,
    this.commitMessage,
  });

  final String? apiKey;
  final String? baseUrl;
  final String? projectName;
  final String? projectId;
  final bool findOrCreate;
  final bool allowNewProject;
  final bool dryRun;
  final String? commitMessage;
}

_CliOptions _parseCliOptions(List<String> args) {
  String? apiKey;
  String? baseUrl;
  String? projectName;
  String? projectId;
  String? commitMessage;
  var findOrCreate = false;
  var allowNewProject = false;
  var dryRun = false;

  for (var i = 0; i < args.length; i++) {
    final arg = args[i];
    switch (arg) {
      case '--help':
      case '-h':
        _printUsage();
        exit(0);
      case '--api-key':
        apiKey = _requireValue(args, ++i, '--api-key');
      case '--base-url':
        baseUrl = _requireValue(args, ++i, '--base-url');
      case '--project-name':
        projectName = _requireValue(args, ++i, '--project-name');
      case '--project-id':
        projectId = _requireValue(args, ++i, '--project-id');
      case '--commit-message':
        commitMessage = _requireValue(args, ++i, '--commit-message');
      case '--find-or-create':
        findOrCreate = true;
      case '--allow-new-project':
        allowNewProject = true;
      case '--dry-run':
        dryRun = true;
      default:
        stderr.writeln('Unknown option: $arg');
        _printUsage();
        exit(64);
    }
  }

  return _CliOptions(
    apiKey: apiKey,
    baseUrl: baseUrl,
    projectName: projectName,
    projectId: projectId,
    findOrCreate: findOrCreate,
    allowNewProject: allowNewProject,
    dryRun: dryRun,
    commitMessage: commitMessage,
  );
}

String _requireValue(List<String> args, int index, String flag) {
  if (index >= args.length) {
    stderr.writeln('Missing value for $flag.');
    _printUsage();
    exit(64);
  }
  return args[index];
}

void _printUsage() {
  stdout.writeln('''
Run the starter FlutterFlow AI edit flow.

Usage:
  flutterflow ai validate dsl/edit.dart [options]
  flutterflow ai run dsl/edit.dart [options]

Options:
  --api-key <key>           FlutterFlow API key. Defaults to FF_API_KEY.
  --base-url <url>          Override the FlutterFlow API base URL.
  --project-name <name>     Create a new project with this name.
  --project-id <id>         Push into an existing project by ID.
  --find-or-create          Retry by reusing a same-name project before creating.
  --allow-new-project       Bypass the workspace binding guard and create a different project.
  --commit-message <text>   Commit message for the push.
  --dry-run                 Compile and validate without pushing.
  --help, -h                Show this help.
''');
}

String _customCodeAfterHeader(String path) {
  final raw = File(path).readAsStringSync();
  const marker = 'DO NOT REMOVE OR MODIFY THE CODE ABOVE!';
  final idx = raw.indexOf(marker);
  if (idx < 0) {
    return raw.trim();
  }
  return raw.substring(idx + marker.length).trim();
}

void buildStarterEditFlow(App app) {
  app.customAction(
    'expireCooldownIfDue',
    returns: bool_,
    description:
        'Expires cooldown on RTDB and appState when the timer is due. Sets active only if a future slot remains; otherwise inactive and clears leftover slots.',
    code: _customCodeAfterHeader(
      'lib/custom_code/actions/expire_cooldown_if_due.dart',
    ),
  );

  app.editCustomAction('waitForUserAndProfile', (code) {
    code.replaceCode(
      _customCodeAfterHeader(
        'lib/custom_code/actions/wait_for_user_and_profile.dart',
      ),
    );
  });

  app.editCustomAction('rtdbToAppState', (code) {
    code.replaceCode(
      _customCodeAfterHeader(
        'lib/custom_code/actions/rtdb_to_app_state.dart',
      ),
    );
  });

  app.editCustomAction('getActiveSlotIndex', (code) {
    code.replaceCode(
      _customCodeAfterHeader(
        'lib/custom_code/actions/get_active_slot_index.dart',
      ),
    );
  });

  app.editCustomWidget(CustomWidgets.liveEpochTimer, (widget) {
    widget.replaceCode(
      File('lib/custom_code/widgets/live_epoch_timer.dart').readAsStringSync(),
    );
  });
}
