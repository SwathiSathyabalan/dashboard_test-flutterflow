import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jansakti_admin/backend/schema/structs/workers_list_struct.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'recruiters_record.g.dart';

abstract class RecruitersRecord
    implements Built<RecruitersRecord, RecruitersRecordBuilder> {
  static Serializer<RecruitersRecord> get serializer =>
      _$recruitersRecordSerializer;

  @BuiltValueField(wireName: 'User_Ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'full_name')
  String? get fullName;

  String? get phone;

  String? get dob;

  String? get gender;

  String? get email;

  String? get photo;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

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

  @BuiltValueField(wireName: 'referral_code')
  String? get referralCode;

  @BuiltValueField(wireName: 'recruitment_area')
  String? get recruitmentArea;

  String? get tag;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  int? get age;

  @BuiltValueField(wireName: 'workers_list')
  WorkersListStruct get workersList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;



  static void _initializeBuilder(RecruitersRecordBuilder builder) => builder
    ..fullName = ''
    ..phone = ''
    ..dob = ''
    ..gender = ''
    ..email = ''
    ..photo = ''
    ..pinCode = ''
    ..area = ''
    ..district = ''
    ..state = ''
    ..aadhar = ''
    ..panNumber = ''
    ..accountName = ''
    ..accountNumber = ''
    ..bankName = ''
    ..ifscCode = ''
    ..referralCode = ''
    ..recruitmentArea = ''
    ..tag = ''
    ..age = 0
    ..workersList = WorkersListStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recruiters');

  static Stream<RecruitersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecruitersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecruitersRecord._();
  factory RecruitersRecord([void Function(RecruitersRecordBuilder) updates]) =
      _$RecruitersRecord;

  static RecruitersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecruitersRecordData({
  DocumentReference? userRef,
  String? fullName,
  String? phone,
  String? dob,
  String? gender,
  String? email,
  String? photo,
  String? pinCode,
  String? area,
  String? district,
  String? state,
  String? aadhar,
  String? panNumber,
  String? accountName,
  String? accountNumber,
  String? bankName,
  String? ifscCode,
  String? tag,

  String? referralCode,
  String? recruitmentArea,

  DateTime? createdDate,
  int? age,
  WorkersListStruct? workersList,
}) {
  final firestoreData = serializers.toFirestore(
    RecruitersRecord.serializer,
    RecruitersRecord(
      (c) => c
        ..userRef = userRef
        ..fullName = fullName
        ..phone = phone
        ..dob = dob
        ..gender = gender
        ..email = email
        ..photo = photo
        ..pinCode = pinCode
        ..area = area
        ..district = district
        ..state = state
        ..aadhar = aadhar
        ..panNumber = panNumber
        ..accountName = accountName
        ..accountNumber = accountNumber
        ..bankName = bankName
        ..ifscCode = ifscCode
        ..referralCode = referralCode
        ..recruitmentArea = recruitmentArea
        ..tag = tag
        ..createdDate = createdDate
        ..age = age
        ..workersList = WorkersListStructBuilder(),
    ),
  );

  addWorkersListStructData(firestoreData, workersList, 'workers_list');

  return firestoreData;
}
