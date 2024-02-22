import '/components/user_rating_large_output/user_rating_large_output_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_reviews_widget.dart' show UsersReviewsWidget;
import 'package:flutter/material.dart';

class UsersReviewsModel extends FlutterFlowModel<UsersReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserRatingLargeOutput component.
  late UserRatingLargeOutputModel userRatingLargeOutputModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingLargeOutputModel =
        createModel(context, () => UserRatingLargeOutputModel());
  }

  @override
  void dispose() {
    userRatingLargeOutputModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
