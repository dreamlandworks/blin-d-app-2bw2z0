import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'wait_page_model.dart';
export 'wait_page_model.dart';

class WaitPageWidget extends StatefulWidget {
  const WaitPageWidget({super.key});

  static String routeName = 'waitPage';
  static String routePath = '/waitPage';

  @override
  State<WaitPageWidget> createState() => _WaitPageWidgetState();
}

class _WaitPageWidgetState extends State<WaitPageWidget> {
  late WaitPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.lottieAnimationStatus = false);
      _model.result = await actions.waitForUserAndProfile();
      if (_model.result == 'success') {
        final uid = currentUserReference?.id;
        if (uid == null || uid.isEmpty) {
          if (!mounted) return;
          context.goNamed(DashboardWidget.routeName);
          return;
        }
        try {
          if (!mounted) return;
          await actions.setupFCMListener(
            context,
          );
        } catch (e) {
          debugPrint('WaitPage setupFCMListener error: $e');
        }
        try {
          final userRef = currentUserReference;
          if (userRef != null) {
            await actions.synFCMToken(userRef, null);
          }
        } catch (e) {
          debugPrint('WaitPage synFCMToken error: $e');
        }
        if (!mounted) return;
        try {
          await Future.wait([
            actions.setupPulseListener(
              uid,
            ),
            () async {
              _model.responseChatSync = await actions.checkForMissedChatSync(
                uid,
              );
            }(),
            actions.mirrorMatchingDataToRTDB(
              currentUserReference,
              uid,
              FFAppState().currentPulse,
            ),
          ]);
        } catch (e) {
          debugPrint('WaitPage parallel setup error: $e');
        }
        if (!mounted) return;
        context.goNamed(DashboardWidget.routeName);
      } else {
        if (_model.result == 'auth_failed') {
          if (!mounted) return;
          context.pushNamed(MobileEntryWidget.routeName);
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
