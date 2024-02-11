import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'accepted_offer_offerer_copy_widget.dart'
    show AcceptedOfferOffererCopyWidget;
import 'package:flutter/material.dart';

class AcceptedOfferOffererCopyModel
    extends FlutterFlowModel<AcceptedOfferOffererCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserRating component.
  late UserRatingModel userRatingModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - updateTrackingStatus] action in Button widget.
  bool? updateTrackingResponse;

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
