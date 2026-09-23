import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'persona_update_page_model.dart';
export 'persona_update_page_model.dart';

class PersonaUpdatePageWidget extends StatefulWidget {
  const PersonaUpdatePageWidget({
    super.key,
    this.handShakeID,
    this.slotFolder,
  });

  final String? handShakeID;
  final String? slotFolder;

  static String routeName = 'PersonaUpdatePage';
  static String routePath = '/personaUpdatePage';

  @override
  State<PersonaUpdatePageWidget> createState() =>
      _PersonaUpdatePageWidgetState();
}

class _PersonaUpdatePageWidgetState extends State<PersonaUpdatePageWidget> {
  late PersonaUpdatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonaUpdatePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Lottie.asset(
                  'assets/jsons/Loading_Bloob.json',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                  animate: true,
                ),
              ),
              Text(
                'Pls wait.. your persona\n is updating',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
