// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganisationsRecord> _$organisationsRecordSerializer =
    new _$OrganisationsRecordSerializer();

class _$OrganisationsRecordSerializer
    implements StructuredSerializer<OrganisationsRecord> {
  @override
  final Iterable<Type> types = const [
    OrganisationsRecord,
    _$OrganisationsRecord
  ];
  @override
  final String wireName = 'OrganisationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrganisationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactName;
    if (value != null) {
      result
        ..add('contact_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.area;
    if (value != null) {
      result
        ..add('area')
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
    value = object.pinCode;
    if (value != null) {
      result
        ..add('pin_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationLogo;
    if (value != null) {
      result
        ..add('organisation_logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.district;
    if (value != null) {
      result
        ..add('district')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgSector;
    if (value != null) {
      result
        ..add('org_sector')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationRegistrationId;
    if (value != null) {
      result
        ..add('organisation_registration_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.organisationName;
    if (value != null) {
      result
        ..add('organisation_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdOn;
    if (value != null) {
      result
        ..add('created_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  OrganisationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganisationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact_name':
          result.contactName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pin_code':
          result.pinCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_logo':
          result.organisationLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'district':
          result.district = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_sector':
          result.orgSector = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_registration_id':
          result.organisationRegistrationId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'organisation_name':
          result.organisationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_on':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$OrganisationsRecord extends OrganisationsRecord {
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? contactName;
  @override
  final String? email;
  @override
  final String? area;
  @override
  final String? phoneNumber;
  @override
  final String? pinCode;
  @override
  final String? organisationLogo;
  @override
  final String? district;
  @override
  final String? orgSector;
  @override
  final int? organisationRegistrationId;
  @override
  final String? organisationName;
  @override
  final DateTime? createdOn;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrganisationsRecord(
          [void Function(OrganisationsRecordBuilder)? updates]) =>
      (new OrganisationsRecordBuilder()..update(updates))._build();

  _$OrganisationsRecord._(
      {this.state,
      this.country,
      this.contactName,
      this.email,
      this.area,
      this.phoneNumber,
      this.pinCode,
      this.organisationLogo,
      this.district,
      this.orgSector,
      this.organisationRegistrationId,
      this.organisationName,
      this.createdOn,
      this.ffRef})
      : super._();

  @override
  OrganisationsRecord rebuild(
          void Function(OrganisationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganisationsRecordBuilder toBuilder() =>
      new OrganisationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganisationsRecord &&
        state == other.state &&
        country == other.country &&
        contactName == other.contactName &&
        email == other.email &&
        area == other.area &&
        phoneNumber == other.phoneNumber &&
        pinCode == other.pinCode &&
        organisationLogo == other.organisationLogo &&
        district == other.district &&
        orgSector == other.orgSector &&
        organisationRegistrationId == other.organisationRegistrationId &&
        organisationName == other.organisationName &&
        createdOn == other.createdOn &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, contactName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, pinCode.hashCode);
    _$hash = $jc(_$hash, organisationLogo.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, orgSector.hashCode);
    _$hash = $jc(_$hash, organisationRegistrationId.hashCode);
    _$hash = $jc(_$hash, organisationName.hashCode);
    _$hash = $jc(_$hash, createdOn.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganisationsRecord')
          ..add('state', state)
          ..add('country', country)
          ..add('contactName', contactName)
          ..add('email', email)
          ..add('area', area)
          ..add('phoneNumber', phoneNumber)
          ..add('pinCode', pinCode)
          ..add('organisationLogo', organisationLogo)
          ..add('district', district)
          ..add('orgSector', orgSector)
          ..add('organisationRegistrationId', organisationRegistrationId)
          ..add('organisationName', organisationName)
          ..add('createdOn', createdOn)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrganisationsRecordBuilder
    implements Builder<OrganisationsRecord, OrganisationsRecordBuilder> {
  _$OrganisationsRecord? _$v;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _contactName;
  String? get contactName => _$this._contactName;
  set contactName(String? contactName) => _$this._contactName = contactName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _pinCode;
  String? get pinCode => _$this._pinCode;
  set pinCode(String? pinCode) => _$this._pinCode = pinCode;

  String? _organisationLogo;
  String? get organisationLogo => _$this._organisationLogo;
  set organisationLogo(String? organisationLogo) =>
      _$this._organisationLogo = organisationLogo;

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _orgSector;
  String? get orgSector => _$this._orgSector;
  set orgSector(String? orgSector) => _$this._orgSector = orgSector;

  int? _organisationRegistrationId;
  int? get organisationRegistrationId => _$this._organisationRegistrationId;
  set organisationRegistrationId(int? organisationRegistrationId) =>
      _$this._organisationRegistrationId = organisationRegistrationId;

  String? _organisationName;
  String? get organisationName => _$this._organisationName;
  set organisationName(String? organisationName) =>
      _$this._organisationName = organisationName;

  DateTime? _createdOn;
  DateTime? get createdOn => _$this._createdOn;
  set createdOn(DateTime? createdOn) => _$this._createdOn = createdOn;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrganisationsRecordBuilder() {
    OrganisationsRecord._initializeBuilder(this);
  }

  OrganisationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _country = $v.country;
      _contactName = $v.contactName;
      _email = $v.email;
      _area = $v.area;
      _phoneNumber = $v.phoneNumber;
      _pinCode = $v.pinCode;
      _organisationLogo = $v.organisationLogo;
      _district = $v.district;
      _orgSector = $v.orgSector;
      _organisationRegistrationId = $v.organisationRegistrationId;
      _organisationName = $v.organisationName;
      _createdOn = $v.createdOn;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganisationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganisationsRecord;
  }

  @override
  void update(void Function(OrganisationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganisationsRecord build() => _build();

  _$OrganisationsRecord _build() {
    final _$result = _$v ??
        new _$OrganisationsRecord._(
            state: state,
            country: country,
            contactName: contactName,
            email: email,
            area: area,
            phoneNumber: phoneNumber,
            pinCode: pinCode,
            organisationLogo: organisationLogo,
            district: district,
            orgSector: orgSector,
            organisationRegistrationId: organisationRegistrationId,
            organisationName: organisationName,
            createdOn: createdOn,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
