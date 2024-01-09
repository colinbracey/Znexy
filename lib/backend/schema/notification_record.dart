import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "SenderId" field.
  DocumentReference? _senderId;
  DocumentReference? get senderId => _senderId;
  bool hasSenderId() => _senderId != null;

  // "ReceivedId" field.
  DocumentReference? _receivedId;
  DocumentReference? get receivedId => _receivedId;
  bool hasReceivedId() => _receivedId != null;

  // "Type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "OfferId" field.
  DocumentReference? _offerId;
  DocumentReference? get offerId => _offerId;
  bool hasOfferId() => _offerId != null;

  // "RequestId" field.
  DocumentReference? _requestId;
  DocumentReference? get requestId => _requestId;
  bool hasRequestId() => _requestId != null;

  void _initializeFields() {
    _senderId = snapshotData['SenderId'] as DocumentReference?;
    _receivedId = snapshotData['ReceivedId'] as DocumentReference?;
    _type = castToType<int>(snapshotData['Type']);
    _message = snapshotData['Message'] as String?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _read = snapshotData['Read'] as bool?;
    _offerId = snapshotData['OfferId'] as DocumentReference?;
    _requestId = snapshotData['RequestId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? senderId,
  DocumentReference? receivedId,
  int? type,
  String? message,
  DateTime? createdAt,
  bool? read,
  DocumentReference? offerId,
  DocumentReference? requestId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SenderId': senderId,
      'ReceivedId': receivedId,
      'Type': type,
      'Message': message,
      'CreatedAt': createdAt,
      'Read': read,
      'OfferId': offerId,
      'RequestId': requestId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.senderId == e2?.senderId &&
        e1?.receivedId == e2?.receivedId &&
        e1?.type == e2?.type &&
        e1?.message == e2?.message &&
        e1?.createdAt == e2?.createdAt &&
        e1?.read == e2?.read &&
        e1?.offerId == e2?.offerId &&
        e1?.requestId == e2?.requestId;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.senderId,
        e?.receivedId,
        e?.type,
        e?.message,
        e?.createdAt,
        e?.read,
        e?.offerId,
        e?.requestId
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
