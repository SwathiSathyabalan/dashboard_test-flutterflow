// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_worker_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobWorkerRecord> _$jobWorkerRecordSerializer =
    new _$JobWorkerRecordSerializer();

class _$JobWorkerRecordSerializer
    implements StructuredSerializer<JobWorkerRecord> {
  @override
  final Iterable<Type> types = const [JobWorkerRecord, _$JobWorkerRecord];
  @override
  final String wireName = 'JobWorkerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JobWorkerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.salary;
    if (value != null) {
      result
        ..add('salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerId;
    if (value != null) {
      result
        ..add('worker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.contractSigned;
    if (value != null) {
      result
        ..add('contract_signed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.orgReference;
    if (value != null) {
      result
        ..add('org_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobReference;
    if (value != null) {
      result
        ..add('job_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobName;
    if (value != null) {
      result
        ..add('job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keySkill;
    if (value != null) {
      result
        ..add('key_skill')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgName;
    if (value != null) {
      result
        ..add('org_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appliedDate;
    if (value != null) {
      result
        ..add('applied_date')
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
    value = object.workerArea;
    if (value != null) {
      result
        ..add('worker_area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerName;
    if (value != null) {
      result
        ..add('worker_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerPhoto;
    if (value != null) {
      result
        ..add('worker_photo')
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
    value = object.jobPhoto;
    if (value != null) {
      result
        ..add('job_photo')
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
  JobWorkerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobWorkerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_id':
          result.workerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'contract_signed':
          result.contractSigned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'org_reference':
          result.orgReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'job_reference':
          result.jobReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'job_name':
          result.jobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'key_skill':
          result.keySkill = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_name':
          result.orgName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'applied_date':
          result.appliedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_area':
          result.workerArea = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_name':
          result.workerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_photo':
          result.workerPhoto = serializers.deserialize(value,
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
        case 'job_photo':
          result.jobPhoto = serializers.deserialize(value,
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

class _$JobWorkerRecord extends JobWorkerRecord {
  @override
  final String? salary;
  @override
  final DocumentReference<Object?>? workerId;
  @override
  final bool? contractSigned;
  @override
  final DocumentReference<Object?>? orgReference;
  @override
  final DocumentReference<Object?>? jobReference;
  @override
  final String? jobName;
  @override
  final String? keySkill;
  @override
  final String? orgName;
  @override
  final DateTime? appliedDate;
  @override
  final String? gender;
  @override
  final String? workerArea;
  @override
  final String? workerName;
  @override
  final String? workerPhoto;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? jobPhoto;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobWorkerRecord([void Function(JobWorkerRecordBuilder)? updates]) =>
      (new JobWorkerRecordBuilder()..update(updates))._build();

  _$JobWorkerRecord._(
      {this.salary,
      this.workerId,
      this.contractSigned,
      this.orgReference,
      this.jobReference,
      this.jobName,
      this.keySkill,
      this.orgName,
      this.appliedDate,
      this.gender,
      this.workerArea,
      this.workerName,
      this.workerPhoto,
      this.startDate,
      this.endDate,
      this.jobPhoto,
      this.ffRef})
      : super._();

  @override
  JobWorkerRecord rebuild(void Function(JobWorkerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobWorkerRecordBuilder toBuilder() =>
      new JobWorkerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobWorkerRecord &&
        salary == other.salary &&
        workerId == other.workerId &&
        contractSigned == other.contractSigned &&
        orgReference == other.orgReference &&
        jobReference == other.jobReference &&
        jobName == other.jobName &&
        keySkill == other.keySkill &&
        orgName == other.orgName &&
        appliedDate == other.appliedDate &&
        gender == other.gender &&
        workerArea == other.workerArea &&
        workerName == other.workerName &&
        workerPhoto == other.workerPhoto &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        jobPhoto == other.jobPhoto &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, salary.hashCode);
    _$hash = $jc(_$hash, workerId.hashCode);
    _$hash = $jc(_$hash, contractSigned.hashCode);
    _$hash = $jc(_$hash, orgReference.hashCode);
    _$hash = $jc(_$hash, jobReference.hashCode);
    _$hash = $jc(_$hash, jobName.hashCode);
    _$hash = $jc(_$hash, keySkill.hashCode);
    _$hash = $jc(_$hash, orgName.hashCode);
    _$hash = $jc(_$hash, appliedDate.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, workerArea.hashCode);
    _$hash = $jc(_$hash, workerName.hashCode);
    _$hash = $jc(_$hash, workerPhoto.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, jobPhoto.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobWorkerRecord')
          ..add('salary', salary)
          ..add('workerId', workerId)
          ..add('contractSigned', contractSigned)
          ..add('orgReference', orgReference)
          ..add('jobReference', jobReference)
          ..add('jobName', jobName)
          ..add('keySkill', keySkill)
          ..add('orgName', orgName)
          ..add('appliedDate', appliedDate)
          ..add('gender', gender)
          ..add('workerArea', workerArea)
          ..add('workerName', workerName)
          ..add('workerPhoto', workerPhoto)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('jobPhoto', jobPhoto)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobWorkerRecordBuilder
    implements Builder<JobWorkerRecord, JobWorkerRecordBuilder> {
  _$JobWorkerRecord? _$v;

  String? _salary;
  String? get salary => _$this._salary;
  set salary(String? salary) => _$this._salary = salary;

  DocumentReference<Object?>? _workerId;
  DocumentReference<Object?>? get workerId => _$this._workerId;
  set workerId(DocumentReference<Object?>? workerId) =>
      _$this._workerId = workerId;

  bool? _contractSigned;
  bool? get contractSigned => _$this._contractSigned;
  set contractSigned(bool? contractSigned) =>
      _$this._contractSigned = contractSigned;

  DocumentReference<Object?>? _orgReference;
  DocumentReference<Object?>? get orgReference => _$this._orgReference;
  set orgReference(DocumentReference<Object?>? orgReference) =>
      _$this._orgReference = orgReference;

  DocumentReference<Object?>? _jobReference;
  DocumentReference<Object?>? get jobReference => _$this._jobReference;
  set jobReference(DocumentReference<Object?>? jobReference) =>
      _$this._jobReference = jobReference;

  String? _jobName;
  String? get jobName => _$this._jobName;
  set jobName(String? jobName) => _$this._jobName = jobName;

  String? _keySkill;
  String? get keySkill => _$this._keySkill;
  set keySkill(String? keySkill) => _$this._keySkill = keySkill;

  String? _orgName;
  String? get orgName => _$this._orgName;
  set orgName(String? orgName) => _$this._orgName = orgName;

  DateTime? _appliedDate;
  DateTime? get appliedDate => _$this._appliedDate;
  set appliedDate(DateTime? appliedDate) => _$this._appliedDate = appliedDate;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _workerArea;
  String? get workerArea => _$this._workerArea;
  set workerArea(String? workerArea) => _$this._workerArea = workerArea;

  String? _workerName;
  String? get workerName => _$this._workerName;
  set workerName(String? workerName) => _$this._workerName = workerName;

  String? _workerPhoto;
  String? get workerPhoto => _$this._workerPhoto;
  set workerPhoto(String? workerPhoto) => _$this._workerPhoto = workerPhoto;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  String? _jobPhoto;
  String? get jobPhoto => _$this._jobPhoto;
  set jobPhoto(String? jobPhoto) => _$this._jobPhoto = jobPhoto;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobWorkerRecordBuilder() {
    JobWorkerRecord._initializeBuilder(this);
  }

  JobWorkerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _salary = $v.salary;
      _workerId = $v.workerId;
      _contractSigned = $v.contractSigned;
      _orgReference = $v.orgReference;
      _jobReference = $v.jobReference;
      _jobName = $v.jobName;
      _keySkill = $v.keySkill;
      _orgName = $v.orgName;
      _appliedDate = $v.appliedDate;
      _gender = $v.gender;
      _workerArea = $v.workerArea;
      _workerName = $v.workerName;
      _workerPhoto = $v.workerPhoto;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _jobPhoto = $v.jobPhoto;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobWorkerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobWorkerRecord;
  }

  @override
  void update(void Function(JobWorkerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobWorkerRecord build() => _build();

  _$JobWorkerRecord _build() {
    final _$result = _$v ??
        new _$JobWorkerRecord._(
            salary: salary,
            workerId: workerId,
            contractSigned: contractSigned,
            orgReference: orgReference,
            jobReference: jobReference,
            jobName: jobName,
            keySkill: keySkill,
            orgName: orgName,
            appliedDate: appliedDate,
            gender: gender,
            workerArea: workerArea,
            workerName: workerName,
            workerPhoto: workerPhoto,
            startDate: startDate,
            endDate: endDate,
            jobPhoto: jobPhoto,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
