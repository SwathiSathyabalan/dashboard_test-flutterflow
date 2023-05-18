// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkersRecord> _$workersRecordSerializer =
    new _$WorkersRecordSerializer();

class _$WorkersRecordSerializer implements StructuredSerializer<WorkersRecord> {
  @override
  final Iterable<Type> types = const [WorkersRecord, _$WorkersRecord];
  @override
  final String wireName = 'WorkersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, WorkersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'skills',
      serializers.serialize(object.skills,
          specifiedType: const FullType(AllSkillsStruct)),
      'experiences',
      serializers.serialize(object.experiences,
          specifiedType: const FullType(AllExpeienceStruct)),
    ];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('User_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.fullName;
    if (value != null) {
      result
        ..add('full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('dob')
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
    value = object.pinCode;
    if (value != null) {
      result
        ..add('pin_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
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
    value = object.district;
    if (value != null) {
      result
        ..add('district')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aadhar;
    if (value != null) {
      result
        ..add('aadhar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.panNumber;
    if (value != null) {
      result
        ..add('pan_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountName;
    if (value != null) {
      result
        ..add('account_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountNumber;
    if (value != null) {
      result
        ..add('account_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankName;
    if (value != null) {
      result
        ..add('bank_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ifscCode;
    if (value != null) {
      result
        ..add('ifsc_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highestQualification;
    if (value != null) {
      result
        ..add('highest_qualification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.captainScoutRef;
    if (value != null) {
      result
        ..add('recruiter_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.addprimary;
    if (value != null) {
      result
        ..add('addprimary')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.addsecondary;
    if (value != null) {
      result
        ..add('addsecondary')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.workref;
    if (value != null) {
      result
        ..add('workref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.captainName;
    if (value != null) {
      result
        ..add('captain_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationId;
    if (value != null) {
      result
        ..add('organisation_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobWorkerId;
    if (value != null) {
      result
        ..add('job_worker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobApplied;
    if (value != null) {
      result
        ..add('job_applied')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(WorkerJobApplicationStruct)])));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dobforage;
    if (value != null) {
      result
        ..add('dobforage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employmentStatus;
    if (value != null) {
      result
        ..add('employment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.skillName;
    if (value != null) {
      result
        ..add('skill_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isPrimary;
    if (value != null) {
      result
        ..add('is_primary')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  WorkersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'User_Ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'full_name':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pin_code':
          result.pinCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'district':
          result.district = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'aadhar':
          result.aadhar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pan_number':
          result.panNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'account_name':
          result.accountName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'account_number':
          result.accountNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bank_name':
          result.bankName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ifsc_code':
          result.ifscCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'highest_qualification':
          result.highestQualification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'captain_scout_ref':
          result.captainScoutRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'addprimary':
          result.addprimary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'addsecondary':
          result.addsecondary = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'workref':
          result.workref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'captain_name':
          result.captainName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_id':
          result.organisationId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'job_worker_id':
          result.jobWorkerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'skills':
          result.skills.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AllSkillsStruct))!
              as AllSkillsStruct);
          break;
        case 'experiences':
          result.experiences.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AllExpeienceStruct))!
              as AllExpeienceStruct);
          break;
        case 'job_applied':
          result.jobApplied.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(WorkerJobApplicationStruct)
              ]))! as BuiltList<Object?>);
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dobforage':
          result.dobforage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'employment_status':
          result.employmentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'skill_name':
          result.skillName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_primary':
          result.isPrimary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$WorkersRecord extends WorkersRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? fullName;
  @override
  final String? phone;
  @override
  final String? dob;
  @override
  final String? email;
  @override
  final String? pinCode;
  @override
  final String? photo;
  @override
  final String? area;
  @override
  final String? district;
  @override
  final String? state;
  @override
  final String? aadhar;
  @override
  final String? panNumber;
  @override
  final String? accountName;
  @override
  final String? accountNumber;
  @override
  final String? bankName;
  @override
  final String? ifscCode;
  @override
  final String? highestQualification;
  @override
  final String? gender;
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? captainScoutRef;
  @override
  final bool? addprimary;
  @override
  final int? addsecondary;
  @override
  final DocumentReference<Object?>? workref;
  @override
  final String? captainName;
  @override
  final String? date;
  @override
  final DocumentReference<Object?>? organisationId;
  @override
  final DocumentReference<Object?>? jobWorkerId;
  @override
  final AllSkillsStruct skills;
  @override
  final AllExpeienceStruct experiences;
  @override
  final BuiltList<WorkerJobApplicationStruct>? jobApplied;
  @override
  final int? age;
  @override
  final String? dobforage;
  @override
  final String? employmentStatus;
  @override
  final String? skillName;
  @override
  final bool? isPrimary;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WorkersRecord([void Function(WorkersRecordBuilder)? updates]) =>
      (new WorkersRecordBuilder()..update(updates))._build();

  _$WorkersRecord._(
      {this.userRef,
      this.fullName,
      this.phone,
      this.dob,
      this.email,
      this.pinCode,
      this.photo,
      this.area,
      this.district,
      this.state,
      this.aadhar,
      this.panNumber,
      this.accountName,
      this.accountNumber,
      this.bankName,
      this.ifscCode,
      this.highestQualification,
      this.gender,
      this.createdDate,
      this.captainScoutRef,
      this.addprimary,
      this.addsecondary,
      this.workref,
      this.captainName,
      this.date,
      this.organisationId,
      this.jobWorkerId,
      required this.skills,
      required this.experiences,
      this.jobApplied,
      this.age,
      this.dobforage,
      this.employmentStatus,
      this.skillName,
      this.isPrimary,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(skills, r'WorkersRecord', 'skills');
    BuiltValueNullFieldError.checkNotNull(
        experiences, r'WorkersRecord', 'experiences');
  }

  @override
  WorkersRecord rebuild(void Function(WorkersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkersRecordBuilder toBuilder() => new WorkersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkersRecord &&
        userRef == other.userRef &&
        fullName == other.fullName &&
        phone == other.phone &&
        dob == other.dob &&
        email == other.email &&
        pinCode == other.pinCode &&
        photo == other.photo &&
        area == other.area &&
        district == other.district &&
        state == other.state &&
        aadhar == other.aadhar &&
        panNumber == other.panNumber &&
        accountName == other.accountName &&
        accountNumber == other.accountNumber &&
        bankName == other.bankName &&
        ifscCode == other.ifscCode &&
        highestQualification == other.highestQualification &&
        gender == other.gender &&
        createdDate == other.createdDate &&
        captainScoutRef == other.captainScoutRef &&
        addprimary == other.addprimary &&
        addsecondary == other.addsecondary &&
        workref == other.workref &&
        captainName == other.captainName &&
        date == other.date &&
        organisationId == other.organisationId &&
        jobWorkerId == other.jobWorkerId &&
        skills == other.skills &&
        experiences == other.experiences &&
        jobApplied == other.jobApplied &&
        age == other.age &&
        dobforage == other.dobforage &&
        employmentStatus == other.employmentStatus &&
        skillName == other.skillName &&
        isPrimary == other.isPrimary &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, dob.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, pinCode.hashCode);
    _$hash = $jc(_$hash, photo.hashCode);
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, aadhar.hashCode);
    _$hash = $jc(_$hash, panNumber.hashCode);
    _$hash = $jc(_$hash, accountName.hashCode);
    _$hash = $jc(_$hash, accountNumber.hashCode);
    _$hash = $jc(_$hash, bankName.hashCode);
    _$hash = $jc(_$hash, ifscCode.hashCode);
    _$hash = $jc(_$hash, highestQualification.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, captainScoutRef.hashCode);
    _$hash = $jc(_$hash, addprimary.hashCode);
    _$hash = $jc(_$hash, addsecondary.hashCode);
    _$hash = $jc(_$hash, workref.hashCode);
    _$hash = $jc(_$hash, captainName.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, organisationId.hashCode);
    _$hash = $jc(_$hash, jobWorkerId.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jc(_$hash, experiences.hashCode);
    _$hash = $jc(_$hash, jobApplied.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jc(_$hash, dobforage.hashCode);
    _$hash = $jc(_$hash, employmentStatus.hashCode);
    _$hash = $jc(_$hash, skillName.hashCode);
    _$hash = $jc(_$hash, isPrimary.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkersRecord')
          ..add('userRef', userRef)
          ..add('fullName', fullName)
          ..add('phone', phone)
          ..add('dob', dob)
          ..add('email', email)
          ..add('pinCode', pinCode)
          ..add('photo', photo)
          ..add('area', area)
          ..add('district', district)
          ..add('state', state)
          ..add('aadhar', aadhar)
          ..add('panNumber', panNumber)
          ..add('accountName', accountName)
          ..add('accountNumber', accountNumber)
          ..add('bankName', bankName)
          ..add('ifscCode', ifscCode)
          ..add('highestQualification', highestQualification)
          ..add('gender', gender)
          ..add('createdDate', createdDate)
          ..add('captainScoutRef', captainScoutRef)
          ..add('addprimary', addprimary)
          ..add('addsecondary', addsecondary)
          ..add('workref', workref)
          ..add('captainName', captainName)
          ..add('date', date)
          ..add('organisationId', organisationId)
          ..add('jobWorkerId', jobWorkerId)
          ..add('skills', skills)
          ..add('experiences', experiences)
          ..add('jobApplied', jobApplied)
          ..add('age', age)
          ..add('dobforage', dobforage)
          ..add('employmentStatus', employmentStatus)
          ..add('skillName', skillName)
          ..add('isPrimary', isPrimary)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WorkersRecordBuilder
    implements Builder<WorkersRecord, WorkersRecordBuilder> {
  _$WorkersRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _dob;
  String? get dob => _$this._dob;
  set dob(String? dob) => _$this._dob = dob;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _pinCode;
  String? get pinCode => _$this._pinCode;
  set pinCode(String? pinCode) => _$this._pinCode = pinCode;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _aadhar;
  String? get aadhar => _$this._aadhar;
  set aadhar(String? aadhar) => _$this._aadhar = aadhar;

  String? _panNumber;
  String? get panNumber => _$this._panNumber;
  set panNumber(String? panNumber) => _$this._panNumber = panNumber;

  String? _accountName;
  String? get accountName => _$this._accountName;
  set accountName(String? accountName) => _$this._accountName = accountName;

  String? _accountNumber;
  String? get accountNumber => _$this._accountNumber;
  set accountNumber(String? accountNumber) =>
      _$this._accountNumber = accountNumber;

  String? _bankName;
  String? get bankName => _$this._bankName;
  set bankName(String? bankName) => _$this._bankName = bankName;

  String? _ifscCode;
  String? get ifscCode => _$this._ifscCode;
  set ifscCode(String? ifscCode) => _$this._ifscCode = ifscCode;

  String? _highestQualification;
  String? get highestQualification => _$this._highestQualification;
  set highestQualification(String? highestQualification) =>
      _$this._highestQualification = highestQualification;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _captainScoutRef;
  DocumentReference<Object?>? get captainScoutRef => _$this._captainScoutRef;
  set captainScoutRef(DocumentReference<Object?>? captainScoutRef) =>
      _$this._captainScoutRef = captainScoutRef;

  bool? _addprimary;
  bool? get addprimary => _$this._addprimary;
  set addprimary(bool? addprimary) => _$this._addprimary = addprimary;

  int? _addsecondary;
  int? get addsecondary => _$this._addsecondary;
  set addsecondary(int? addsecondary) => _$this._addsecondary = addsecondary;

  DocumentReference<Object?>? _workref;
  DocumentReference<Object?>? get workref => _$this._workref;
  set workref(DocumentReference<Object?>? workref) => _$this._workref = workref;

  String? _captainName;
  String? get captainName => _$this._captainName;
  set captainName(String? captainName) => _$this._captainName = captainName;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  DocumentReference<Object?>? _organisationId;
  DocumentReference<Object?>? get organisationId => _$this._organisationId;
  set organisationId(DocumentReference<Object?>? organisationId) =>
      _$this._organisationId = organisationId;

  DocumentReference<Object?>? _jobWorkerId;
  DocumentReference<Object?>? get jobWorkerId => _$this._jobWorkerId;
  set jobWorkerId(DocumentReference<Object?>? jobWorkerId) =>
      _$this._jobWorkerId = jobWorkerId;

  AllSkillsStructBuilder? _skills;
  AllSkillsStructBuilder get skills =>
      _$this._skills ??= new AllSkillsStructBuilder();
  set skills(AllSkillsStructBuilder? skills) => _$this._skills = skills;

  AllExpeienceStructBuilder? _experiences;
  AllExpeienceStructBuilder get experiences =>
      _$this._experiences ??= new AllExpeienceStructBuilder();
  set experiences(AllExpeienceStructBuilder? experiences) =>
      _$this._experiences = experiences;

  ListBuilder<WorkerJobApplicationStruct>? _jobApplied;
  ListBuilder<WorkerJobApplicationStruct> get jobApplied =>
      _$this._jobApplied ??= new ListBuilder<WorkerJobApplicationStruct>();
  set jobApplied(ListBuilder<WorkerJobApplicationStruct>? jobApplied) =>
      _$this._jobApplied = jobApplied;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _dobforage;
  String? get dobforage => _$this._dobforage;
  set dobforage(String? dobforage) => _$this._dobforage = dobforage;

  String? _employmentStatus;
  String? get employmentStatus => _$this._employmentStatus;
  set employmentStatus(String? employmentStatus) =>
      _$this._employmentStatus = employmentStatus;

  String? _skillName;
  String? get skillName => _$this._skillName;
  set skillName(String? skillName) => _$this._skillName = skillName;

  bool? _isPrimary;
  bool? get isPrimary => _$this._isPrimary;
  set isPrimary(bool? isPrimary) => _$this._isPrimary = isPrimary;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WorkersRecordBuilder() {
    WorkersRecord._initializeBuilder(this);
  }

  WorkersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _fullName = $v.fullName;
      _phone = $v.phone;
      _dob = $v.dob;
      _email = $v.email;
      _pinCode = $v.pinCode;
      _photo = $v.photo;
      _area = $v.area;
      _district = $v.district;
      _state = $v.state;
      _aadhar = $v.aadhar;
      _panNumber = $v.panNumber;
      _accountName = $v.accountName;
      _accountNumber = $v.accountNumber;
      _bankName = $v.bankName;
      _ifscCode = $v.ifscCode;
      _highestQualification = $v.highestQualification;
      _gender = $v.gender;
      _createdDate = $v.createdDate;
      _captainScoutRef = $v.captainScoutRef;
      _addprimary = $v.addprimary;
      _addsecondary = $v.addsecondary;
      _workref = $v.workref;
      _captainName = $v.captainName;
      _date = $v.date;
      _organisationId = $v.organisationId;
      _jobWorkerId = $v.jobWorkerId;
      _skills = $v.skills.toBuilder();
      _experiences = $v.experiences.toBuilder();
      _jobApplied = $v.jobApplied?.toBuilder();
      _age = $v.age;
      _dobforage = $v.dobforage;
      _employmentStatus = $v.employmentStatus;
      _skillName = $v.skillName;
      _isPrimary = $v.isPrimary;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkersRecord;
  }

  @override
  void update(void Function(WorkersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkersRecord build() => _build();

  _$WorkersRecord _build() {
    _$WorkersRecord _$result;
    try {
      _$result = _$v ??
          new _$WorkersRecord._(
              userRef: userRef,
              fullName: fullName,
              phone: phone,
              dob: dob,
              email: email,
              pinCode: pinCode,
              photo: photo,
              area: area,
              district: district,
              state: state,
              aadhar: aadhar,
              panNumber: panNumber,
              accountName: accountName,
              accountNumber: accountNumber,
              bankName: bankName,
              ifscCode: ifscCode,
              highestQualification: highestQualification,
              gender: gender,
              createdDate: createdDate,
              captainScoutRef: captainScoutRef,
              addprimary: addprimary,
              addsecondary: addsecondary,
              workref: workref,
              captainName: captainName,
              date: date,
              organisationId: organisationId,
              jobWorkerId: jobWorkerId,
              skills: skills.build(),
              experiences: experiences.build(),
              jobApplied: _jobApplied?.build(),
              age: age,
              dobforage: dobforage,
              employmentStatus: employmentStatus,
              skillName: skillName,
              isPrimary: isPrimary,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skills';
        skills.build();
        _$failedField = 'experiences';
        experiences.build();
        _$failedField = 'jobApplied';
        _jobApplied?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WorkersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
