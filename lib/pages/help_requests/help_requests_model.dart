import '/backend/backend.dart';
import '/components/request_listing_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'help_requests_widget.dart' show HelpRequestsWidget;
import 'package:flutter/material.dart';

class HelpRequestsModel extends FlutterFlowModel<HelpRequestsWidget> {
  ///  Local state fields for this page.

  bool? searchActive = false;

  bool showMap = false;

  bool displaySearchContainer = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchRequests] action in TextField widget.
  List<RequestRecord>? searchAllRequests;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for RequestListing dynamic component.
  late FlutterFlowDynamicModels<RequestListingModel> requestListingModels2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    requestListingModels2 =
        FlutterFlowDynamicModels(() => RequestListingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    requestListingModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
