import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'experience_struct.g.dart';

abstract class ExperienceStruct
    implements Built<ExperienceStruct, ExperienceStructBuilder> {
  static Serializer<ExperienceStruct> get serializer =>
      _$experienceStructSerializer;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: 'primary_skill')
  String? get primarySkill;

  @BuiltValueField(wireName: 'start_date')
  String? get startDate;

  @BuiltValueField(wireName: 'end_date')
  String? get endDate;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ExperienceStructBuilder builder) => builder
    ..companyName = ''
    ..jobTitle = ''
    ..primarySkill = ''
    ..startDate = ''
    ..endDate = ''
    ..firestoreUtilData = FirestoreUtilData();

  ExperienceStruct._();
  factory ExperienceStruct([void Function(ExperienceStructBuilder) updates]) =
      _$ExperienceStruct;
}

ExperienceStruct createExperienceStruct({
  String? companyName,
  String? jobTitle,
  String? primarySkill,
  String? startDate,
  String? endDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExperienceStruct(
      (e) => e
        ..companyName = companyName
        ..jobTitle = jobTitle
        ..primarySkill = primarySkill
        ..startDate = startDate
        ..endDate = endDate
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ExperienceStruct? updateExperienceStruct(
  ExperienceStruct? experience, {
  bool clearUnsetFields = true,
}) =>
    experience != null
        ? (experience.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addExperienceStructData(
  Map<String, dynamic> firestoreData,
  ExperienceStruct? experience,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (experience == null) {
    return;
  }
  if (experience.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && experience.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final experienceData = getExperienceFirestoreData(experience, forFieldValue);
  final nestedData = experienceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = experience.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getExperienceFirestoreData(
  ExperienceStruct? experience, [
  bool forFieldValue = false,
]) {
  if (experience == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ExperienceStruct.serializer, experience);

  // Add any Firestore field values
  experience.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExperienceListFirestoreData(
  List<ExperienceStruct>? experiences,
) =>
    experiences?.map((e) => getExperienceFirestoreData(e, true)).toList() ?? [];
