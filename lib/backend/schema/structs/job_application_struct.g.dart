// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobApplicationStruct> _$jobApplicationStructSerializer =
    new _$JobApplicationStructSerializer();

class _$JobApplicationStructSerializer
    implements StructuredSerializer<JobApplicationStruct> {
  @override
  final Iterable<Type> types = const [
    JobApplicationStruct,
    _$JobApplicationStruct
  ];
  @override
  final String wireName = 'JobApplicationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, JobApplicationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.workerId;
    if (value != null) {
      result
        ..add('worker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.appliedOn;
    if (value != null) {
      result
        ..add('Applied_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.applicationStatus;
    if (value != null) {
      result
        ..add('application_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.workerName;
    if (value != null) {
      result
        ..add('worker_name')
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
    value = object.area;
    if (value != null) {
      result
        ..add('area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  JobApplicationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobApplicationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'worker_id':
          result.workerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Applied_on':
          result.appliedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'application_status':
          result.applicationStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'worker_name':
          result.workerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$JobApplicationStruct extends JobApplicationStruct {
  @override
  final DocumentReference<Object?>? workerId;
  @override
  final DateTime? appliedOn;
  @override
  final int? applicationStatus;
  @override
  final String? workerName;
  @override
  final String? gender;
  @override
  final String? area;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$JobApplicationStruct(
          [void Function(JobApplicationStructBuilder)? updates]) =>
      (new JobApplicationStructBuilder()..update(updates))._build();

  _$JobApplicationStruct._(
      {this.workerId,
      this.appliedOn,
      this.applicationStatus,
      this.workerName,
      this.gender,
      this.area,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'JobApplicationStruct', 'firestoreUtilData');
  }

  @override
  JobApplicationStruct rebuild(
          void Function(JobApplicationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobApplicationStructBuilder toBuilder() =>
      new JobApplicationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobApplicationStruct &&
        workerId == other.workerId &&
        appliedOn == other.appliedOn &&
        applicationStatus == other.applicationStatus &&
        workerName == other.workerName &&
        gender == other.gender &&
        area == other.area &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workerId.hashCode);
    _$hash = $jc(_$hash, appliedOn.hashCode);
    _$hash = $jc(_$hash, applicationStatus.hashCode);
    _$hash = $jc(_$hash, workerName.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, area.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobApplicationStruct')
          ..add('workerId', workerId)
          ..add('appliedOn', appliedOn)
          ..add('applicationStatus', applicationStatus)
          ..add('workerName', workerName)
          ..add('gender', gender)
          ..add('area', area)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class JobApplicationStructBuilder
    implements Builder<JobApplicationStruct, JobApplicationStructBuilder> {
  _$JobApplicationStruct? _$v;

  DocumentReference<Object?>? _workerId;
  DocumentReference<Object?>? get workerId => _$this._workerId;
  set workerId(DocumentReference<Object?>? workerId) =>
      _$this._workerId = workerId;

  DateTime? _appliedOn;
  DateTime? get appliedOn => _$this._appliedOn;
  set appliedOn(DateTime? appliedOn) => _$this._appliedOn = appliedOn;

  int? _applicationStatus;
  int? get applicationStatus => _$this._applicationStatus;
  set applicationStatus(int? applicationStatus) =>
      _$this._applicationStatus = applicationStatus;

  String? _workerName;
  String? get workerName => _$this._workerName;
  set workerName(String? workerName) => _$this._workerName = workerName;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  JobApplicationStructBuilder() {
    JobApplicationStruct._initializeBuilder(this);
  }

  JobApplicationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workerId = $v.workerId;
      _appliedOn = $v.appliedOn;
      _applicationStatus = $v.applicationStatus;
      _workerName = $v.workerName;
      _gender = $v.gender;
      _area = $v.area;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobApplicationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobApplicationStruct;
  }

  @override
  void update(void Function(JobApplicationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobApplicationStruct build() => _build();

  _$JobApplicationStruct _build() {
    final _$result = _$v ??
        new _$JobApplicationStruct._(
            workerId: workerId,
            appliedOn: appliedOn,
            applicationStatus: applicationStatus,
            workerName: workerName,
            gender: gender,
            area: area,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'JobApplicationStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
