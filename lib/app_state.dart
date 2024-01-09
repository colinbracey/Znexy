import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _kelowna = const LatLng(49.8863235, -119.4965917);
  LatLng? get kelowna => _kelowna;
  set kelowna(LatLng? value) {
    _kelowna = value;
  }

  bool _BidClosedWithNoValue = false;
  bool get BidClosedWithNoValue => _BidClosedWithNoValue;
  set BidClosedWithNoValue(bool value) {
    _BidClosedWithNoValue = value;
  }

  DocumentReference? _highlightedRequestRef;
  DocumentReference? get highlightedRequestRef => _highlightedRequestRef;
  set highlightedRequestRef(DocumentReference? value) {
    _highlightedRequestRef = value;
  }

  bool _isMapClicked = false;
  bool get isMapClicked => _isMapClicked;
  set isMapClicked(bool value) {
    _isMapClicked = value;
  }

  bool _RequestFilterIcon = false;
  bool get RequestFilterIcon => _RequestFilterIcon;
  set RequestFilterIcon(bool value) {
    _RequestFilterIcon = value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
