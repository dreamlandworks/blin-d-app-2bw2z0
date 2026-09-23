import '/components/plan_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'billing_widget.dart' show BillingWidget;
import 'package:flutter/material.dart';

class BillingModel extends FlutterFlowModel<BillingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PlanCard component.
  late PlanCardModel planCardModel1;
  // Model for PlanCard component.
  late PlanCardModel planCardModel2;
  // Stores action output result for [Razorpay Payment] action in PlanCard widget.
  String? razorpayPaymentId;

  @override
  void initState(BuildContext context) {
    planCardModel1 = createModel(context, () => PlanCardModel());
    planCardModel2 = createModel(context, () => PlanCardModel());
  }

  @override
  void dispose() {
    planCardModel1.dispose();
    planCardModel2.dispose();
  }
}
