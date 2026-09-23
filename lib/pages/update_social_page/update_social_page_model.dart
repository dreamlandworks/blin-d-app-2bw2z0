import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'update_social_page_widget.dart' show UpdateSocialPageWidget;
import 'package:flutter/material.dart';

class UpdateSocialPageModel extends FlutterFlowModel<UpdateSocialPageWidget> {
  ///  Local state fields for this page.

  String lookingFor = 'casual';

  String? localpath;

  String? userLocation;

  DateTime? dateSelected;

  ///  State fields for stateful widgets in this page.

  // State field(s) for fb widget.
  FocusNode? fbFocusNode;
  TextEditingController? fbTextController;
  String? Function(BuildContext, String?)? fbTextControllerValidator;
  // State field(s) for insta widget.
  FocusNode? instaFocusNode;
  TextEditingController? instaTextController;
  String? Function(BuildContext, String?)? instaTextControllerValidator;
  // State field(s) for twitter widget.
  FocusNode? twitterFocusNode;
  TextEditingController? twitterTextController;
  String? Function(BuildContext, String?)? twitterTextControllerValidator;
  // State field(s) for tiktok widget.
  FocusNode? tiktokFocusNode;
  TextEditingController? tiktokTextController;
  String? Function(BuildContext, String?)? tiktokTextControllerValidator;
  // State field(s) for spotify widget.
  FocusNode? spotifyFocusNode1;
  TextEditingController? spotifyTextController1;
  String? Function(BuildContext, String?)? spotifyTextController1Validator;
  // State field(s) for spotify widget.
  FocusNode? spotifyFocusNode2;
  TextEditingController? spotifyTextController2;
  String? Function(BuildContext, String?)? spotifyTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fbFocusNode?.dispose();
    fbTextController?.dispose();

    instaFocusNode?.dispose();
    instaTextController?.dispose();

    twitterFocusNode?.dispose();
    twitterTextController?.dispose();

    tiktokFocusNode?.dispose();
    tiktokTextController?.dispose();

    spotifyFocusNode1?.dispose();
    spotifyTextController1?.dispose();

    spotifyFocusNode2?.dispose();
    spotifyTextController2?.dispose();
  }
}
