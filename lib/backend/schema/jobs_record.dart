import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jobs_record.g.dart';

abstract class JobsRecord implements Built<JobsRecord, JobsRecordBuilder> {
  static Serializer<JobsRecord> get serializer => _$jobsRecordSerializer;

  @BuiltValueField(wireName: 'job_description')
  String? get jobDescription;

  @BuiltValueField(wireName: 'job_image')
  String? get jobImage;

  @BuiltValueField(wireName: 'primary_skill_level')
  String? get primarySkillLevel;

  @BuiltValueField(wireName: 'organisation_name')
  String? get organisationName;

  @BuiltValueField(wireName: 'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: 'mode_of_salary')
  String? get modeOfSalary;

  @BuiltValueField(wireName: 'job_category')
  String? get jobCategory;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

  String? get area;

  String? get district;

  String? get state;

  @BuiltValueField(wireName: 'job_application_collection')
  String? get jobApplicationCollection;

  @BuiltValueField(wireName: 'application_list')
  String? get applicationList;

  @BuiltValueField(wireName: 'working_hours')
  String? get workingHours;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  String? get gender;

  @BuiltValueField(wireName: 'min_salary')
  String? get minSalary;

  @BuiltValueField(wireName: 'max_salary')
  String? get maxSalary;

  @BuiltValueField(wireName: 'min_age')
  String? get minAge;

  @BuiltValueField(wireName: 'max_age')
  String? get maxAge;

  String? get food;

  String? get lodging;

  String? get transportation;

  String? get medical;

  @BuiltValueField(wireName: 'job_sub_categ')
  String? get jobSubCateg;

  @BuiltValueField(wireName: 'org_ref_id')
  DocumentReference? get orgRefId;

  @BuiltValueField(wireName: 'min_qualification')
  String? get minQualification;

  JobApplicationStruct get application;

  BuiltList<JobApplicationStruct>? get applications;

  @BuiltValueField(wireName: 'job_id')
  DocumentReference? get jobId;

  @BuiltValueField(wireName: 'job_status')
  String? get jobStatus;

  @BuiltValueField(wireName: 'worker_id')
  BuiltList<String>? get workerId;

  @BuiltValueField(wireName: 'number_of_vacancies')
  int? get numberOfVacancies;

  int? get filled;

  int? get open;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobsRecordBuilder builder) => builder
    ..jobDescription = ''
    ..jobImage = ''
    ..primarySkillLevel = ''
    ..organisationName = ''
    ..jobTitle = ''
    ..modeOfSalary = ''
    ..jobCategory = ''
    ..pinCode = ''
    ..area = ''
    ..district = ''
    ..state = ''
    ..jobApplicationCollection = ''
    ..applicationList = ''
    ..workingHours = ''
    ..gender = ''
    ..minSalary = ''
    ..maxSalary = ''
    ..minAge = ''
    ..maxAge = ''
    ..food = ''
    ..lodging = ''
    ..transportation = ''
    ..medical = ''
    ..jobSubCateg = ''
    ..minQualification = ''
    ..application = JobApplicationStructBuilder()
    ..applications = ListBuilder()
    ..jobStatus = ''
    ..workerId = ListBuilder()
    ..numberOfVacancies = 0
    ..filled = 0
    ..open = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Jobs')
          : FirebaseFirestore.instance.collectionGroup('Jobs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Jobs').doc();

  static Stream<JobsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobsRecord._();
  factory JobsRecord([void Function(JobsRecordBuilder) updates]) = _$JobsRecord;

  static JobsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobsRecordData({
  String? jobDescription,
  String? jobImage,
  String? primarySkillLevel,
  String? organisationName,
  String? jobTitle,
  String? modeOfSalary,
  String? jobCategory,
  String? pinCode,
  String? area,
  String? district,
  String? state,
  String? jobApplicationCollection,
  String? applicationList,
  String? workingHours,
  DateTime? startDate,
  DateTime? endDate,
  String? gender,
  String? minSalary,
  String? maxSalary,
  String? minAge,
  String? maxAge,
  String? food,
  String? lodging,
  String? transportation,
  String? medical,
  String? jobSubCateg,
  DocumentReference? orgRefId,
  String? minQualification,
  JobApplicationStruct? application,
  DocumentReference? jobId,
  String? jobStatus,
  int? numberOfVacancies,
  int? filled,
  int? open,
}) {
  final firestoreData = serializers.toFirestore(
    JobsRecord.serializer,
    JobsRecord(
      (j) => j
        ..jobDescription = jobDescription
        ..jobImage = jobImage
        ..primarySkillLevel = primarySkillLevel
        ..organisationName = organisationName
        ..jobTitle = jobTitle
        ..modeOfSalary = modeOfSalary
        ..jobCategory = jobCategory
        ..pinCode = pinCode
        ..area = area
        ..district = district
        ..state = state
        ..jobApplicationCollection = jobApplicationCollection
        ..applicationList = applicationList
        ..workingHours = workingHours
        ..startDate = startDate
        ..endDate = endDate
        ..gender = gender
        ..minSalary = minSalary
        ..maxSalary = maxSalary
        ..minAge = minAge
        ..maxAge = maxAge
        ..food = food
        ..lodging = lodging
        ..transportation = transportation
        ..medical = medical
        ..jobSubCateg = jobSubCateg
        ..orgRefId = orgRefId
        ..minQualification = minQualification
        ..application = JobApplicationStructBuilder()
        ..applications = null
        ..jobId = jobId
        ..jobStatus = jobStatus
        ..workerId = null
        ..numberOfVacancies = numberOfVacancies
        ..filled = filled
        ..open = open,
    ),
  );

  // Handle nested data for "application" field.
  addJobApplicationStructData(firestoreData, application, 'application');

  return firestoreData;
}
