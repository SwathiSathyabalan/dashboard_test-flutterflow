// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobsRecord> _$jobsRecordSerializer = new _$JobsRecordSerializer();

class _$JobsRecordSerializer implements StructuredSerializer<JobsRecord> {
  @override
  final Iterable<Type> types = const [JobsRecord, _$JobsRecord];
  @override
  final String wireName = 'JobsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JobsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'application',
      serializers.serialize(object.application,
          specifiedType: const FullType(JobApplicationStruct)),
    ];
    Object? value;
    value = object.jobDescription;
    if (value != null) {
      result
        ..add('job_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobImage;
    if (value != null) {
      result
        ..add('job_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.primarySkillLevel;
    if (value != null) {
      result
        ..add('primary_skill_level')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationName;
    if (value != null) {
      result
        ..add('organisation_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('job_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modeOfSalary;
    if (value != null) {
      result
        ..add('mode_of_salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobCategory;
    if (value != null) {
      result
        ..add('job_category')
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
    value = object.jobApplicationCollection;
    if (value != null) {
      result
        ..add('job_application_collection')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.applicationList;
    if (value != null) {
      result
        ..add('application_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workingHours;
    if (value != null) {
      result
        ..add('working_hours')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minSalary;
    if (value != null) {
      result
        ..add('min_salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxSalary;
    if (value != null) {
      result
        ..add('max_salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minAge;
    if (value != null) {
      result
        ..add('min_age')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxAge;
    if (value != null) {
      result
        ..add('max_age')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.food;
    if (value != null) {
      result
        ..add('food')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lodging;
    if (value != null) {
      result
        ..add('lodging')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transportation;
    if (value != null) {
      result
        ..add('transportation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.medical;
    if (value != null) {
      result
        ..add('medical')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobSubCateg;
    if (value != null) {
      result
        ..add('job_sub_categ')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgRefId;
    if (value != null) {
      result
        ..add('org_ref_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.minQualification;
    if (value != null) {
      result
        ..add('min_qualification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.applications;
    if (value != null) {
      result
        ..add('applications')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(JobApplicationStruct)])));
    }
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobStatus;
    if (value != null) {
      result
        ..add('job_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerId;
    if (value != null) {
      result
        ..add('worker_id')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.numberOfVacancies;
    if (value != null) {
      result
        ..add('number_of_vacancies')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.filled;
    if (value != null) {
      result
        ..add('filled')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.open;
    if (value != null) {
      result
        ..add('open')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  JobsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'job_description':
          result.jobDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_image':
          result.jobImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primary_skill_level':
          result.primarySkillLevel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_name':
          result.organisationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_title':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mode_of_salary':
          result.modeOfSalary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_category':
          result.jobCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pin_code':
          result.pinCode = serializers.deserialize(value,
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
        case 'job_application_collection':
          result.jobApplicationCollection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'application_list':
          result.applicationList = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'working_hours':
          result.workingHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'min_salary':
          result.minSalary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'max_salary':
          result.maxSalary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'min_age':
          result.minAge = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'max_age':
          result.maxAge = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'food':
          result.food = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lodging':
          result.lodging = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transportation':
          result.transportation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'medical':
          result.medical = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_sub_categ':
          result.jobSubCateg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_ref_id':
          result.orgRefId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'min_qualification':
          result.minQualification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'application':
          result.application.replace(serializers.deserialize(value,
                  specifiedType: const FullType(JobApplicationStruct))!
              as JobApplicationStruct);
          break;
        case 'applications':
          result.applications.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(JobApplicationStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'job_status':
          result.jobStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_id':
          result.workerId.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'number_of_vacancies':
          result.numberOfVacancies = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'filled':
          result.filled = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'open':
          result.open = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$JobsRecord extends JobsRecord {
  @override
  final String? jobDescription;
  @override
  final String? jobImage;
  @override
  final String? primarySkillLevel;
  @override
  final String? organisationName;
  @override
  final String? jobTitle;
  @override
  final String? modeOfSalary;
  @override
  final String? jobCategory;
  @override
  final String? pinCode;
  @override
  final String? area;
  @override
  final String? district;
  @override
  final String? state;
  @override
  final String? jobApplicationCollection;
  @override
  final String? applicationList;
  @override
  final String? workingHours;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? gender;
  @override
  final String? minSalary;
  @override
  final String? maxSalary;
  @override
  final String? minAge;
  @override
  final String? maxAge;
  @override
  final String? food;
  @override
  final String? lodging;
  @override
  final String? transportation;
  @override
  final String? medical;
  @override
  final String? jobSubCateg;
  @override
  final DocumentReference<Object?>? orgRefId;
  @override
  final String? minQualification;
  @override
  final JobApplicationStruct application;
  @override
  final BuiltList<JobApplicationStruct>? applications;
  @override
  final DocumentReference<Object?>? jobId;
  @override
  final String? jobStatus;
  @override
  final BuiltList<String>? workerId;
  @override
  final int? numberOfVacancies;
  @override
  final int? filled;
  @override
  final int? open;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobsRecord([void Function(JobsRecordBuilder)? updates]) =>
      (new JobsRecordBuilder()..update(updates))._build();

  _$JobsRecord._(
      {this.jobDescription,
      this.jobImage,
      this.primarySkillLevel,
      this.organisationName,
      this.jobTitle,
      this.modeOfSalary,
      this.jobCategory,
      this.pinCode,
      this.area,
      this.district,
      this.state,
      this.jobApplicationCollection,
      this.applicationList,
      this.workingHours,
      this.startDate,
      this.endDate,
      this.gender,
      this.minSalary,
      this.maxSalary,
      this.minAge,
      this.maxAge,
      this.food,
      this.lodging,
      this.transportation,
      this.medical,
      this.jobSubCateg,
      this.orgRefId,
      this.minQualification,
      required this.application,
      this.applications,
      this.jobId,
      this.jobStatus,
      this.workerId,
      this.numberOfVacancies,
      this.filled,
      this.open,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        application, r'JobsRecord', 'application');
  }

  @override
  JobsRecord rebuild(void Function(JobsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobsRecordBuilder toBuilder() => new JobsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobsRecord &&
        jobDescription == other.jobDescription &&
        jobImage == other.jobImage &&
        primarySkillLevel == other.primarySkillLevel &&
        organisationName == other.organisationName &&
        jobTitle == other.jobTitle &&
        modeOfSalary == other.modeOfSalary &&
        jobCategory == other.jobCategory &&
        pinCode == other.pinCode &&
        area == other.area &&
        district == other.district &&
        state == other.state &&
        jobApplicationCollection == other.jobApplicationCollection &&
        applicationList == other.applicationList &&
        workingHours == other.workingHours &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        gender == other.gender &&
        minSalary == other.minSalary &&
        maxSalary == other.maxSalary &&
        minAge == other.minAge &&
        maxAge == other.maxAge &&
        food == other.food &&
        lodging == other.lodging &&
        transportation == other.transportation &&
        medical == other.medical &&
        jobSubCateg == other.jobSubCateg &&
        orgRefId == other.orgRefId &&
        minQualification == other.minQualification &&
        application == other.application &&
        applications == other.applications &&
        jobId == other.jobId &&
        jobStatus == other.jobStatus &&
        workerId == other.workerId &&
        numberOfVacancies == other.numberOfVacancies &&
        filled == other.filled &&
        open == other.open &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jobDescription.hashCode);
    _$hash = $jc(_$hash, jobImage.hashCode);
    _$hash = $jc(_$hash, primarySkillLevel.hashCode);
    _$hash = $jc(_$hash, organisationName.hashCode);
    _$hash = $jc(_$hash, jobTitle.hashCode);
    _$hash = $jc(_$hash, modeOfSalary.hashCode);
    _$hash = $jc(_$hash, jobCategory.hashCode);
    _$hash = $jc(_$hash, pinCode.hashCode);
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jc(_$hash, district.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, jobApplicationCollection.hashCode);
    _$hash = $jc(_$hash, applicationList.hashCode);
    _$hash = $jc(_$hash, workingHours.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, minSalary.hashCode);
    _$hash = $jc(_$hash, maxSalary.hashCode);
    _$hash = $jc(_$hash, minAge.hashCode);
    _$hash = $jc(_$hash, maxAge.hashCode);
    _$hash = $jc(_$hash, food.hashCode);
    _$hash = $jc(_$hash, lodging.hashCode);
    _$hash = $jc(_$hash, transportation.hashCode);
    _$hash = $jc(_$hash, medical.hashCode);
    _$hash = $jc(_$hash, jobSubCateg.hashCode);
    _$hash = $jc(_$hash, orgRefId.hashCode);
    _$hash = $jc(_$hash, minQualification.hashCode);
    _$hash = $jc(_$hash, application.hashCode);
    _$hash = $jc(_$hash, applications.hashCode);
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, jobStatus.hashCode);
    _$hash = $jc(_$hash, workerId.hashCode);
    _$hash = $jc(_$hash, numberOfVacancies.hashCode);
    _$hash = $jc(_$hash, filled.hashCode);
    _$hash = $jc(_$hash, open.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobsRecord')
          ..add('jobDescription', jobDescription)
          ..add('jobImage', jobImage)
          ..add('primarySkillLevel', primarySkillLevel)
          ..add('organisationName', organisationName)
          ..add('jobTitle', jobTitle)
          ..add('modeOfSalary', modeOfSalary)
          ..add('jobCategory', jobCategory)
          ..add('pinCode', pinCode)
          ..add('area', area)
          ..add('district', district)
          ..add('state', state)
          ..add('jobApplicationCollection', jobApplicationCollection)
          ..add('applicationList', applicationList)
          ..add('workingHours', workingHours)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('gender', gender)
          ..add('minSalary', minSalary)
          ..add('maxSalary', maxSalary)
          ..add('minAge', minAge)
          ..add('maxAge', maxAge)
          ..add('food', food)
          ..add('lodging', lodging)
          ..add('transportation', transportation)
          ..add('medical', medical)
          ..add('jobSubCateg', jobSubCateg)
          ..add('orgRefId', orgRefId)
          ..add('minQualification', minQualification)
          ..add('application', application)
          ..add('applications', applications)
          ..add('jobId', jobId)
          ..add('jobStatus', jobStatus)
          ..add('workerId', workerId)
          ..add('numberOfVacancies', numberOfVacancies)
          ..add('filled', filled)
          ..add('open', open)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobsRecordBuilder implements Builder<JobsRecord, JobsRecordBuilder> {
  _$JobsRecord? _$v;

  String? _jobDescription;
  String? get jobDescription => _$this._jobDescription;
  set jobDescription(String? jobDescription) =>
      _$this._jobDescription = jobDescription;

  String? _jobImage;
  String? get jobImage => _$this._jobImage;
  set jobImage(String? jobImage) => _$this._jobImage = jobImage;

  String? _primarySkillLevel;
  String? get primarySkillLevel => _$this._primarySkillLevel;
  set primarySkillLevel(String? primarySkillLevel) =>
      _$this._primarySkillLevel = primarySkillLevel;

  String? _organisationName;
  String? get organisationName => _$this._organisationName;
  set organisationName(String? organisationName) =>
      _$this._organisationName = organisationName;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _modeOfSalary;
  String? get modeOfSalary => _$this._modeOfSalary;
  set modeOfSalary(String? modeOfSalary) => _$this._modeOfSalary = modeOfSalary;

  String? _jobCategory;
  String? get jobCategory => _$this._jobCategory;
  set jobCategory(String? jobCategory) => _$this._jobCategory = jobCategory;

  String? _pinCode;
  String? get pinCode => _$this._pinCode;
  set pinCode(String? pinCode) => _$this._pinCode = pinCode;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  String? _district;
  String? get district => _$this._district;
  set district(String? district) => _$this._district = district;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _jobApplicationCollection;
  String? get jobApplicationCollection => _$this._jobApplicationCollection;
  set jobApplicationCollection(String? jobApplicationCollection) =>
      _$this._jobApplicationCollection = jobApplicationCollection;

  String? _applicationList;
  String? get applicationList => _$this._applicationList;
  set applicationList(String? applicationList) =>
      _$this._applicationList = applicationList;

  String? _workingHours;
  String? get workingHours => _$this._workingHours;
  set workingHours(String? workingHours) => _$this._workingHours = workingHours;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _minSalary;
  String? get minSalary => _$this._minSalary;
  set minSalary(String? minSalary) => _$this._minSalary = minSalary;

  String? _maxSalary;
  String? get maxSalary => _$this._maxSalary;
  set maxSalary(String? maxSalary) => _$this._maxSalary = maxSalary;

  String? _minAge;
  String? get minAge => _$this._minAge;
  set minAge(String? minAge) => _$this._minAge = minAge;

  String? _maxAge;
  String? get maxAge => _$this._maxAge;
  set maxAge(String? maxAge) => _$this._maxAge = maxAge;

  String? _food;
  String? get food => _$this._food;
  set food(String? food) => _$this._food = food;

  String? _lodging;
  String? get lodging => _$this._lodging;
  set lodging(String? lodging) => _$this._lodging = lodging;

  String? _transportation;
  String? get transportation => _$this._transportation;
  set transportation(String? transportation) =>
      _$this._transportation = transportation;

  String? _medical;
  String? get medical => _$this._medical;
  set medical(String? medical) => _$this._medical = medical;

  String? _jobSubCateg;
  String? get jobSubCateg => _$this._jobSubCateg;
  set jobSubCateg(String? jobSubCateg) => _$this._jobSubCateg = jobSubCateg;

  DocumentReference<Object?>? _orgRefId;
  DocumentReference<Object?>? get orgRefId => _$this._orgRefId;
  set orgRefId(DocumentReference<Object?>? orgRefId) =>
      _$this._orgRefId = orgRefId;

  String? _minQualification;
  String? get minQualification => _$this._minQualification;
  set minQualification(String? minQualification) =>
      _$this._minQualification = minQualification;

  JobApplicationStructBuilder? _application;
  JobApplicationStructBuilder get application =>
      _$this._application ??= new JobApplicationStructBuilder();
  set application(JobApplicationStructBuilder? application) =>
      _$this._application = application;

  ListBuilder<JobApplicationStruct>? _applications;
  ListBuilder<JobApplicationStruct> get applications =>
      _$this._applications ??= new ListBuilder<JobApplicationStruct>();
  set applications(ListBuilder<JobApplicationStruct>? applications) =>
      _$this._applications = applications;

  DocumentReference<Object?>? _jobId;
  DocumentReference<Object?>? get jobId => _$this._jobId;
  set jobId(DocumentReference<Object?>? jobId) => _$this._jobId = jobId;

  String? _jobStatus;
  String? get jobStatus => _$this._jobStatus;
  set jobStatus(String? jobStatus) => _$this._jobStatus = jobStatus;

  ListBuilder<String>? _workerId;
  ListBuilder<String> get workerId =>
      _$this._workerId ??= new ListBuilder<String>();
  set workerId(ListBuilder<String>? workerId) => _$this._workerId = workerId;

  int? _numberOfVacancies;
  int? get numberOfVacancies => _$this._numberOfVacancies;
  set numberOfVacancies(int? numberOfVacancies) =>
      _$this._numberOfVacancies = numberOfVacancies;

  int? _filled;
  int? get filled => _$this._filled;
  set filled(int? filled) => _$this._filled = filled;

  int? _open;
  int? get open => _$this._open;
  set open(int? open) => _$this._open = open;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobsRecordBuilder() {
    JobsRecord._initializeBuilder(this);
  }

  JobsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobDescription = $v.jobDescription;
      _jobImage = $v.jobImage;
      _primarySkillLevel = $v.primarySkillLevel;
      _organisationName = $v.organisationName;
      _jobTitle = $v.jobTitle;
      _modeOfSalary = $v.modeOfSalary;
      _jobCategory = $v.jobCategory;
      _pinCode = $v.pinCode;
      _area = $v.area;
      _district = $v.district;
      _state = $v.state;
      _jobApplicationCollection = $v.jobApplicationCollection;
      _applicationList = $v.applicationList;
      _workingHours = $v.workingHours;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _gender = $v.gender;
      _minSalary = $v.minSalary;
      _maxSalary = $v.maxSalary;
      _minAge = $v.minAge;
      _maxAge = $v.maxAge;
      _food = $v.food;
      _lodging = $v.lodging;
      _transportation = $v.transportation;
      _medical = $v.medical;
      _jobSubCateg = $v.jobSubCateg;
      _orgRefId = $v.orgRefId;
      _minQualification = $v.minQualification;
      _application = $v.application.toBuilder();
      _applications = $v.applications?.toBuilder();
      _jobId = $v.jobId;
      _jobStatus = $v.jobStatus;
      _workerId = $v.workerId?.toBuilder();
      _numberOfVacancies = $v.numberOfVacancies;
      _filled = $v.filled;
      _open = $v.open;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobsRecord;
  }

  @override
  void update(void Function(JobsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobsRecord build() => _build();

  _$JobsRecord _build() {
    _$JobsRecord _$result;
    try {
      _$result = _$v ??
          new _$JobsRecord._(
              jobDescription: jobDescription,
              jobImage: jobImage,
              primarySkillLevel: primarySkillLevel,
              organisationName: organisationName,
              jobTitle: jobTitle,
              modeOfSalary: modeOfSalary,
              jobCategory: jobCategory,
              pinCode: pinCode,
              area: area,
              district: district,
              state: state,
              jobApplicationCollection: jobApplicationCollection,
              applicationList: applicationList,
              workingHours: workingHours,
              startDate: startDate,
              endDate: endDate,
              gender: gender,
              minSalary: minSalary,
              maxSalary: maxSalary,
              minAge: minAge,
              maxAge: maxAge,
              food: food,
              lodging: lodging,
              transportation: transportation,
              medical: medical,
              jobSubCateg: jobSubCateg,
              orgRefId: orgRefId,
              minQualification: minQualification,
              application: application.build(),
              applications: _applications?.build(),
              jobId: jobId,
              jobStatus: jobStatus,
              workerId: _workerId?.build(),
              numberOfVacancies: numberOfVacancies,
              filled: filled,
              open: open,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'application';
        application.build();
        _$failedField = 'applications';
        _applications?.build();

        _$failedField = 'workerId';
        _workerId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'JobsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
