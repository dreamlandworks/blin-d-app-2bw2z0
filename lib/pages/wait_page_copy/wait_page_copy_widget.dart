import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'wait_page_copy_model.dart';
export 'wait_page_copy_model.dart';

class WaitPageCopyWidget extends StatefulWidget {
  const WaitPageCopyWidget({super.key});

  static String routeName = 'waitPageCopy';
  static String routePath = '/waitPageCopy';

  @override
  State<WaitPageCopyWidget> createState() => _WaitPageCopyWidgetState();
}

class _WaitPageCopyWidgetState extends State<WaitPageCopyWidget> {
  late WaitPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitPageCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      safeSetState(() => _model.lottieAnimationStatus = false);
      _model.responseChatSync = await actions.checkForMissedChatSync(
        currentUserReference!.id,
      );
      if (!mounted) return;
      await actions.setupFCMListener(
        context,
      );

      if (FFAppState().fcmHandShake != '') {
        if (!mounted) return;
        context.pushNamed(
          HandshakePageWidget.routeName,
          queryParameters: {
            'handshakeID': serializeParam(
              FFAppState().fcmHandShake,
              ParamType.String,
            ),
            'slotFolder': serializeParam(
              FFAppState().fcmSlotID,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      } else {
        await actions.setupPulseListener(
          currentUserReference!.id,
        );
        await Future.delayed(
          const Duration(
            milliseconds: 500,
          ),
        );
        if (FFAppState().currentPulse ==
            functions.getTimestampFromFirestoreString(
                currentUserDocument?.updatedAt?.toString())) {
          await actions.mirrorMatchingDataToRTDB(
            currentUserReference,
            currentUserReference!.id,
            FFAppState().currentPulse,
          );
          await actions.rtdbToAppState(
            currentUserReference!.id,
          );
          if (!mounted) return;
          context.pushNamed(DashboardWidget.routeName);
        } else {
          if (currentUserDisplayName != '') {
            await actions.mirrorMatchingDataToRTDB(
              currentUserReference,
              currentUserReference!.id,
              FFAppState().currentPulse,
            );
            await actions.rtdbToAppState(
              currentUserReference!.id,
            );
            if (!mounted) return;
            context.pushNamed(DashboardWidget.routeName);
          } else {
            _model.apiResulthly = await LocationAPICall.call(
              latlng: functions.convertToString(currentUserLocationValue!),
            );

            if ((_model.apiResulthly?.succeeded ?? true)) {
              FFAppState().userLocation = LocationAPICall.users(
                (_model.apiResulthly?.jsonBody ?? ''),
              )!
                  .firstOrNull!;
              safeSetState(() {});
            } else {
              await requestPermission(locationPermission);
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    (_model.apiResulthly?.statusCode ?? 200).toString(),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            }
            if (!mounted) return;
            context.pushNamed(
              OnboardingWidget.routeName,
              queryParameters: {
                'userLocation': serializeParam(
                  LocationAPICall.users(
                    (_model.apiResulthly?.jsonBody ?? ''),
                  )?.firstOrNull,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          }
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
