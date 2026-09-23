import 'dart:convert';
import 'dart:js_interop';

import 'razorpay_checkout_base.dart';

@JS('handleWebCheckoutResponse')
external set handleWebCheckoutResponse(JSFunction f);

@JS('checkout')
external void checkoutWeb(JSString optionsStr);

class RazorpayCheckout extends RazorpayCheckoutBase {
  @override
  void checkout(
    Map<String, dynamic> options,
    Function(String) webCheckoutResponse,
  ) async {
    handleWebCheckoutResponse = ((JSString data) {
      webCheckoutResponse(data.toDart);
    }).toJS;
    checkoutWeb(jsonEncode(options).toJS);
  }
}
