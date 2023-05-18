import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jobimage_record.g.dart';

abstract class JobimageRecord
    implements Built<JobimageRecord, JobimageRecordBuilder> {
  static Serializer<JobimageRecord> get serializer =>
      _$jobimageRecordSerializer;

  String? get textile;

  String? get garments;

  String? get construction;

  String? get mining;

  String? get restraunt;

  String? get automobile;

  String? get homestaff;

  String? get agri;

  String? get driver;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JobimageRecordBuilder builder) => builder
    ..textile = ''
    ..garments = ''
    ..construction = ''
    ..mining = ''
    ..restraunt = ''
    ..automobile = ''
    ..homestaff = ''
    ..agri = ''
    ..driver = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobimage');

  static Stream<JobimageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobimageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobimageRecord._();
  factory JobimageRecord([void Function(JobimageRecordBuilder) updates]) =
      _$JobimageRecord;

  static JobimageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobimageRecordData({
  String? textile,
  String? garments,
  String? construction,
  String? mining,
  String? restraunt,
  String? automobile,
  String? homestaff,
  String? agri,
  String? driver,
}) {
  final firestoreData = serializers.toFirestore(
    JobimageRecord.serializer,
    JobimageRecord(
      (j) => j
        ..textile = textile
        ..garments = garments
        ..construction = construction
        ..mining = mining
        ..restraunt = restraunt
        ..automobile = automobile
        ..homestaff = homestaff
        ..agri = agri
        ..driver = driver,
    ),
  );

  return firestoreData;
}
