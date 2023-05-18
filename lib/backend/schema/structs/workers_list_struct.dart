import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'workers_list_struct.g.dart';

abstract class WorkersListStruct
    implements Built<WorkersListStruct, WorkersListStructBuilder> {
  static Serializer<WorkersListStruct> get serializer =>
      _$workersListStructSerializer;

  @BuiltValueField(wireName: 'worker_id')
  BuiltList<DocumentReference>? get workerId;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(WorkersListStructBuilder builder) => builder
    ..workerId = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  WorkersListStruct._();
  factory WorkersListStruct([void Function(WorkersListStructBuilder) updates]) =
  _$WorkersListStruct;
}

WorkersListStruct createWorkersListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkersListStruct(
          (w) => w
        ..workerId = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

WorkersListStruct? updateWorkersListStruct(
    WorkersListStruct? workersList, {
      bool clearUnsetFields = true,
    }) =>
    workersList != null
        ? (workersList.toBuilder()
      ..firestoreUtilData =
      FirestoreUtilData(clearUnsetFields: clearUnsetFields))
        .build()
        : null;

void addWorkersListStructData(
    Map<String, dynamic> firestoreData,
    WorkersListStruct? workersList,
    String fieldName, [
      bool forFieldValue = false,
    ]) {
  firestoreData.remove(fieldName);
  if (workersList == null) {
    return;
  }
  if (workersList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && workersList.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workersListData =
  getWorkersListFirestoreData(workersList, forFieldValue);
  final nestedData =
  workersListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = workersList.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getWorkersListFirestoreData(
    WorkersListStruct? workersList, [
      bool forFieldValue = false,
    ]) {
  if (workersList == null) {
    return {};
  }
  final firestoreData =
  serializers.toFirestore(WorkersListStruct.serializer, workersList);

  // Add any Firestore field values
  workersList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkersListListFirestoreData(
    List<WorkersListStruct>? workersLists,
    ) =>
    workersLists?.map((w) => getWorkersListFirestoreData(w, true)).toList() ??
        [];
