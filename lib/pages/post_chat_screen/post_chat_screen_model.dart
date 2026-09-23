import '/components/feedback_tag_widget.dart';
import '/components/metric_stat_widget.dart';
import '/components/rating_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'post_chat_screen_widget.dart' show PostChatScreenWidget;
import 'package:flutter/material.dart';

class PostChatScreenModel extends FlutterFlowModel<PostChatScreenWidget> {
  ///  Local state fields for this page.

  String selectedVibe = 'fire';

  List<String> stoodOut = [];
  void addToStoodOut(String item) => stoodOut.add(item);
  void removeFromStoodOut(String item) => stoodOut.remove(item);
  void removeAtIndexFromStoodOut(int index) => stoodOut.removeAt(index);
  void insertAtIndexInStoodOut(int index, String item) =>
      stoodOut.insert(index, item);
  void updateStoodOutAtIndex(int index, Function(String) updateFn) =>
      stoodOut[index] = updateFn(stoodOut[index]);

  String? feedback;

  ///  State fields for stateful widgets in this page.

  // Model for MetricStat component.
  late MetricStatModel metricStatModel1;
  // Model for MetricStat component.
  late MetricStatModel metricStatModel2;
  // Model for MetricStat component.
  late MetricStatModel metricStatModel3;
  // Model for RatingChip component.
  late RatingChipModel ratingChipModel1;
  // Model for RatingChip component.
  late RatingChipModel ratingChipModel2;
  // Model for RatingChip component.
  late RatingChipModel ratingChipModel3;
  // Model for RatingChip component.
  late RatingChipModel ratingChipModel4;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel1;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel2;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel3;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel4;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel5;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel6;
  // Model for FeedbackTag component.
  late FeedbackTagModel feedbackTagModel7;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - postChatFeedback] action in Button widget.
  bool? feedResp;

  @override
  void initState(BuildContext context) {
    metricStatModel1 = createModel(context, () => MetricStatModel());
    metricStatModel2 = createModel(context, () => MetricStatModel());
    metricStatModel3 = createModel(context, () => MetricStatModel());
    ratingChipModel1 = createModel(context, () => RatingChipModel());
    ratingChipModel2 = createModel(context, () => RatingChipModel());
    ratingChipModel3 = createModel(context, () => RatingChipModel());
    ratingChipModel4 = createModel(context, () => RatingChipModel());
    feedbackTagModel1 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel2 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel3 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel4 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel5 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel6 = createModel(context, () => FeedbackTagModel());
    feedbackTagModel7 = createModel(context, () => FeedbackTagModel());
  }

  @override
  void dispose() {
    metricStatModel1.dispose();
    metricStatModel2.dispose();
    metricStatModel3.dispose();
    ratingChipModel1.dispose();
    ratingChipModel2.dispose();
    ratingChipModel3.dispose();
    ratingChipModel4.dispose();
    feedbackTagModel1.dispose();
    feedbackTagModel2.dispose();
    feedbackTagModel3.dispose();
    feedbackTagModel4.dispose();
    feedbackTagModel5.dispose();
    feedbackTagModel6.dispose();
    feedbackTagModel7.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
