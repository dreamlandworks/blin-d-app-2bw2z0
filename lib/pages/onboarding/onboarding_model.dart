import '/backend/api_requests/api_calls.dart';
import '/components/interested_chip_widget.dart';
import '/components/pref_card_widget.dart';
import '/components/stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  String lookingFor = 'casual';

  String? localpath;

  String? userLocation;

  DateTime? dateSelected;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (LocationAPI)] action in onboarding widget.
  ApiCallResponse? apiResulthly;
  bool isDataUploading_uploadDataPhotoRaw = false;
  FFUploadedFile uploadedLocalFile_uploadDataPhotoRaw =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - generateThumbnail] action in Container widget.
  FFUploadedFile? thumbFile;
  // Stores action output result for [Custom Action - saveImageLocally] action in Container widget.
  String? thumbUrl;
  // Stores action output result for [Custom Action - saveImageLocally] action in Container widget.
  String? localPath;
  // Stores action output result for [Custom Action - uploadToFirebase] action in Container widget.
  String? gcsUrl;
  // Stores action output result for [Custom Action - uploadToFirebase] action in Container widget.
  String? gcsThumbUrl;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Models for StatPill dynamic component.
  late FlutterFlowDynamicModels<StatPillModel> statPillModels;
  // Models for interested_chip dynamic component.
  late FlutterFlowDynamicModels<InterestedChipModel> interestedChipModels;
  // Model for pref_card component.
  late PrefCardModel prefCardModel1;
  // Model for pref_card component.
  late PrefCardModel prefCardModel2;
  // Model for pref_card component.
  late PrefCardModel prefCardModel3;

  @override
  void initState(BuildContext context) {
    statPillModels = FlutterFlowDynamicModels(() => StatPillModel());
    interestedChipModels =
        FlutterFlowDynamicModels(() => InterestedChipModel());
    prefCardModel1 = createModel(context, () => PrefCardModel());
    prefCardModel2 = createModel(context, () => PrefCardModel());
    prefCardModel3 = createModel(context, () => PrefCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    statPillModels.dispose();
    interestedChipModels.dispose();
    prefCardModel1.dispose();
    prefCardModel2.dispose();
    prefCardModel3.dispose();
  }
}
