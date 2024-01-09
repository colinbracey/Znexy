import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helps_map_model.dart';
export 'helps_map_model.dart';

class HelpsMapWidget extends StatefulWidget {
  const HelpsMapWidget({super.key});

  @override
  _HelpsMapWidgetState createState() => _HelpsMapWidgetState();
}

class _HelpsMapWidgetState extends State<HelpsMapWidget> {
  late HelpsMapModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpsMapModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF609F0),
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        StreamBuilder<List<RequestRecord>>(
          stream: queryRequestRecord(),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFF609F0),
                    ),
                  ),
                ),
              );
            }
            List<RequestRecord> googleMapRequestRecordList = snapshot.data!;
            return FlutterFlowGoogleMap(
              controller: _model.googleMapsController,
              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              initialLocation: _model.googleMapsCenter ??= isWeb == true
                  ? FFAppState().kelowna!
                  : currentUserLocationValue!,
              markers: googleMapRequestRecordList
                  .map(
                    (googleMapRequestRecord) => FlutterFlowMarker(
                      googleMapRequestRecord.reference.path,
                      googleMapRequestRecord.location!,
                      () async {
                        FFAppState().update(() {
                          FFAppState().highlightedRequestRef =
                              googleMapRequestRecord.reference;
                        });
                      },
                    ),
                  )
                  .toList(),
              markerColor: GoogleMarkerColor.magenta,
              mapType: MapType.normal,
              style: GoogleMapStyle.standard,
              initialZoom: 12.0,
              allowInteraction: true,
              allowZoom: true,
              showZoomControls: true,
              showLocation: true,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: true,
              centerMapOnMarkerTap: true,
            );
          },
        ),
      ],
    );
  }
}
