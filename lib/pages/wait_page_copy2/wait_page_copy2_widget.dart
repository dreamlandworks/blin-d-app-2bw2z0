import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'wait_page_copy2_model.dart';
export 'wait_page_copy2_model.dart';

class WaitPageCopy2Widget extends StatefulWidget {
  const WaitPageCopy2Widget({super.key});

  static String routeName = 'waitPageCopy2';
  static String routePath = '/waitPageCopy2';

  @override
  State<WaitPageCopy2Widget> createState() => _WaitPageCopy2WidgetState();
}

class _WaitPageCopy2WidgetState extends State<WaitPageCopy2Widget> {
  late WaitPageCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitPageCopy2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.lottieAnimationStatus = false);
      await Future.delayed(
        const Duration(
          milliseconds: 1000,
        ),
      );
      if (currentUserReference != null) {
        if (currentUserDisplayName != '') {
          await Future.wait([
            Future(() async {
              unawaited(
                () async {
                  await actions.setupFCMListener(
                    context,
                  );
                }(),
              );
            }),
            Future(() async {
              unawaited(
                () async {
                  await actions.setupPulseListener(
                    currentUserReference!.id,
                  );
                }(),
              );
            }),
            Future(() async {
              unawaited(
                () async {
                  _model.responseChatSync =
                      await actions.checkForMissedChatSync(
                    currentUserReference!.id,
                  );
                }(),
              );
            }),
            Future(() async {
              unawaited(
                () async {
                  await actions.mirrorMatchingDataToRTDB(
                    currentUserReference,
                    currentUserReference!.id,
                    FFAppState().currentPulse,
                  );
                }(),
              );
            }),
          ]);
          if (!mounted) return;
          context.pushNamed(DashboardWidget.routeName);
        } else {
          if (!mounted) return;
          context.pushNamed(OnboardingWidget.routeName);
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return genzPage(GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: const BoxDecoration(),
                  child: Lottie.network(
                    'https://lottie.host/1036aff0-f7ef-41cb-8f40-1e83ea286b7f/Ap3Fr998Ea.json',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
