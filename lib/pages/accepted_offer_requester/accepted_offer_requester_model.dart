import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'accepted_offer_requester_widget.dart' show AcceptedOfferRequesterWidget;
import 'package:flutter/material.dart';

class AcceptedOfferRequesterModel
    extends FlutterFlowModel<AcceptedOfferRequesterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isGeolocationEnabled] action in AcceptedOfferRequester widget.
  bool? isGeolocationOn;
  // Stores action output result for [Custom Action - switchOnGeolocation] action in AcceptedOfferRequester widget.
  bool? geolocationSwitchedOn;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - updateTrackingStatus] action in Button widget.
  bool? updateTrackingResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
