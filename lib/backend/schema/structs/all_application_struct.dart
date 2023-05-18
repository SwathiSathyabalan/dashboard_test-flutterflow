import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_application_struct.g.dart';

abstract class AllApplicationStruct
    implements Built<AllApplicationStruct, AllApplicationStructBuilder> {
  static Serializer<AllApplicationStruct> get serializer =>
      _$allApplicationStructSerializer;

  @BuiltValueField(wireName: 'job_application')
  BuiltList<JobApplicationStruct> get jobApplication;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AllApplicationStructBuilder builder) => builder
    ..jobApplication = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  AllApplicationStruct._();
  factory AllApplicationStruct(
          [void Function(AllApplicationStructBuilder) updates]) =
      _$AllApplicationStruct;
}

AllApplicationStruct createAllApplicationStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllApplicationStruct(
      (a) => a
        ..jobApplication = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AllApplicationStruct? updateAllApplicationStruct(
  AllApplicationStruct? allApplication, {
  bool clearUnsetFields = true,
}) =>
    allApplication != null
        ? (allApplication.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAllApplicationStructData(
  Map<String, dynamic> firestoreData,
  AllApplicationStruct? allApplication,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allApplication == null) {
    return;
  }
  if (allApplication.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && allApplication.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allApplicationData =
      getAllApplicationFirestoreData(allApplication, forFieldValue);
  final nestedData =
      allApplicationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = allApplication.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAllApplicationFirestoreData(
  AllApplicationStruct? allApplication, [
  bool forFieldValue = false,
]) {
  if (allApplication == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AllApplicationStruct.serializer, allApplication);

  // Add any Firestore field values
  allApplication.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllApplicationListFirestoreData(
  List<AllApplicationStruct>? allApplications,
) =>
    allApplications
        ?.map((a) => getAllApplicationFirestoreData(a, true))
        .toList() ??
    [];
