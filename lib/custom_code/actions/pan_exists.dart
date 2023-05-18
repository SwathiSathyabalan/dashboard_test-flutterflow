// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> panExists(
  String pan,
  String checkCollection,
) async {
  // Add your function code here!
  QuerySnapshot checkSnapshot = await FirebaseFirestore.instance
      .collection(checkCollection)
      .where('pan_number', isEqualTo: pan)
      .get();

  if (checkSnapshot.docs.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
