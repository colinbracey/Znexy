import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'help_requests_widget.dart' show HelpRequestsWidget;
import 'package:flutter/material.dart';

class HelpRequestsModel extends FlutterFlowModel<HelpRequestsWidget> {
  ///  Local state fields for this page.

  DocumentReference? highlightedRequest;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMapWide widget.
  LatLng? googleMapWidesCenter;
  final googleMapWidesController = Completer<GoogleMapController>();
  // State field(s) for GoogleMapMobile widget.
  LatLng? googleMapMobilesCenter;
  final googleMapMobilesController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
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
