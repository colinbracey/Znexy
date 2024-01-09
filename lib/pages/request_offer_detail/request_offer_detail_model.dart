import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_offer_detail_widget.dart' show RequestOfferDetailWidget;
import 'package:flutter/material.dart';

class RequestOfferDetailModel
    extends FlutterFlowModel<RequestOfferDetailWidget> {
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
