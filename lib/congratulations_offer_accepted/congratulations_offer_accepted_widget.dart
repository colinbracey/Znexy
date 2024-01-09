import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'congratulations_offer_accepted_model.dart';
export 'congratulations_offer_accepted_model.dart';

class CongratulationsOfferAcceptedWidget extends StatefulWidget {
  const CongratulationsOfferAcceptedWidget({super.key});

  @override
  _CongratulationsOfferAcceptedWidgetState createState() =>
      _CongratulationsOfferAcceptedWidgetState();
}

class _CongratulationsOfferAcceptedWidgetState
    extends State<CongratulationsOfferAcceptedWidget> {
  late CongratulationsOfferAcceptedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CongratulationsOfferAcceptedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF142328),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Offer Acccepted',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: const BoxDecoration(),
                child: Lottie.asset(
                  'assets/lottie_animations/Animation_-_1704478341603.json',
                  width: 150.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
