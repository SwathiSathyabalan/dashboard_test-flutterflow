import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_worker_record.g.dart';

abstract class JobWorkerRecord
    implements Built<JobWorkerRecord, JobWorkerRecordBuilder> {
  static Serializer<JobWorkerRecord> get serializer =>
      _$jobWorkerRecordSerializer;

  String? get salary;

  @BuiltValueField(wireName: 'worker_id')
  DocumentReference? get workerId;

  @BuiltValueField(wireName: 'contract_signed')
  bool? get contractSigned;

  @BuiltValueField(wireName: 'org_reference')
  DocumentReference? get orgReference;

  @BuiltValueField(wireName: 'job_reference')
  DocumentReference? get jobReference;

  @BuiltValueField(wireName: 'job_name')
  String? get jobName;

  @BuiltValueField(wireName: 'key_skill')
  String? get keySkill;

  @BuiltValueField(wireName: 'org_name')
  String? get orgName;

  @BuiltValueField(wireName: 'applied_date')
  DateTime? get appliedDate;

  String? get gender;

  @BuiltValueField(wireName: 'worker_area')
  String? get workerArea;

  @BuiltValueField(wireName: 'worker_name')
  String? get workerName;

  @BuiltValueField(wireName: 'worker_photo')
  String? get workerPhoto;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'job_photo')
  String? get jobPhoto;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobWorkerRecordBuilder builder) => builder
    ..salary = ''
    ..contractSigned = false
    ..jobName = ''
    ..keySkill = ''
    ..orgName = ''
    ..gender = ''
    ..workerArea = ''
    ..workerName = ''
    ..workerPhoto = ''
    ..jobPhoto = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Job_worker')
          : FirebaseFirestore.instance.collectionGroup('Job_worker');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Job_worker').doc();

  static Stream<JobWorkerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobWorkerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobWorkerRecord._();
  factory JobWorkerRecord([void Function(JobWorkerRecordBuilder) updates]) =
      _$JobWorkerRecord;

  static JobWorkerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobWorkerRecordData({
  String? salary,
  DocumentReference? workerId,
  bool? contractSigned,
  DocumentReference? orgReference,
  DocumentReference? jobReference,
  String? jobName,
  String? keySkill,
  String? orgName,
  DateTime? appliedDate,
  String? gender,
  String? workerArea,
  String? workerName,
  String? workerPhoto,
  DateTime? startDate,
  DateTime? endDate,
  String? jobPhoto,
}) {
  final firestoreData = serializers.toFirestore(
    JobWorkerRecord.serializer,
    JobWorkerRecord(
      (j) => j
        ..salary = salary
        ..workerId = workerId
        ..contractSigned = contractSigned
        ..orgReference = orgReference
        ..jobReference = jobReference
        ..jobName = jobName
        ..keySkill = keySkill
        ..orgName = orgName
        ..appliedDate = appliedDate
        ..gender = gender
        ..workerArea = workerArea
        ..workerName = workerName
        ..workerPhoto = workerPhoto
        ..startDate = startDate
        ..endDate = endDate
        ..jobPhoto = jobPhoto,
    ),
  );

  return firestoreData;
}
