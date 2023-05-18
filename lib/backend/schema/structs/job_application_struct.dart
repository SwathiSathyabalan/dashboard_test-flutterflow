import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_application_struct.g.dart';

abstract class JobApplicationStruct
    implements Built<JobApplicationStruct, JobApplicationStructBuilder> {
  static Serializer<JobApplicationStruct> get serializer =>
      _$jobApplicationStructSerializer;

  @BuiltValueField(wireName: 'worker_id')
  DocumentReference? get workerId;

  @BuiltValueField(wireName: 'Applied_on')
  DateTime? get appliedOn;

  @BuiltValueField(wireName: 'application_status')
  int? get applicationStatus;

  @BuiltValueField(wireName: 'worker_name')
  String? get workerName;

  String? get gender;

  String? get area;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(JobApplicationStructBuilder builder) => builder
    ..applicationStatus = 0
    ..workerName = ''
    ..gender = ''
    ..area = ''
    ..firestoreUtilData = FirestoreUtilData();

  JobApplicationStruct._();
  factory JobApplicationStruct(
          [void Function(JobApplicationStructBuilder) updates]) =
      _$JobApplicationStruct;
}

JobApplicationStruct createJobApplicationStruct({
  DocumentReference? workerId,
  DateTime? appliedOn,
  int? applicationStatus,
  String? workerName,
  String? gender,
  String? area,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JobApplicationStruct(
      (j) => j
        ..workerId = workerId
        ..appliedOn = appliedOn
        ..applicationStatus = applicationStatus
        ..workerName = workerName
        ..gender = gender
        ..area = area
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

JobApplicationStruct? updateJobApplicationStruct(
  JobApplicationStruct? jobApplication, {
  bool clearUnsetFields = true,
}) =>
    jobApplication != null
        ? (jobApplication.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addJobApplicationStructData(
  Map<String, dynamic> firestoreData,
  JobApplicationStruct? jobApplication,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jobApplication == null) {
    return;
  }
  if (jobApplication.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && jobApplication.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jobApplicationData =
      getJobApplicationFirestoreData(jobApplication, forFieldValue);
  final nestedData =
      jobApplicationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = jobApplication.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getJobApplicationFirestoreData(
  JobApplicationStruct? jobApplication, [
  bool forFieldValue = false,
]) {
  if (jobApplication == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(JobApplicationStruct.serializer, jobApplication);

  // Add any Firestore field values
  jobApplication.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJobApplicationListFirestoreData(
  List<JobApplicationStruct>? jobApplications,
) =>
    jobApplications
        ?.map((j) => getJobApplicationFirestoreData(j, true))
        .toList() ??
    [];
