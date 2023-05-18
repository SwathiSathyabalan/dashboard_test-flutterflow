import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'all_skills_struct.g.dart';

abstract class AllSkillsStruct
    implements Built<AllSkillsStruct, AllSkillsStructBuilder> {
  static Serializer<AllSkillsStruct> get serializer =>
      _$allSkillsStructSerializer;

  BuiltList<SkillStruct> get data;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AllSkillsStructBuilder builder) => builder
    ..data = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  AllSkillsStruct._();
  factory AllSkillsStruct([void Function(AllSkillsStructBuilder) updates]) =
      _$AllSkillsStruct;
}

AllSkillsStruct createAllSkillsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllSkillsStruct(
      (a) => a
        ..data = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AllSkillsStruct? updateAllSkillsStruct(
  AllSkillsStruct? allSkills, {
  bool clearUnsetFields = true,
}) =>
    allSkills != null
        ? (allSkills.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAllSkillsStructData(
  Map<String, dynamic> firestoreData,
  AllSkillsStruct? allSkills,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allSkills == null) {
    return;
  }
  if (allSkills.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && allSkills.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allSkillsData = getAllSkillsFirestoreData(allSkills, forFieldValue);
  final nestedData = allSkillsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = allSkills.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAllSkillsFirestoreData(
  AllSkillsStruct? allSkills, [
  bool forFieldValue = false,
]) {
  if (allSkills == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AllSkillsStruct.serializer, allSkills);

  // Add any Firestore field values
  allSkills.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllSkillsListFirestoreData(
  List<AllSkillsStruct>? allSkillss,
) =>
    allSkillss?.map((a) => getAllSkillsFirestoreData(a, true)).toList() ?? [];
