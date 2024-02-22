import '/components/user_rating_large_output/user_rating_large_output_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    userRatingLargeOutputModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
