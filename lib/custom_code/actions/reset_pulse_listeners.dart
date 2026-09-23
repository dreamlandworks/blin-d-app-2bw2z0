// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'dart:async';
import '/custom_code/actions/setup_pulse_listener.dart';
import '/custom_code/actions/setup_f_c_m_listener.dart';

Future resetPulseListeners() async {
  for (final subscription in pulseSubscriptions) {
    await subscription.cancel();
  }

  pulseSubscriptions.clear();
  pulseListenersStarted = false;
  pulseListenersUid = null;

  for (final subscription in fcmSubscriptions) {
    await subscription.cancel();
  }

  fcmSubscriptions.clear();
  fcmListenerStarted = false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
