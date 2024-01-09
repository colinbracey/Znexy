import '/components/user_rating_large/user_rating_large_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_reviews_widget.dart' show UsersReviewsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class UsersReviewsModel extends FlutterFlowModel<UsersReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserRatingLarge component.
  late UserRatingLargeModel userRatingLargeModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingLargeModel = createModel(context, () => UserRatingLargeModel());
  }

  @override
  void dispose() {
    userRatingLargeModel.dispose();
    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
