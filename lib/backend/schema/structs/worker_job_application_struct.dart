import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'worker_job_application_struct.g.dart';

abstract class WorkerJobApplicationStruct
    implements
        Built<WorkerJobApplicationStruct, WorkerJobApplicationStructBuilder> {
  static Serializer<WorkerJobApplicationStruct> get serializer =>
      _$workerJobApplicationStructSerializer;

  @BuiltValueField(wireName: 'job_id')
  DocumentReference? get jobId;

  @BuiltValueField(wireName: 'applied_on')
  DateTime? get appliedOn;

  @BuiltValueField(wireName: 'application_status')
  int? get applicationStatus;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(WorkerJobApplicationStructBuilder builder) =>
      builder
        ..applicationStatus = 0
        ..firestoreUtilData = FirestoreUtilData();

  WorkerJobApplicationStruct._();
  factory WorkerJobApplicationStruct(
          [void Function(WorkerJobApplicationStructBuilder) updates]) =
      _$WorkerJobApplicationStruct;
}

WorkerJobApplicationStruct createWorkerJobApplicationStruct({
  DocumentReference? jobId,
  DateTime? appliedOn,
  int? applicationStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkerJobApplicationStruct(
      (w) => w
        ..jobId = jobId
        ..appliedOn = appliedOn
        ..applicationStatus = applicationStatus
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

WorkerJobApplicationStruct? updateWorkerJobApplicationStruct(
  WorkerJobApplicationStruct? workerJobApplication, {
  bool clearUnsetFields = true,
}) =>
    workerJobApplication != null
        ? (workerJobApplication.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addWorkerJobApplicationStructData(
  Map<String, dynamic> firestoreData,
  WorkerJobApplicationStruct? workerJobApplication,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workerJobApplication == null) {
    return;
  }
  if (workerJobApplication.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue &&
      workerJobApplication.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workerJobApplicationData =
      getWorkerJobApplicationFirestoreData(workerJobApplication, forFieldValue);
  final nestedData =
      workerJobApplicationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = workerJobApplication.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getWorkerJobApplicationFirestoreData(
  WorkerJobApplicationStruct? workerJobApplication, [
  bool forFieldValue = false,
]) {
  if (workerJobApplication == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      WorkerJobApplicationStruct.serializer, workerJobApplication);

  // Add any Firestore field values
  workerJobApplication.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkerJobApplicationListFirestoreData(
  List<WorkerJobApplicationStruct>? workerJobApplications,
) =>
    workerJobApplications
        ?.map((w) => getWorkerJobApplicationFirestoreData(w, true))
        .toList() ??
    [];
