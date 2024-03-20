import '/components/destination/destination_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_destination_widget.dart' show ChooseDestinationWidget;
import 'package:flutter/material.dart';

class ChooseDestinationModel extends FlutterFlowModel<ChooseDestinationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Destination component.
  late DestinationModel destinationModel1;
  // Model for Destination component.
  late DestinationModel destinationModel2;
  // Model for Destination component.
  late DestinationModel destinationModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    destinationModel1 = createModel(context, () => DestinationModel());
    destinationModel2 = createModel(context, () => DestinationModel());
    destinationModel3 = createModel(context, () => DestinationModel());
  }

  @override
  void dispose() {
    destinationModel1.dispose();
    destinationModel2.dispose();
    destinationModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
