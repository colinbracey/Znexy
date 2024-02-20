import '/components/user_rating_large/user_rating_large_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserRatingLarge component.
  late UserRatingLargeModel userRatingLargeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingLargeModel = createModel(context, () => UserRatingLargeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userRatingLargeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
