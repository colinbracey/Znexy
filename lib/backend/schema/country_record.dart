import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CountryRecord extends FirestoreRecord {
  CountryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CountryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "DialCode" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  bool hasDialCode() => _dialCode != null;

  // "IsActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _countryCode = snapshotData['CountryCode'] as String?;
    _dialCode = snapshotData['DialCode'] as String?;
    _isActive = snapshotData['IsActive'] as bool?;
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('country');

  static Stream<CountryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountryRecord.fromSnapshot(s));

  static Future<CountryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountryRecord.fromSnapshot(s));

  static CountryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountryRecordData({
  String? countryCode,
  String? dialCode,
  bool? isActive,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CountryCode': countryCode,
      'DialCode': dialCode,
      'IsActive': isActive,
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountryRecordDocumentEquality implements Equality<CountryRecord> {
  const CountryRecordDocumentEquality();

  @override
  bool equals(CountryRecord? e1, CountryRecord? e2) {
    return e1?.countryCode == e2?.countryCode &&
        e1?.dialCode == e2?.dialCode &&
        e1?.isActive == e2?.isActive &&
        e1?.name == e2?.name;
  }

  @override
  int hash(CountryRecord? e) => const ListEquality()
      .hash([e?.countryCode, e?.dialCode, e?.isActive, e?.name]);

  @override
  bool isValidKey(Object? o) => o is CountryRecord;
}
