import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'no_bids_yet_model.dart';
export 'no_bids_yet_model.dart';

class NoBidsYetWidget extends StatefulWidget {
  const NoBidsYetWidget({super.key});

  @override
  State<NoBidsYetWidget> createState() => _NoBidsYetWidgetState();
}

class _NoBidsYetWidgetState extends State<NoBidsYetWidget> {
  late NoBidsYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoBidsYetModel());

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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1703197123664.json',
            width: 187.0,
            height: 187.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Text(
          'No Bids received yet',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
