import '/components/destination/destination_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'choose_destination_model.dart';
export 'choose_destination_model.dart';

class ChooseDestinationWidget extends StatefulWidget {
  const ChooseDestinationWidget({super.key});

  @override
  State<ChooseDestinationWidget> createState() =>
      _ChooseDestinationWidgetState();
}

class _ChooseDestinationWidgetState extends State<ChooseDestinationWidget> {
  late ChooseDestinationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseDestinationModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Text(
                            'Choose Destination',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 30.0,
                        borderWidth: 2.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          unawaited(
                            () async {
                              Navigator.pop(context);
                            }(),
                          );
                        },
                      ),
                    ],
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      wrapWithModel(
                        model: _model.destinationModel1,
                        updateCallback: () => setState(() {}),
                        child: const DestinationWidget(
                          cityNam: 'San Antonio',
                          cityImage:
                              'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/sanantoniotx/San_Antonio_Skyline_2021_Graphic_Designer_Files_8c013beb-1046-40e4-be19-fae36ffca28a.jpg',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.destinationModel2,
                        updateCallback: () => setState(() {}),
                        child: const DestinationWidget(
                          cityNam: 'Dallas',
                          cityImage:
                              'https://upload.wikimedia.org/wikipedia/commons/6/6c/Dallas_view.jpg',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.destinationModel3,
                        updateCallback: () => setState(() {}),
                        child: const DestinationWidget(
                          cityNam: 'El Paso',
                          cityImage:
                              'https://www.redfin.com/blog/wp-content/uploads/2023/03/El-Paso-skyline-GI-1.jpg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
