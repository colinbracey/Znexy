// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleMapObjectStruct extends FFFirebaseStruct {
  GoogleMapObjectStruct({
    DocumentReference? requestId,
    String? name,
    String? description,
    LatLng? latlng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _requestId = requestId,
        _name = name,
        _description = description,
        _latlng = latlng,
        super(firestoreUtilData);

  // "RequestId" field.
  DocumentReference? _requestId;
  DocumentReference? get requestId => _requestId;
  set requestId(DocumentReference? val) => _requestId = val;
  bool hasRequestId() => _requestId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;
  bool hasLatlng() => _latlng != null;

  static GoogleMapObjectStruct fromMap(Map<String, dynamic> data) =>
      GoogleMapObjectStruct(
        requestId: data['RequestId'] as DocumentReference?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        latlng: data['latlng'] as LatLng?,
      );

  static GoogleMapObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleMapObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'RequestId': _requestId,
        'name': _name,
        'description': _description,
        'latlng': _latlng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'RequestId': serializeParam(
          _requestId,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static GoogleMapObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoogleMapObjectStruct(
        requestId: deserializeParam(
          data['RequestId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Request'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'GoogleMapObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoogleMapObjectStruct &&
        requestId == other.requestId &&
        name == other.name &&
        description == other.description &&
        latlng == other.latlng;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([requestId, name, description, latlng]);
}

GoogleMapObjectStruct createGoogleMapObjectStruct({
  DocumentReference? requestId,
  String? name,
  String? description,
  LatLng? latlng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoogleMapObjectStruct(
      requestId: requestId,
      name: name,
      description: description,
      latlng: latlng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoogleMapObjectStruct? updateGoogleMapObjectStruct(
  GoogleMapObjectStruct? googleMapObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    googleMapObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoogleMapObjectStructData(
  Map<String, dynamic> firestoreData,
  GoogleMapObjectStruct? googleMapObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (googleMapObject == null) {
    return;
  }
  if (googleMapObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && googleMapObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final googleMapObjectData =
      getGoogleMapObjectFirestoreData(googleMapObject, forFieldValue);
  final nestedData =
      googleMapObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = googleMapObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoogleMapObjectFirestoreData(
  GoogleMapObjectStruct? googleMapObject, [
  bool forFieldValue = false,
]) {
  if (googleMapObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(googleMapObject.toMap());

  // Add any Firestore field values
  googleMapObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoogleMapObjectListFirestoreData(
  List<GoogleMapObjectStruct>? googleMapObjects,
) =>
    googleMapObjects
        ?.map((e) => getGoogleMapObjectFirestoreData(e, true))
        .toList() ??
    [];
