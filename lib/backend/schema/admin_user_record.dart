import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admin_user_record.g.dart';

abstract class AdminUserRecord
    implements Built<AdminUserRecord, AdminUserRecordBuilder> {
  static Serializer<AdminUserRecord> get serializer =>
      _$adminUserRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get name;

  String? get password;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AdminUserRecordBuilder builder) => builder
    ..email = ''
    ..phoneNumber = ''
    ..name = ''
    ..password = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_user');

  static Stream<AdminUserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AdminUserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AdminUserRecord._();
  factory AdminUserRecord([void Function(AdminUserRecordBuilder) updates]) =
      _$AdminUserRecord;

  static AdminUserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAdminUserRecordData({
  String? email,
  String? phoneNumber,
  String? name,
  String? password,
}) {
  final firestoreData = serializers.toFirestore(
    AdminUserRecord.serializer,
    AdminUserRecord(
      (a) => a
        ..email = email
        ..phoneNumber = phoneNumber
        ..name = name
        ..password = password,
    ),
  );

  return firestoreData;
}
