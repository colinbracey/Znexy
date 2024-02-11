import 'package:collection/collection.dart';

enum RequestStatus {
  NewEntry,
  OfferAccepted,
  Cancelled,
  Complete,
  UnPaid,
  InProgress,
}

enum OfferStatus {
  NewOffer,
  Cancelled,
  Accepted,
  Complete,
}

enum TransactionType {
  CCPayment,
  WorkCredit,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (RequestStatus):
      return RequestStatus.values.deserialize(value) as T?;
    case (OfferStatus):
      return OfferStatus.values.deserialize(value) as T?;
    case (TransactionType):
      return TransactionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
