// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> shoppingCartTotal(
    List<ShoppingCartRecord> shoppingCartEntries) async {
  double totalValue = 0.0;
  if (shoppingCartEntries != null) {
    for (final entry in shoppingCartEntries) {
      totalValue += entry.value ?? 0.0;
    }
  }

  return totalValue;
}
