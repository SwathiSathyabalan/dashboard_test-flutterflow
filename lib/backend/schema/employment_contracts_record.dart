import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'employment_contracts_record.g.dart';

abstract class EmploymentContractsRecord
    implements
        Built<EmploymentContractsRecord, EmploymentContractsRecordBuilder> {
  static Serializer<EmploymentContractsRecord> get serializer =>
      _$employmentContractsRecordSerializer;

  @BuiltValueField(wireName: 'job_id')
  DocumentReference? get jobId;

  @BuiltValueField(wireName: 'organisation_id')
  DocumentReference? get organisationId;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  String? get salary;

  @BuiltValueField(wireName: 'salary_type')
  String? get salaryType;

  @BuiltValueField(wireName: 'is_contract_signed')
  bool? get isContractSigned;

  @BuiltValueField(wireName: 'worker_id')
  DocumentReference? get workerId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(EmploymentContractsRecordBuilder builder) =>
      builder
        ..salary = ''
        ..salaryType = ''
        ..isContractSigned = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('employmentContracts')
          : FirebaseFirestore.instance.collectionGroup('employmentContracts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('employmentContracts').doc();

  static Stream<EmploymentContractsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EmploymentContractsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EmploymentContractsRecord._();
  factory EmploymentContractsRecord(
          [void Function(EmploymentContractsRecordBuilder) updates]) =
      _$EmploymentContractsRecord;

  static EmploymentContractsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEmploymentContractsRecordData({
  DocumentReference? jobId,
  DocumentReference? organisationId,
  DateTime? startDate,
  DateTime? endDate,
  String? salary,
  String? salaryType,
  bool? isContractSigned,
  DocumentReference? workerId,
}) {
  final firestoreData = serializers.toFirestore(
    EmploymentContractsRecord.serializer,
    EmploymentContractsRecord(
      (e) => e
        ..jobId = jobId
        ..organisationId = organisationId
        ..startDate = startDate
        ..endDate = endDate
        ..salary = salary
        ..salaryType = salaryType
        ..isContractSigned = isContractSigned
        ..workerId = workerId,
    ),
  );

  return firestoreData;
}
