import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_expeience_struct.g.dart';

abstract class AllExpeienceStruct
    implements Built<AllExpeienceStruct, AllExpeienceStructBuilder> {
  static Serializer<AllExpeienceStruct> get serializer =>
      _$allExpeienceStructSerializer;

  BuiltList<ExperienceStruct> get data;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AllExpeienceStructBuilder builder) => builder
    ..data = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  AllExpeienceStruct._();
  factory AllExpeienceStruct(
          [void Function(AllExpeienceStructBuilder) updates]) =
      _$AllExpeienceStruct;
}

AllExpeienceStruct createAllExpeienceStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllExpeienceStruct(
      (a) => a
        ..data = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AllExpeienceStruct? updateAllExpeienceStruct(
  AllExpeienceStruct? allExpeience, {
  bool clearUnsetFields = true,
}) =>
    allExpeience != null
        ? (allExpeience.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAllExpeienceStructData(
  Map<String, dynamic> firestoreData,
  AllExpeienceStruct? allExpeience,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allExpeience == null) {
    return;
  }
  if (allExpeience.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && allExpeience.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allExpeienceData =
      getAllExpeienceFirestoreData(allExpeience, forFieldValue);
  final nestedData =
      allExpeienceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = allExpeience.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAllExpeienceFirestoreData(
  AllExpeienceStruct? allExpeience, [
  bool forFieldValue = false,
]) {
  if (allExpeience == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AllExpeienceStruct.serializer, allExpeience);

  // Add any Firestore field values
  allExpeience.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllExpeienceListFirestoreData(
  List<AllExpeienceStruct>? allExpeiences,
) =>
    allExpeiences?.map((a) => getAllExpeienceFirestoreData(a, true)).toList() ??
    [];
