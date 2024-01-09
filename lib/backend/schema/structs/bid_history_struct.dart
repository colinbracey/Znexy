// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidHistoryStruct extends FFFirebaseStruct {
  BidHistoryStruct({
    double? amount,
    DateTime? createdAt,
    bool? accepted,
    String? description,
    bool? cancelled,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amount = amount,
        _createdAt = createdAt,
        _accepted = accepted,
        _description = description,
        _cancelled = cancelled,
        super(firestoreUtilData);

  // "Amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  set accepted(bool? val) => _accepted = val;
  bool hasAccepted() => _accepted != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "Cancelled" field.
  bool? _cancelled;
  bool get cancelled => _cancelled ?? false;
  set cancelled(bool? val) => _cancelled = val;
  bool hasCancelled() => _cancelled != null;

  static BidHistoryStruct fromMap(Map<String, dynamic> data) =>
      BidHistoryStruct(
        amount: castToType<double>(data['Amount']),
        createdAt: data['CreatedAt'] as DateTime?,
        accepted: data['Accepted'] as bool?,
        description: data['Description'] as String?,
        cancelled: data['Cancelled'] as bool?,
      );

  static BidHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? BidHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Amount': _amount,
        'CreatedAt': _createdAt,
        'Accepted': _accepted,
        'Description': _description,
        'Cancelled': _cancelled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'CreatedAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'Accepted': serializeParam(
          _accepted,
          ParamType.bool,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Cancelled': serializeParam(
          _cancelled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BidHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      BidHistoryStruct(
        amount: deserializeParam(
          data['Amount'],
          ParamType.double,
          false,
        ),
        createdAt: deserializeParam(
          data['CreatedAt'],
          ParamType.DateTime,
          false,
        ),
        accepted: deserializeParam(
          data['Accepted'],
          ParamType.bool,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        cancelled: deserializeParam(
          data['Cancelled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BidHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BidHistoryStruct &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        accepted == other.accepted &&
        description == other.description &&
        cancelled == other.cancelled;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([amount, createdAt, accepted, description, cancelled]);
}

BidHistoryStruct createBidHistoryStruct({
  double? amount,
  DateTime? createdAt,
  bool? accepted,
  String? description,
  bool? cancelled,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BidHistoryStruct(
      amount: amount,
      createdAt: createdAt,
      accepted: accepted,
      description: description,
      cancelled: cancelled,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BidHistoryStruct? updateBidHistoryStruct(
  BidHistoryStruct? bidHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bidHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBidHistoryStructData(
  Map<String, dynamic> firestoreData,
  BidHistoryStruct? bidHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bidHistory == null) {
    return;
  }
  if (bidHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bidHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bidHistoryData = getBidHistoryFirestoreData(bidHistory, forFieldValue);
  final nestedData = bidHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bidHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBidHistoryFirestoreData(
  BidHistoryStruct? bidHistory, [
  bool forFieldValue = false,
]) {
  if (bidHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bidHistory.toMap());

  // Add any Firestore field values
  bidHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBidHistoryListFirestoreData(
  List<BidHistoryStruct>? bidHistorys,
) =>
    bidHistorys?.map((e) => getBidHistoryFirestoreData(e, true)).toList() ?? [];
