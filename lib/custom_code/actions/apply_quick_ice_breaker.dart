// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future applyQuickIceBreaker(
  BuildContext context,
  String iceBreaker,
) async {
  final text = iceBreaker.trim();
  if (text.isEmpty) {
    return;
  }
  FFAppState().update(() {
    FFAppState().iceBreaker = text;
  });
  if (context.mounted) {
    Navigator.of(context, rootNavigator: true).maybePop();
  }
}
