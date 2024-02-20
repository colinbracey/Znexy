import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferRecord extends FirestoreRecord {
  OfferRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "RequestId" field.
  DocumentReference? _requestId;
  DocumentReference? get requestId => _requestId;
  bool hasRequestId() => _requestId != null;

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "AcceptedAt" field.
  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _acceptedAt;
  bool hasAcceptedAt() => _acceptedAt != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "LocationMovements" field.
  List<LatLng>? _locationMovements;
  List<LatLng> get locationMovements => _locationMovements ?? const [];
  bool hasLocationMovements() => _locationMovements != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "BidHistory" field.
  List<BidHistoryStruct>? _bidHistory;
  List<BidHistoryStruct> get bidHistory => _bidHistory ?? const [];
  bool hasBidHistory() => _bidHistory != null;

  // "Status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "CongratulationsShown" field.
  bool? _congratulationsShown;
  bool get congratulationsShown => _congratulationsShown ?? false;
  bool hasCongratulationsShown() => _congratulationsShown != null;

  void _initializeFields() {
    _requestId = snapshotData['RequestId'] as DocumentReference?;
    _userId = snapshotData['UserId'] as DocumentReference?;
    _value = castToType<double>(snapshotData['Value']);
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _accepted = snapshotData['Accepted'] as bool?;
    _acceptedAt = snapshotData['AcceptedAt'] as DateTime?;
    _location = snapshotData['Location'] as LatLng?;
    _locationMovements = getDataList(snapshotData['LocationMovements']);
    _description = snapshotData['Description'] as String?;
    _bidHistory = getStructList(
      snapshotData['BidHistory'],
      BidHistoryStruct.fromMap,
    );
    _status = castToType<int>(snapshotData['Status']);
    _congratulationsShown = snapshotData['CongratulationsShown'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Offer');

  static Stream<OfferRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfferRecord.fromSnapshot(s));

  static Future<OfferRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfferRecord.fromSnapshot(s));

  static OfferRecord fromSnapshot(DocumentSnapshot snapshot) => OfferRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfferRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfferRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfferRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfferRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfferRecordData({
  DocumentReference? requestId,
  DocumentReference? userId,
  double? value,
  DateTime? createdAt,
  bool? accepted,
  DateTime? acceptedAt,
  LatLng? location,
  String? description,
  int? status,
  bool? congratulationsShown,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RequestId': requestId,
      'UserId': userId,
      'Value': value,
      'CreatedAt': createdAt,
      'Accepted': accepted,
      'AcceptedAt': acceptedAt,
      'Location': location,
      'Description': description,
      'Status': status,
      'CongratulationsShown': congratulationsShown,
    }.withoutNulls,
  );

  return firestoreData;
}

class OfferRecordDocumentEquality implements Equality<OfferRecord> {
  const OfferRecordDocumentEquality();

  @override
  bool equals(OfferRecord? e1, OfferRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requestId == e2?.requestId &&
        e1?.userId == e2?.userId &&
        e1?.value == e2?.value &&
        e1?.createdAt == e2?.createdAt &&
        e1?.accepted == e2?.accepted &&
        e1?.acceptedAt == e2?.acceptedAt &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.locationMovements, e2?.locationMovements) &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.bidHistory, e2?.bidHistory) &&
        e1?.status == e2?.status &&
        e1?.congratulationsShown == e2?.congratulationsShown;
  }

  @override
  int hash(OfferRecord? e) => const ListEquality().hash([
        e?.requestId,
        e?.userId,
        e?.value,
        e?.createdAt,
        e?.accepted,
        e?.acceptedAt,
        e?.location,
        e?.locationMovements,
        e?.description,
        e?.bidHistory,
        e?.status,
        e?.congratulationsShown
      ]);

  @override
  bool isValidKey(Object? o) => o is OfferRecord;
}
