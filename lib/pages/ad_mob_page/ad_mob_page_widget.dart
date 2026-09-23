import '/components/pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'ad_mob_page_model.dart';
export 'ad_mob_page_model.dart';

class AdMobPageWidget extends StatefulWidget {
  const AdMobPageWidget({super.key});

  static String routeName = 'AdMobPage';
  static String routePath = '/adMobPage';

  @override
  State<AdMobPageWidget> createState() => _AdMobPageWidgetState();
}

class _AdMobPageWidgetState extends State<AdMobPageWidget> {
  late AdMobPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdMobPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().adCountDaily <= 3) {
        admob.loadInterstitialAd(
          "ca-app-pub-8243039024604297~8187563157",
          "ca-app-pub-8243039024604297~5820420113",
          false,
        );

        _model.interstitialAdSuccess = await admob.showInterstitialAd();

        if (_model.interstitialAdSuccess!) {
          FFAppState().adCountDaily = FFAppState().adCountDaily + 1;
          safeSetState(() {});
        } else {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: const PopUpWidget(
                    headLine: 'Error!!',
                    message:
                        'Looks like there is some issue with our servers. Please try again after some time.',
                    confirmTxt: 'Ok',
                    cancel: '',
                  ),
                ),
              );
            },
          );
          if (!mounted) return;
          context.safePop();
        }
      }

      safeSetState(() {});
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

    return genzPage(Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: const SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ),
      ),
    ));
  }
}
