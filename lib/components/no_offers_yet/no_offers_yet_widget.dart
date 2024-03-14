import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_offers_yet_model.dart';
export 'no_offers_yet_model.dart';

class NoOffersYetWidget extends StatefulWidget {
  const NoOffersYetWidget({super.key});

  @override
  State<NoOffersYetWidget> createState() => _NoOffersYetWidgetState();
}

class _NoOffersYetWidgetState extends State<NoOffersYetWidget> {
  late NoOffersYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoOffersYetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1709183164067.json',
            width: 300.0,
            height: 300.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Text(
          'You haven\'t made any offers yet',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
