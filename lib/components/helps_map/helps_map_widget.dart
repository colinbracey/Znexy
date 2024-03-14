import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'helps_map_model.dart';
export 'helps_map_model.dart';

class HelpsMapWidget extends StatefulWidget {
  const HelpsMapWidget({
    super.key,
    required this.requetsToDisplay,
  });

  final List<RequestRecord>? requetsToDisplay;

  @override
  State<HelpsMapWidget> createState() => _HelpsMapWidgetState();
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
        FlutterFlowGoogleMap(
          controller: _model.googleMapsController,
          onCameraIdle: (latLng) =>
              setState(() => _model.googleMapsCenter = latLng),
          initialLocation: _model.googleMapsCenter ??=
              currentUserLocationValue!,
          markers: (widget.requetsToDisplay
                      ?.map((e) => e.location)
                      .withoutNulls
                      .toList() ??
                  [])
              .map(
                (marker) => FlutterFlowMarker(
                  marker.serialize(),
                  marker,
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
        ),
      ],
    );
  }
}
