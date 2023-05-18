// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdminUserRecord> _$adminUserRecordSerializer =
    new _$AdminUserRecordSerializer();

class _$AdminUserRecordSerializer
    implements StructuredSerializer<AdminUserRecord> {
  @override
  final Iterable<Type> types = const [AdminUserRecord, _$AdminUserRecord];
  @override
  final String wireName = 'AdminUserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdminUserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AdminUserRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminUserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AdminUserRecord extends AdminUserRecord {
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? name;
  @override
  final String? password;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AdminUserRecord([void Function(AdminUserRecordBuilder)? updates]) =>
      (new AdminUserRecordBuilder()..update(updates))._build();

  _$AdminUserRecord._(
      {this.email, this.phoneNumber, this.name, this.password, this.ffRef})
      : super._();

  @override
  AdminUserRecord rebuild(void Function(AdminUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminUserRecordBuilder toBuilder() =>
      new AdminUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminUserRecord &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        name == other.name &&
        password == other.password &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminUserRecord')
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('name', name)
          ..add('password', password)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AdminUserRecordBuilder
    implements Builder<AdminUserRecord, AdminUserRecordBuilder> {
  _$AdminUserRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AdminUserRecordBuilder() {
    AdminUserRecord._initializeBuilder(this);
  }

  AdminUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _name = $v.name;
      _password = $v.password;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminUserRecord;
  }

  @override
  void update(void Function(AdminUserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminUserRecord build() => _build();

  _$AdminUserRecord _build() {
    final _$result = _$v ??
        new _$AdminUserRecord._(
            email: email,
            phoneNumber: phoneNumber,
            name: name,
            password: password,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
