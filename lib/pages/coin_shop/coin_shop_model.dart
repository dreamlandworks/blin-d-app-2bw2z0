import '/components/coin_pack_widget.dart';
import '/components/task_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coin_shop_widget.dart' show CoinShopWidget;
import 'package:flutter/material.dart';

class CoinShopModel extends FlutterFlowModel<CoinShopWidget> {
  ///  Local state fields for this page.

  int? selected = 1;

  ///  State fields for stateful widgets in this page.

  // Model for CoinPack component.
  late CoinPackModel coinPackModel1;
  // Stores action output result for [Razorpay Payment] action in CoinPack widget.
  String? razorpayPaymentId1;
  // Model for CoinPack component.
  late CoinPackModel coinPackModel2;
  // Stores action output result for [Razorpay Payment] action in CoinPack widget.
  String? razorpayPaymentId2;
  // Model for CoinPack component.
  late CoinPackModel coinPackModel3;
  // Stores action output result for [Razorpay Payment] action in CoinPack widget.
  String? razorpayPaymentId3;
  // Model for CoinPack component.
  late CoinPackModel coinPackModel4;
  // Stores action output result for [Razorpay Payment] action in CoinPack widget.
  String? razorpayPaymentId4;
  // Model for TaskItem component.
  late TaskItemModel taskItemModel1;
  // Model for TaskItem component.
  late TaskItemModel taskItemModel2;
  // Model for TaskItem component.
  late TaskItemModel taskItemModel3;

  @override
  void initState(BuildContext context) {
    coinPackModel1 = createModel(context, () => CoinPackModel());
    coinPackModel2 = createModel(context, () => CoinPackModel());
    coinPackModel3 = createModel(context, () => CoinPackModel());
    coinPackModel4 = createModel(context, () => CoinPackModel());
    taskItemModel1 = createModel(context, () => TaskItemModel());
    taskItemModel2 = createModel(context, () => TaskItemModel());
    taskItemModel3 = createModel(context, () => TaskItemModel());
  }

  @override
  void dispose() {
    coinPackModel1.dispose();
    coinPackModel2.dispose();
    coinPackModel3.dispose();
    coinPackModel4.dispose();
    taskItemModel1.dispose();
    taskItemModel2.dispose();
    taskItemModel3.dispose();
  }
}
