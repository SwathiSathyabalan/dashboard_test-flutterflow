import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'skill_struct.g.dart';

abstract class SkillStruct implements Built<SkillStruct, SkillStructBuilder> {
  static Serializer<SkillStruct> get serializer => _$skillStructSerializer;

  @BuiltValueField(wireName: 'skill_name')
  String? get skillName;

  String? get experience;

  @BuiltValueField(wireName: 'is_primary')
  bool? get isPrimary;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SkillStructBuilder builder) => builder
    ..skillName = ''
    ..experience = ''
    ..isPrimary = false
    ..firestoreUtilData = FirestoreUtilData();

  SkillStruct._();
  factory SkillStruct([void Function(SkillStructBuilder) updates]) =
      _$SkillStruct;
}

SkillStruct createSkillStruct({
  String? skillName,
  String? experience,
  bool? isPrimary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SkillStruct(
      (s) => s
        ..skillName = skillName
        ..experience = experience
        ..isPrimary = isPrimary
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SkillStruct? updateSkillStruct(
  SkillStruct? skill, {
  bool clearUnsetFields = true,
}) =>
    skill != null
        ? (skill.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addSkillStructData(
  Map<String, dynamic> firestoreData,
  SkillStruct? skill,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (skill == null) {
    return;
  }
  if (skill.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && skill.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final skillData = getSkillFirestoreData(skill, forFieldValue);
  final nestedData = skillData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = skill.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getSkillFirestoreData(
  SkillStruct? skill, [
  bool forFieldValue = false,
]) {
  if (skill == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(SkillStruct.serializer, skill);

  // Add any Firestore field values
  skill.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSkillListFirestoreData(
  List<SkillStruct>? skills,
) =>
    skills?.map((s) => getSkillFirestoreData(s, true)).toList() ?? [];
