import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workers_record.g.dart';

abstract class WorkersRecord
    implements Built<WorkersRecord, WorkersRecordBuilder> {
  static Serializer<WorkersRecord> get serializer => _$workersRecordSerializer;

  @BuiltValueField(wireName: 'User_Ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'full_name')
  String? get fullName;

  String? get phone;

  String? get dob;

  String? get email;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

  String? get photo;

  String? get area;

  String? get district;

  String? get state;

  String? get aadhar;

  @BuiltValueField(wireName: 'pan_number')
  String? get panNumber;

  @BuiltValueField(wireName: 'account_name')
  String? get accountName;

  @BuiltValueField(wireName: 'account_number')
  String? get accountNumber;

  @BuiltValueField(wireName: 'bank_name')
  String? get bankName;

  @BuiltValueField(wireName: 'ifsc_code')
  String? get ifscCode;

  @BuiltValueField(wireName: 'highest_qualification')
  String? get highestQualification;

  String? get gender;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'recruiter_reference')
  DocumentReference? get captainScoutRef;

  bool? get addprimary;

  int? get addsecondary;

  DocumentReference? get workref;

  @BuiltValueField(wireName: 'captain_name')
  String? get captainName;

  String? get date;

  @BuiltValueField(wireName: 'organisation_id')
  DocumentReference? get organisationId;

  @BuiltValueField(wireName: 'job_worker_id')
  DocumentReference? get jobWorkerId;

  AllSkillsStruct get skills;

  AllExpeienceStruct get experiences;

  @BuiltValueField(wireName: 'job_applied')
  BuiltList<WorkerJobApplicationStruct>? get jobApplied;

  int? get age;

  String? get dobforage;

  @BuiltValueField(wireName: 'employment_status')
  String? get employmentStatus;

  @BuiltValueField(wireName: 'skill_name')
  String? get skillName;

  @BuiltValueField(wireName: 'is_primary')
  bool? get isPrimary;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WorkersRecordBuilder builder) => builder
    ..fullName = ''
    ..phone = ''
    ..dob = ''
    ..email = ''
    ..pinCode = ''
    ..photo = ''
    ..area = ''
    ..district = ''
    ..state = ''
    ..aadhar = ''
    ..panNumber = ''
    ..accountName = ''
    ..accountNumber = ''
    ..bankName = ''
    ..ifscCode = ''
    ..highestQualification = ''
    ..gender = ''
    ..addprimary = false
    ..addsecondary = 0
    ..captainName = ''
    ..date = ''
    ..skills = AllSkillsStructBuilder()
    ..experiences = AllExpeienceStructBuilder()
    ..jobApplied = ListBuilder()
    ..age = 0
    ..dobforage = ''
    ..employmentStatus = ''
    ..skillName = ''
    ..isPrimary = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Workers');

  static Stream<WorkersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WorkersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WorkersRecord._();
  factory WorkersRecord([void Function(WorkersRecordBuilder) updates]) =
      _$WorkersRecord;

  static WorkersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWorkersRecordData({
  DocumentReference? userRef,
  String? fullName,
  String? phone,
  String? dob,
  String? email,
  String? pinCode,
  String? photo,
  String? area,
  String? district,
  String? state,
  String? aadhar,
  String? panNumber,
  String? accountName,
  String? accountNumber,
  String? bankName,
  String? ifscCode,
  String? highestQualification,
  String? gender,
  DateTime? createdDate,
  DocumentReference? captainScoutRef,
  bool? addprimary,
  int? addsecondary,
  DocumentReference? workref,
  String? captainName,
  String? date,
  DocumentReference? organisationId,
  DocumentReference? jobWorkerId,
  AllSkillsStruct? skills,
  AllExpeienceStruct? experiences,
  int? age,
  String? dobforage,
  String? employmentStatus,
  String? skillName,
  bool? isPrimary,
}) {
  final firestoreData = serializers.toFirestore(
    WorkersRecord.serializer,
    WorkersRecord(
      (w) => w
        ..userRef = userRef
        ..fullName = fullName
        ..phone = phone
        ..dob = dob
        ..email = email
        ..pinCode = pinCode
        ..photo = photo
        ..area = area
        ..district = district
        ..state = state
        ..aadhar = aadhar
        ..panNumber = panNumber
        ..accountName = accountName
        ..accountNumber = accountNumber
        ..bankName = bankName
        ..ifscCode = ifscCode
        ..highestQualification = highestQualification
        ..gender = gender
        ..createdDate = createdDate
        ..captainScoutRef = captainScoutRef
        ..addprimary = addprimary
        ..addsecondary = addsecondary
        ..workref = workref
        ..captainName = captainName
        ..date = date
        ..organisationId = organisationId
        ..jobWorkerId = jobWorkerId
        ..skills = AllSkillsStructBuilder()
        ..experiences = AllExpeienceStructBuilder()
        ..jobApplied = null
        ..age = age
        ..dobforage = dobforage
        ..employmentStatus = employmentStatus
        ..skillName = skillName
        ..isPrimary = isPrimary,
    ),
  );

  // Handle nested data for "skills" field.
  addAllSkillsStructData(firestoreData, skills, 'skills');

  // Handle nested data for "experiences" field.
  addAllExpeienceStructData(firestoreData, experiences, 'experiences');

  return firestoreData;
}
