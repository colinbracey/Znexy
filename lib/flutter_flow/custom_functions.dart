import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? calculatePercentageAndFormatAsCurrency(String value) {
// Convert the input string to a double and calculate 10% of the value
  String cleanedValue = value.replaceAll(RegExp(r'[^0-9.]'), '');

  // Convert the cleaned value to double
  double numericValue = double.tryParse(cleanedValue) ?? 0.0;

  return numericValue * 0.10;
}

double calculateWhatUsersWillSeeAsPrice(String price) {
// Remove non-numeric leading characters, commas, and currency symbols
  String cleanedValue = price.replaceAll(RegExp(r'[^0-9.]'), '');

  // Convert the cleaned value to double
  double numericValue = double.tryParse(cleanedValue) ?? 0.0;

  // Calculate the value minus 10%
  return numericValue - (numericValue * 0.10);
}

String? distanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
  String units,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  if (units == "") {
    units = "km";
  }
  var p = 0.017453292519943295;
  const double milesPerKilometer = 0.621371;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));

  // Convert to miles if the unit is "Miles"
  if (units == "mi") {
    result *= milesPerKilometer;
  }
  double roundedNumber = double.parse(result.toStringAsFixed(2));
  return "$roundedNumber " + units;
}

int? multiplyByOneHundred(double value) {
  int result = (value * 100).toInt();
  return result;
}

bool? searchRequestList(
  String? description1,
  String? description2,
  String? searchValue,
  bool checkForMyRequest,
  String? requesterUserId,
  String? myUserId,
) {
  String lowercaseSearchValue = searchValue?.toLowerCase() ?? '';
  String lowercaseDescription1 = description1?.toLowerCase() ?? '';
  String lowercaseDescription2 = description2?.toLowerCase() ?? '';

  bool containsSearchValue =
      lowercaseDescription1.contains(lowercaseSearchValue) ||
          lowercaseDescription2.contains(lowercaseSearchValue);

  if (checkForMyRequest) {
    // Check if userIDs are the same when checkForMyRequest is true
    return containsSearchValue && (requesterUserId == myUserId);
  }

  // If checkForMyRequest is false, return the result of the basic check
  return containsSearchValue;
}

String offerStatus(int statusId) {
  switch (statusId) {
    case 1:
      return 'New Offer';
    case 2:
      return 'Updated';
    case 3:
      return 'Cancelled';
    case 4:
      return 'Accepted';
    case 5:
      return 'Completed';
    default:
      return 'Unknown Status';
  }
}

bool displayTrackingMap(
  TrackOrderRecord trackOrder,
  bool congratulationsShown,
  LatLng? source,
  LatLng? destination,
) {
  if (source == null || destination == null) {
    return false;
  }

  if (congratulationsShown == false) {
    return false;
  }

  if (trackOrder.arrived ||
      trackOrder.workUnderWay ||
      trackOrder.workCompletedOfferer ||
      trackOrder.workCompletedRequester) {
    return false;
  }

  if (trackOrder.headingYourWay) {
    return true;
  }

  // Return true if none of the conditions are met
  return false;
  ;
}

double totalShoppingCartValue(
  List<ShoppingCartRecord>? shoppingCartEntries,
  double percentage,
) {
  // pass List<ShoppingCartRecord> and return the sum of column Value
  double totalValue = 0.0;
  if (shoppingCartEntries != null) {
    for (final entry in shoppingCartEntries) {
      totalValue += entry.value ?? 0.0;
    }
  }

  if (percentage > 0) {
    totalValue = totalValue * (percentage / 100);
  }
  return totalValue;
}

List<OfferRecord>? offersSorted(
  List<OfferRecord>? offers,
  String? sortBy,
) {
  if (offers == null) {
    return null;
  }

// Creating a new list from the original one to avoid modifying it directly
  List<OfferRecord> sortedOfferRecords = List<OfferRecord>.from(offers);

  if (sortBy == 'Price') {
    // Sort by value in descending order
    sortedOfferRecords.sort((a, b) => b.value.compareTo(a.value));
  } else if (sortBy == 'Date') {
    // Sort by created_at in descending order
    sortedOfferRecords.sort((a, b) {
      // Handle nulls: treat null as less than non-null
      if (a.createdAt == null) return 1;
      if (b.createdAt == null) return -1;
      return b.createdAt!.compareTo(a.createdAt!);
    });
  }

  return sortedOfferRecords;
}

