import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'sync_manager_model.dart';
export 'sync_manager_model.dart';

class SyncManagerWidget extends StatefulWidget {
  const SyncManagerWidget({super.key});

  @override
  State<SyncManagerWidget> createState() => _SyncManagerWidgetState();
}

class _SyncManagerWidgetState extends State<SyncManagerWidget> {
  late SyncManagerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncManagerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().currentPulse !=
              (currentUserDocument!.updatedAt!.millisecondsSinceEpoch
                  .toString()
                  .toString())) {
            await actions.rtdbToAppState(
              currentUserReference!.id,
            );
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
