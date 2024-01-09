import '/components/helps_map/helps_map_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'help_requests_widget.dart' show HelpRequestsWidget;
import 'package:flutter/material.dart';

class HelpRequestsModel extends FlutterFlowModel<HelpRequestsWidget> {
  ///  Local state fields for this page.

  DocumentReference? highlightedRequest;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HelpsMap component.
  late HelpsMapModel helpsMapModel1;
  // Model for HelpsMap component.
  late HelpsMapModel helpsMapModel2;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // State field(s) for MyRequestSwitch widget.
  bool? myRequestSwitchValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    helpsMapModel1 = createModel(context, () => HelpsMapModel());
    helpsMapModel2 = createModel(context, () => HelpsMapModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    helpsMapModel1.dispose();
    helpsMapModel2.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
