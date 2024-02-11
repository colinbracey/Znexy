import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_detail_widget.dart' show RequestDetailWidget;
import 'package:flutter/material.dart';

class RequestDetailModel extends FlutterFlowModel<RequestDetailWidget> {
  ///  Local state fields for this page.

  String? requestingUserName;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserRating component.
  late UserRatingModel userRatingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingModel = createModel(context, () => UserRatingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userRatingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
