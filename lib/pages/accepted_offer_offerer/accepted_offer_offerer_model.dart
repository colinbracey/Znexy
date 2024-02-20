import '/components/congratulations_pop/congratulations_pop_widget.dart';
import '/components/offerer_set_completed/offerer_set_completed_widget.dart';
import '/components/requester_set_completed/requester_set_completed_widget.dart';
import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'accepted_offer_offerer_widget.dart' show AcceptedOfferOffererWidget;
import 'package:flutter/material.dart';

class AcceptedOfferOffererModel
    extends FlutterFlowModel<AcceptedOfferOffererWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserRating component.
  late UserRatingModel userRatingModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - updateTrackingStatus] action in Button widget.
  bool? updateTrackingResponse;
  // Model for CongratulationsPop component.
  late CongratulationsPopModel congratulationsPopModel;
  // Model for RequesterSetCompleted component.
  late RequesterSetCompletedModel requesterSetCompletedModel;
  // Model for OffererSetCompleted component.
  late OffererSetCompletedModel offererSetCompletedModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingModel = createModel(context, () => UserRatingModel());
    congratulationsPopModel =
        createModel(context, () => CongratulationsPopModel());
    requesterSetCompletedModel =
        createModel(context, () => RequesterSetCompletedModel());
    offererSetCompletedModel =
        createModel(context, () => OffererSetCompletedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userRatingModel.dispose();
    congratulationsPopModel.dispose();
    requesterSetCompletedModel.dispose();
    offererSetCompletedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
