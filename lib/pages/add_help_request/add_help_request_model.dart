import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_help_request_widget.dart' show AddHelpRequestWidget;
import 'package:flutter/material.dart';

class AddHelpRequestModel extends FlutterFlowModel<AddHelpRequestWidget> {
  ///  Local state fields for this page.

  LatLng? kelowna;

  bool openPrice = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ShortDescription widget.
  FocusNode? shortDescriptionFocusNode;
  TextEditingController? shortDescriptionController;
  String? Function(BuildContext, String?)? shortDescriptionControllerValidator;
  // State field(s) for LongDescription widget.
  FocusNode? longDescriptionFocusNode;
  TextEditingController? longDescriptionController;
  String? Function(BuildContext, String?)? longDescriptionControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldController;
  String? Function(BuildContext, String?)? priceFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestRecord? newRequestId;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    shortDescriptionFocusNode?.dispose();
    shortDescriptionController?.dispose();

    longDescriptionFocusNode?.dispose();
    longDescriptionController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
