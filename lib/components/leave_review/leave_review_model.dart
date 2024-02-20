import '/flutter_flow/flutter_flow_util.dart';
import 'leave_review_widget.dart' show LeaveReviewWidget;
import 'package:flutter/material.dart';

class LeaveReviewModel extends FlutterFlowModel<LeaveReviewWidget> {
  ///  Local state fields for this component.

  String? requestersName;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
