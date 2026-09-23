// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:image/image.dart' as img;

Future<FFUploadedFile?> generateThumbnail(FFUploadedFile uploadedFile) async {
  if (uploadedFile.bytes == null) return null;

  // Decode the image
  img.Image? image = img.decodeImage(uploadedFile.bytes!);
  if (image == null) return null;

  // Resize to a thumbnail size (e.g., 150px wide)
  img.Image thumbnail = img.copyResize(image, width: 150);

  // Convert back to bytes
  final thumbBytes = img.encodeJpg(thumbnail, quality: 50);

  return FFUploadedFile(
    name: 'thumb_${uploadedFile.name}',
    bytes: Uint8List.fromList(thumbBytes),
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
