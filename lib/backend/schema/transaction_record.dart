import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionRecord extends FirestoreRecord {
  TransactionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TotalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "ZnexyValue" field.
  double? _znexyValue;
  double get znexyValue => _znexyValue ?? 0.0;
  bool hasZnexyValue() => _znexyValue != null;

  // "CreditCardId" field.
  String? _creditCardId;
  String get creditCardId => _creditCardId ?? '';
  bool hasCreditCardId() => _creditCardId != null;

  // "OfferIds" field.
  List<DocumentReference>? _offerIds;
  List<DocumentReference> get offerIds => _offerIds ?? const [];
  bool hasOfferIds() => _offerIds != null;

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Withdrawn" field.
  bool? _withdrawn;
  bool get withdrawn => _withdrawn ?? false;
  bool hasWithdrawn() => _withdrawn != null;

  // "WithdrawDate" field.
  DateTime? _withdrawDate;
  DateTime? get withdrawDate => _withdrawDate;
  bool hasWithdrawDate() => _withdrawDate != null;

  // "WithdrawCreditCardId" field.
  String? _withdrawCreditCardId;
  String get withdrawCreditCardId => _withdrawCreditCardId ?? '';
  bool hasWithdrawCreditCardId() => _withdrawCreditCardId != null;

  void _initializeFields() {
    _totalValue = castToType<double>(snapshotData['TotalValue']);
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _tax = castToType<double>(snapshotData['Tax']);
    _znexyValue = castToType<double>(snapshotData['ZnexyValue']);
    _creditCardId = snapshotData['CreditCardId'] as String?;
    _offerIds = getDataList(snapshotData['OfferIds']);
    _userId = snapshotData['UserId'] as DocumentReference?;
    _type = snapshotData['Type'] as String?;
    _withdrawn = snapshotData['Withdrawn'] as bool?;
    _withdrawDate = snapshotData['WithdrawDate'] as DateTime?;
    _withdrawCreditCardId = snapshotData['WithdrawCreditCardId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionRecord.fromSnapshot(s));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionRecord.fromSnapshot(s));

  static TransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionRecordData({
  double? totalValue,
  DateTime? createdAt,
  double? tax,
  double? znexyValue,
  String? creditCardId,
  DocumentReference? userId,
  String? type,
  bool? withdrawn,
  DateTime? withdrawDate,
  String? withdrawCreditCardId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TotalValue': totalValue,
      'CreatedAt': createdAt,
      'Tax': tax,
      'ZnexyValue': znexyValue,
      'CreditCardId': creditCardId,
      'UserId': userId,
      'Type': type,
      'Withdrawn': withdrawn,
      'WithdrawDate': withdrawDate,
      'WithdrawCreditCardId': withdrawCreditCardId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionRecordDocumentEquality implements Equality<TransactionRecord> {
  const TransactionRecordDocumentEquality();

  @override
  bool equals(TransactionRecord? e1, TransactionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.totalValue == e2?.totalValue &&
        e1?.createdAt == e2?.createdAt &&
        e1?.tax == e2?.tax &&
        e1?.znexyValue == e2?.znexyValue &&
        e1?.creditCardId == e2?.creditCardId &&
        listEquality.equals(e1?.offerIds, e2?.offerIds) &&
        e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.withdrawn == e2?.withdrawn &&
        e1?.withdrawDate == e2?.withdrawDate &&
        e1?.withdrawCreditCardId == e2?.withdrawCreditCardId;
  }

  @override
  int hash(TransactionRecord? e) => const ListEquality().hash([
        e?.totalValue,
        e?.createdAt,
        e?.tax,
        e?.znexyValue,
        e?.creditCardId,
        e?.offerIds,
        e?.userId,
        e?.type,
        e?.withdrawn,
        e?.withdrawDate,
        e?.withdrawCreditCardId
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionRecord;
}
