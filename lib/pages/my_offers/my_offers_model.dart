import '/flutter_flow/flutter_flow_util.dart';
import 'my_offers_widget.dart' show MyOffersWidget;
import 'package:flutter/material.dart';

class MyOffersModel extends FlutterFlowModel<MyOffersWidget> {
  ///  Local state fields for this page.

  DocumentReference? highlightedRequest;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // State field(s) for MyRequestSwitch widget.
  bool? myRequestSwitchValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