int totalShoppingCartValuePlusTax(
    List<ShoppingCartRecord> shoppingCartEntries) {
  double totalValue = 0.0;
  if (shoppingCartEntries != null) {
    for (final entry in shoppingCartEntries) {
      totalValue += entry.value ?? 0.0;
    }
  }

  double pst = totalValue * (7 / 100);
  double gst = totalValue * (5 / 100);
  double znexy = totalValue * (10 / 100);

  totalValue = totalValue + pst + gst + znexy;
  int finalResult =
      (totalValue * 100).toInt(); // Multiply by 100 and convert to int
  return finalResult;
}

double convertStringToDouble(String stringValue) {
  String cleanedValue = stringValue.replaceAll(RegExp(r'[^0-9.]'), '');

  // Convert the cleaned value to double
  return (double.tryParse(cleanedValue) ?? 0.0);
}

double calculateAverageRating(List<int> ratings) {
  if (ratings.isEmpty) {
    return 0.0;
  }

  int sum = ratings.reduce((a, b) => a + b);
  double average = sum / ratings.length;
  return double.parse(average.toStringAsFixed(1));
}

List<RequestRecord> getPlacesMaximumDistance(
  List<RequestRecord> places,
  LatLng userGeo,
  double maxDistance,
) {
  // First create some emptyList
  List<RequestRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;
  // This iterates through the single documents "places" in the List
  for (RequestRecord place in places) {
    double lat2 = place.location!.latitude;
    double lon2 = place.location!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      placesList.insert(listKmIndex, place);
    }
  }
  return placesList;
}

Color workCompletedColor(
  bool? workCompletedOfferer,
  bool? workCompletedReferrer,
) {
  workCompletedOfferer = workCompletedOfferer ?? false;
  workCompletedReferrer = workCompletedReferrer ?? false;

  if (workCompletedOfferer || workCompletedReferrer) {
    return Color.fromRGBO(36, 150, 137, 1);
  } else {
    return Color.fromRGBO(20, 24, 27, 1);
  }
}

bool displayInitialMap(
  TrackOrderRecord trackOrder,
  bool congratulationsShown,
  LatLng? source,
  LatLng? destination,
) {
  if (source == null || destination == null) {
    return false;
  }

  if (congratulationsShown == false) {
    return false;
  }

  // Return false immediately if any condition is met
  if (trackOrder.headingYourWay ||
      trackOrder.arrived ||
      trackOrder.workUnderWay ||
      trackOrder.workCompletedOfferer ||
      trackOrder.workCompletedRequester) {
    return false;
  }

  // Return true if none of the conditions are met
  return true;
}

double totalCredits(List<double>? transactions) {
  // calculate sum  of list of doubles
  if (transactions == null || transactions.isEmpty) {
    return 0.0;
  }
  return transactions.reduce((a, b) => a + b);
}

LatLng getLastDriverLocation(List<LatLng> positions) {
  return positions.last;
}

String bidsReceivedText(int bids) {
  // pass in 'bids' if 0 return 'no bids yet' otherwise return number of bids and "yet"
  if (bids == 0) {
    return 'No bids yet';
  } else {
    if (bids == 1) {
      return '1 bid received';
    } else {
      return '$bids bids received';
    }
  }
}

double calculateNewAverageRating(
  double oldAverage,
  int numberOfRatings,
  double newRating,
) {
  double updatedAverage =
      ((oldAverage * numberOfRatings) + newRating) / (numberOfRatings + 1);
  double roundedAverage = double.parse(updatedAverage.toStringAsFixed(1));
  return roundedAverage;
}

double calculateAvailableBalance(List<double>? values) {
  double totalValue = 0.0;
  // Check if the list itself is not null
  if (values != null) {
    for (var value in values) {
      // Add value to totalValue, considering it could be null
      if (value != null) {
        totalValue += value;
      }
    }
  }
  // Round the total value to 2 decimal places
  return double.parse(totalValue.toStringAsFixed(2));
}

List<RequestRecord>? newCustomFunction(List<RequestRecord>? originalList) {
  // accept simple query list of documents, return list of documents
  return originalList;
}
