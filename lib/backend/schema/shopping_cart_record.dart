import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShoppingCartRecord extends FirestoreRecord {
  ShoppingCartRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "OfferId" field.
  DocumentReference? _offerId;
  DocumentReference? get offerId => _offerId;
  bool hasOfferId() => _offerId != null;

  // "RequestId" field.
  DocumentReference? _requestId;
  DocumentReference? get requestId => _requestId;
  bool hasRequestId() => _requestId != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  void _initializeFields() {
    _userId = snapshotData['UserId'] as DocumentReference?;
    _offerId = snapshotData['OfferId'] as DocumentReference?;
    _requestId = snapshotData['RequestId'] as DocumentReference?;
    _value = castToType<double>(snapshotData['Value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ShoppingCart');

  static Stream<ShoppingCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShoppingCartRecord.fromSnapshot(s));

  static Future<ShoppingCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShoppingCartRecord.fromSnapshot(s));

  static ShoppingCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShoppingCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShoppingCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShoppingCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShoppingCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShoppingCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShoppingCartRecordData({
  DocumentReference? userId,
  DocumentReference? offerId,
  DocumentReference? requestId,
  double? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserId': userId,
      'OfferId': offerId,
      'RequestId': requestId,
      'Value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShoppingCartRecordDocumentEquality
    implements Equality<ShoppingCartRecord> {
  const ShoppingCartRecordDocumentEquality();

  @override
  bool equals(ShoppingCartRecord? e1, ShoppingCartRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.offerId == e2?.offerId &&
        e1?.requestId == e2?.requestId &&
        e1?.value == e2?.value;
  }

  @override
  int hash(ShoppingCartRecord? e) => const ListEquality()
      .hash([e?.userId, e?.offerId, e?.requestId, e?.value]);

  @override
  bool isValidKey(Object? o) => o is ShoppingCartRecord;
}
