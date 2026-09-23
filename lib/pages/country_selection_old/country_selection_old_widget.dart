import '/components/country_item_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'country_selection_old_model.dart';
export 'country_selection_old_model.dart';

class CountrySelectionOldWidget extends StatefulWidget {
  const CountrySelectionOldWidget({super.key});

  static String routeName = 'country_selectionOld';
  static String routePath = '/countrySelectionOld';

  @override
  State<CountrySelectionOldWidget> createState() =>
      _CountrySelectionOldWidgetState();
}

class _CountrySelectionOldWidgetState extends State<CountrySelectionOldWidget> {
  late CountrySelectionOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountrySelectionOldModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzPage(Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        icon: Icon(
          Icons.done_rounded,
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        label: Text(
          'Confirm Selection',
          style: GoogleFonts.plusJakartaSans(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 16.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        debugPrint('IconButton pressed ...');
                      },
                    ),
                    Text(
                      'Select Country',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                            lineHeight: 1.3,
                          ),
                    ),
                    Container(
                      width: 48.0,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x1A000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).divider,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).hint,
                          size: 22.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            obscureText: false,
                            decoration: const InputDecoration(
                              hintText: 'Search countries...',
                            ),
                            style: GoogleFonts.spaceGrotesk(),
                            maxLines: null,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FlutterFlowIconButton(
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.tune_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                          onPressed: () {
                            debugPrint('IconButton pressed ...');
                          },
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Choices',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                            lineHeight: 1.3,
                          ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        FlutterFlowChoiceChips(
                          options: const [
                            ChipData('United States', Icons.public),
                            ChipData('United Kingdom', Icons.public),
                            ChipData('India', Icons.public),
                            ChipData('Canada', Icons.public_sharp),
                            ChipData('Australia', Icons.public_sharp)
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.choiceChipsValue = val?.firstOrNull),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            iconColor: FlutterFlowTheme.of(context).info,
                            iconSize: 16.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 16.0,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).hint,
                            borderWidth: 0.5,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          chipSpacing: 8.0,
                          rowSpacing: 8.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'All Countries',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                          ),
                          Text(
                            'A-Z',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: true,
                        flag: '🇺🇸',
                        name: 'United States',
                        code: 1.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇬🇧',
                        name: 'United Kingdom',
                        code: 44.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇨🇦',
                        name: 'Canada',
                        code: 1.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇦🇺',
                        name: 'Australia',
                        code: 61.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇩🇪',
                        name: 'Germany',
                        code: 49.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇫🇷',
                        name: 'France',
                        code: 33.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel7,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇯🇵',
                        name: 'Japan',
                        code: 81.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel8,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇧🇷',
                        name: 'Brazil',
                        code: 55.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel9,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇮🇳',
                        name: 'India',
                        code: 91.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel10,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇰🇷',
                        name: 'South Korea',
                        code: 82.0,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.countryItemModel11,
                      updateCallback: () => safeSetState(() {}),
                      child: const CountryItemWidget(
                        selected: false,
                        flag: '🇲🇽',
                        name: 'Mexico',
                        code: 52.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 32.0,
                ),
              ].divide(const SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
