import '/components/coin_card_widget.dart';
import '/components/timer_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'extend_screen_old_widget.dart' show ExtendScreenOldWidget;
import 'package:flutter/material.dart';

class ExtendScreenOldModel extends FlutterFlowModel<ExtendScreenOldWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TimerBadge component.
  late TimerBadgeModel timerBadgeModel;
  // Model for CoinCard component.
  late CoinCardModel coinCardModel1;
  // Model for CoinCard component.
  late CoinCardModel coinCardModel2;
  // Model for CoinCard component.
  late CoinCardModel coinCardModel3;

  @override
  void initState(BuildContext context) {
    timerBadgeModel = createModel(context, () => TimerBadgeModel());
    coinCardModel1 = createModel(context, () => CoinCardModel());
    coinCardModel2 = createModel(context, () => CoinCardModel());
    coinCardModel3 = createModel(context, () => CoinCardModel());
  }

  @override
  void dispose() {
    timerBadgeModel.dispose();
    coinCardModel1.dispose();
    coinCardModel2.dispose();
    coinCardModel3.dispose();
  }
}
