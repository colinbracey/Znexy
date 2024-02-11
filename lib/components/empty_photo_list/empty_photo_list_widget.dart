import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_photo_list_model.dart';
export 'empty_photo_list_model.dart';

class EmptyPhotoListWidget extends StatefulWidget {
  const EmptyPhotoListWidget({super.key});

  @override
  State<EmptyPhotoListWidget> createState() => _EmptyPhotoListWidgetState();
}

class _EmptyPhotoListWidgetState extends State<EmptyPhotoListWidget> {
  late EmptyPhotoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPhotoListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
          child: Icon(
            Icons.image_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 40.0,
          ),
        ),
        Text(
          'No Images Uploaded',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
