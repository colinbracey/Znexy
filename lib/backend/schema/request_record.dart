import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ShortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "LongDescription" field.
  String? _longDescription;
  String get longDescription => _longDescription ?? '';
  bool hasLongDescription() => _longDescription != null;

  // "CoverImage" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  // "Images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "TotalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "AcceptedUser" field.
  DocumentReference? _acceptedUser;
  DocumentReference? get acceptedUser => _acceptedUser;
  bool hasAcceptedUser() => _acceptedUser != null;

  // "OpenPrice" field.
  bool? _openPrice;
  bool get openPrice => _openPrice ?? false;
  bool hasOpenPrice() => _openPrice != null;

  // "AcceptedOfferId" field.
  DocumentReference? _acceptedOfferId;
  DocumentReference? get acceptedOfferId => _acceptedOfferId;
  bool hasAcceptedOfferId() => _acceptedOfferId != null;

  // "AcceptedPrice" field.
  double? _acceptedPrice;
  double get acceptedPrice => _acceptedPrice ?? 0.0;
  bool hasAcceptedPrice() => _acceptedPrice != null;

  // "Complete" field.
  bool? _complete;
  bool get complete => _complete ?? false;
  bool hasComplete() => _complete != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _shortDescription = snapshotData['ShortDescription'] as String?;
    _longDescription = snapshotData['LongDescription'] as String?;
    _coverImage = snapshotData['CoverImage'] as String?;
    _images = getDataList(snapshotData['Images']);
    _location = snapshotData['Location'] as LatLng?;
    _totalPrice = castToType<double>(snapshotData['TotalPrice']);
    _userId = snapshotData['UserId'] as DocumentReference?;
    _accepted = snapshotData['Accepted'] as bool?;
    _acceptedUser = snapshotData['AcceptedUser'] as DocumentReference?;
    _openPrice = snapshotData['OpenPrice'] as bool?;
    _acceptedOfferId = snapshotData['AcceptedOfferId'] as DocumentReference?;
    _acceptedPrice = castToType<double>(snapshotData['AcceptedPrice']);
    _complete = snapshotData['Complete'] as bool?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  String? shortDescription,
  String? longDescription,
  String? coverImage,
  LatLng? location,
  double? totalPrice,
  DocumentReference? userId,
  bool? accepted,
  DocumentReference? acceptedUser,
  bool? openPrice,
  DocumentReference? acceptedOfferId,
  double? acceptedPrice,
  bool? complete,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ShortDescription': shortDescription,
      'LongDescription': longDescription,
      'CoverImage': coverImage,
      'Location': location,
      'TotalPrice': totalPrice,
      'UserId': userId,
      'Accepted': accepted,
      'AcceptedUser': acceptedUser,
      'OpenPrice': openPrice,
      'AcceptedOfferId': acceptedOfferId,
      'AcceptedPrice': acceptedPrice,
      'Complete': complete,
      'CreatedAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.shortDescription == e2?.shortDescription &&
        e1?.longDescription == e2?.longDescription &&
        e1?.coverImage == e2?.coverImage &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.location == e2?.location &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.userId == e2?.userId &&
        e1?.accepted == e2?.accepted &&
        e1?.acceptedUser == e2?.acceptedUser &&
        e1?.openPrice == e2?.openPrice &&
        e1?.acceptedOfferId == e2?.acceptedOfferId &&
        e1?.acceptedPrice == e2?.acceptedPrice &&
        e1?.complete == e2?.complete &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality().hash([
        e?.shortDescription,
        e?.longDescription,
        e?.coverImage,
        e?.images,
        e?.location,
        e?.totalPrice,
        e?.userId,
        e?.accepted,
        e?.acceptedUser,
        e?.openPrice,
        e?.acceptedOfferId,
        e?.acceptedPrice,
        e?.complete,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
