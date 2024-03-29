import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TrackOrderRecord extends FirestoreRecord {
  TrackOrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "AcceptedDate" field.
  DateTime? _acceptedDate;
  DateTime? get acceptedDate => _acceptedDate;
  bool hasAcceptedDate() => _acceptedDate != null;

  // "HeadingYourWay" field.
  bool? _headingYourWay;
  bool get headingYourWay => _headingYourWay ?? false;
  bool hasHeadingYourWay() => _headingYourWay != null;

  // "HeadingYourWayDate" field.
  DateTime? _headingYourWayDate;
  DateTime? get headingYourWayDate => _headingYourWayDate;
  bool hasHeadingYourWayDate() => _headingYourWayDate != null;

  // "Arrived" field.
  bool? _arrived;
  bool get arrived => _arrived ?? false;
  bool hasArrived() => _arrived != null;

  // "ArrivedDate" field.
  DateTime? _arrivedDate;
  DateTime? get arrivedDate => _arrivedDate;
  bool hasArrivedDate() => _arrivedDate != null;

  // "WorkUnderWay" field.
  bool? _workUnderWay;
  bool get workUnderWay => _workUnderWay ?? false;
  bool hasWorkUnderWay() => _workUnderWay != null;

  // "WorkUnderWayDate" field.
  DateTime? _workUnderWayDate;
  DateTime? get workUnderWayDate => _workUnderWayDate;
  bool hasWorkUnderWayDate() => _workUnderWayDate != null;

  // "Review" field.
  bool? _review;
  bool get review => _review ?? false;
  bool hasReview() => _review != null;

  // "ReviewDate" field.
  DateTime? _reviewDate;
  DateTime? get reviewDate => _reviewDate;
  bool hasReviewDate() => _reviewDate != null;

  // "OfferId" field.
  DocumentReference? _offerId;
  DocumentReference? get offerId => _offerId;
  bool hasOfferId() => _offerId != null;

  // "DriverPositions" field.
  List<LatLng>? _driverPositions;
  List<LatLng> get driverPositions => _driverPositions ?? const [];
  bool hasDriverPositions() => _driverPositions != null;

  // "Source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "Destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "TimeLeft" field.
  String? _timeLeft;
  String get timeLeft => _timeLeft ?? '';
  bool hasTimeLeft() => _timeLeft != null;

  // "DistanceLeft" field.
  String? _distanceLeft;
  String get distanceLeft => _distanceLeft ?? '';
  bool hasDistanceLeft() => _distanceLeft != null;

  // "WorkCompletedOfferer" field.
  bool? _workCompletedOfferer;
  bool get workCompletedOfferer => _workCompletedOfferer ?? false;
  bool hasWorkCompletedOfferer() => _workCompletedOfferer != null;

  // "WorkCompletedDateOfferer" field.
  DateTime? _workCompletedDateOfferer;
  DateTime? get workCompletedDateOfferer => _workCompletedDateOfferer;
  bool hasWorkCompletedDateOfferer() => _workCompletedDateOfferer != null;

  // "WorkCompletedRequester" field.
  bool? _workCompletedRequester;
  bool get workCompletedRequester => _workCompletedRequester ?? false;
  bool hasWorkCompletedRequester() => _workCompletedRequester != null;

  // "WorkCompletedDateRequester" field.
  DateTime? _workCompletedDateRequester;
  DateTime? get workCompletedDateRequester => _workCompletedDateRequester;
  bool hasWorkCompletedDateRequester() => _workCompletedDateRequester != null;

  void _initializeFields() {
    _accepted = snapshotData['Accepted'] as bool?;
    _acceptedDate = snapshotData['AcceptedDate'] as DateTime?;
    _headingYourWay = snapshotData['HeadingYourWay'] as bool?;
    _headingYourWayDate = snapshotData['HeadingYourWayDate'] as DateTime?;
    _arrived = snapshotData['Arrived'] as bool?;
    _arrivedDate = snapshotData['ArrivedDate'] as DateTime?;
    _workUnderWay = snapshotData['WorkUnderWay'] as bool?;
    _workUnderWayDate = snapshotData['WorkUnderWayDate'] as DateTime?;
    _review = snapshotData['Review'] as bool?;
    _reviewDate = snapshotData['ReviewDate'] as DateTime?;
    _offerId = snapshotData['OfferId'] as DocumentReference?;
    _driverPositions = getDataList(snapshotData['DriverPositions']);
    _source = snapshotData['Source'] as LatLng?;
    _destination = snapshotData['Destination'] as LatLng?;
    _timeLeft = snapshotData['TimeLeft'] as String?;
    _distanceLeft = snapshotData['DistanceLeft'] as String?;
    _workCompletedOfferer = snapshotData['WorkCompletedOfferer'] as bool?;
    _workCompletedDateOfferer =
        snapshotData['WorkCompletedDateOfferer'] as DateTime?;
    _workCompletedRequester = snapshotData['WorkCompletedRequester'] as bool?;
    _workCompletedDateRequester =
        snapshotData['WorkCompletedDateRequester'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TrackOrder');

  static Stream<TrackOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrackOrderRecord.fromSnapshot(s));

  static Future<TrackOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrackOrderRecord.fromSnapshot(s));

  static TrackOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrackOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrackOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrackOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrackOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrackOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrackOrderRecordData({
  bool? accepted,
  DateTime? acceptedDate,
  bool? headingYourWay,
  DateTime? headingYourWayDate,
  bool? arrived,
  DateTime? arrivedDate,
  bool? workUnderWay,
  DateTime? workUnderWayDate,
  bool? review,
  DateTime? reviewDate,
  DocumentReference? offerId,
  LatLng? source,
  LatLng? destination,
  String? timeLeft,
  String? distanceLeft,
  bool? workCompletedOfferer,
  DateTime? workCompletedDateOfferer,
  bool? workCompletedRequester,
  DateTime? workCompletedDateRequester,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Accepted': accepted,
      'AcceptedDate': acceptedDate,
      'HeadingYourWay': headingYourWay,
      'HeadingYourWayDate': headingYourWayDate,
      'Arrived': arrived,
      'ArrivedDate': arrivedDate,
      'WorkUnderWay': workUnderWay,
      'WorkUnderWayDate': workUnderWayDate,
      'Review': review,
      'ReviewDate': reviewDate,
      'OfferId': offerId,
      'Source': source,
      'Destination': destination,
      'TimeLeft': timeLeft,
      'DistanceLeft': distanceLeft,
      'WorkCompletedOfferer': workCompletedOfferer,
      'WorkCompletedDateOfferer': workCompletedDateOfferer,
      'WorkCompletedRequester': workCompletedRequester,
      'WorkCompletedDateRequester': workCompletedDateRequester,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrackOrderRecordDocumentEquality implements Equality<TrackOrderRecord> {
  const TrackOrderRecordDocumentEquality();

  @override
  bool equals(TrackOrderRecord? e1, TrackOrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.accepted == e2?.accepted &&
        e1?.acceptedDate == e2?.acceptedDate &&
        e1?.headingYourWay == e2?.headingYourWay &&
        e1?.headingYourWayDate == e2?.headingYourWayDate &&
        e1?.arrived == e2?.arrived &&
        e1?.arrivedDate == e2?.arrivedDate &&
        e1?.workUnderWay == e2?.workUnderWay &&
        e1?.workUnderWayDate == e2?.workUnderWayDate &&
        e1?.review == e2?.review &&
        e1?.reviewDate == e2?.reviewDate &&
        e1?.offerId == e2?.offerId &&
        listEquality.equals(e1?.driverPositions, e2?.driverPositions) &&
        e1?.source == e2?.source &&
        e1?.destination == e2?.destination &&
        e1?.timeLeft == e2?.timeLeft &&
        e1?.distanceLeft == e2?.distanceLeft &&
        e1?.workCompletedOfferer == e2?.workCompletedOfferer &&
        e1?.workCompletedDateOfferer == e2?.workCompletedDateOfferer &&
        e1?.workCompletedRequester == e2?.workCompletedRequester &&
        e1?.workCompletedDateRequester == e2?.workCompletedDateRequester;
  }

  @override
  int hash(TrackOrderRecord? e) => const ListEquality().hash([
        e?.accepted,
        e?.acceptedDate,
        e?.headingYourWay,
        e?.headingYourWayDate,
        e?.arrived,
        e?.arrivedDate,
        e?.workUnderWay,
        e?.workUnderWayDate,
        e?.review,
        e?.reviewDate,
        e?.offerId,
        e?.driverPositions,
        e?.source,
        e?.destination,
        e?.timeLeft,
        e?.distanceLeft,
        e?.workCompletedOfferer,
        e?.workCompletedDateOfferer,
        e?.workCompletedRequester,
        e?.workCompletedDateRequester
      ]);

  @override
  bool isValidKey(Object? o) => o is TrackOrderRecord;
}
