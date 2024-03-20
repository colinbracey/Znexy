import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'insert_help_widget.dart' show InsertHelpWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class InsertHelpModel extends FlutterFlowModel<InsertHelpWidget> {
  ///  Local state fields for this page.

  int pageNumber = 1;

  bool isRecording = false;

  bool isShowPlayer = false;

  bool isAudioUploaded = false;

  bool isTimePicked = false;

  bool isAsapPicked = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for RequestPageView widget.
  PageController? requestPageViewController;

  int get requestPageViewCurrentIndex => requestPageViewController != null &&
          requestPageViewController!.hasClients &&
          requestPageViewController!.page != null
      ? requestPageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  AudioRecorder? audioRecorder;
  String? recording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  DateTime? datePicked;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];
  List<String> uploadedFileUrls3 = [];

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldController;
  String? Function(BuildContext, String?)? priceFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
