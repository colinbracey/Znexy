import '/flutter_flow/flutter_flow_util.dart';
import 'add_a_bid_widget.dart' show AddABidWidget;
import 'package:flutter/material.dart';

class AddABidModel extends FlutterFlowModel<AddABidWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for offerAmount widget.
  FocusNode? offerAmountFocusNode;
  TextEditingController? offerAmountController;
  String? Function(BuildContext, String?)? offerAmountControllerValidator;
  // State field(s) for offerDescription widget.
  FocusNode? offerDescriptionFocusNode;
  TextEditingController? offerDescriptionController;
  String? Function(BuildContext, String?)? offerDescriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    offerAmountFocusNode?.dispose();
    offerAmountController?.dispose();

    offerDescriptionFocusNode?.dispose();
    offerDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
