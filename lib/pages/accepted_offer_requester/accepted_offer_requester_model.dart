import '/components/offerer_set_offer_completed/offerer_set_offer_completed_widget.dart';
import '/components/please_leave_review/please_leave_review_widget.dart';
import '/components/requester_offer_set_completed/requester_offer_set_completed_widget.dart';
import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accepted_offer_requester_widget.dart' show AcceptedOfferRequesterWidget;
import 'package:flutter/material.dart';

class AcceptedOfferRequesterModel
    extends FlutterFlowModel<AcceptedOfferRequesterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserRating component.
  late UserRatingModel userRatingModel;
  // Model for OffererSetOfferCompleted component.
  late OffererSetOfferCompletedModel offererSetOfferCompletedModel;
  // Model for PleaseLeaveReview component.
  late PleaseLeaveReviewModel pleaseLeaveReviewModel;
  // Model for RequesterOfferSetCompleted component.
  late RequesterOfferSetCompletedModel requesterOfferSetCompletedModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userRatingModel = createModel(context, () => UserRatingModel());
    offererSetOfferCompletedModel =
        createModel(context, () => OffererSetOfferCompletedModel());
    pleaseLeaveReviewModel =
        createModel(context, () => PleaseLeaveReviewModel());
    requesterOfferSetCompletedModel =
        createModel(context, () => RequesterOfferSetCompletedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userRatingModel.dispose();
    offererSetOfferCompletedModel.dispose();
    pleaseLeaveReviewModel.dispose();
    requesterOfferSetCompletedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
