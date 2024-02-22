import '/components/dark_light_switch/dark_light_switch_widget.dart';
import '/components/user_rating_large_output/user_rating_large_output_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for UserRatingLargeOutput component.
  late UserRatingLargeOutputModel userRatingLargeOutputModel;
  // Model for DarkLightSwitch component.
  late DarkLightSwitchModel darkLightSwitchModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingLargeOutputModel =
        createModel(context, () => UserRatingLargeOutputModel());
    darkLightSwitchModel = createModel(context, () => DarkLightSwitchModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userRatingLargeOutputModel.dispose();
    darkLightSwitchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
