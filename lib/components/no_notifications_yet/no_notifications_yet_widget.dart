import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'no_notifications_yet_model.dart';
export 'no_notifications_yet_model.dart';

class NoNotificationsYetWidget extends StatefulWidget {
  const NoNotificationsYetWidget({super.key});

  @override
  State<NoNotificationsYetWidget> createState() =>
      _NoNotificationsYetWidgetState();
}

class _NoNotificationsYetWidgetState extends State<NoNotificationsYetWidget> {
  late NoNotificationsYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoNotificationsYetModel());

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
            'assets/lottie_animations/Animation_-_1706220002479.json',
            width: 300.0,
            height: 300.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Text(
          'No notifications yet',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
