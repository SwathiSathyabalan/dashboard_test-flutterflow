// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_job_application_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkerJobApplicationStruct> _$workerJobApplicationStructSerializer =
    new _$WorkerJobApplicationStructSerializer();

class _$WorkerJobApplicationStructSerializer
    implements StructuredSerializer<WorkerJobApplicationStruct> {
  @override
  final Iterable<Type> types = const [
    WorkerJobApplicationStruct,
    _$WorkerJobApplicationStruct
  ];
  @override
  final String wireName = 'WorkerJobApplicationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WorkerJobApplicationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.appliedOn;
    if (value != null) {
      result
        ..add('applied_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.applicationStatus;
    if (value != null) {
      result
        ..add('application_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  WorkerJobApplicationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkerJobApplicationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'applied_on':
          result.appliedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'application_status':
          result.applicationStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$WorkerJobApplicationStruct extends WorkerJobApplicationStruct {
  @override
  final DocumentReference<Object?>? jobId;
  @override
  final DateTime? appliedOn;
  @override
  final int? applicationStatus;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WorkerJobApplicationStruct(
          [void Function(WorkerJobApplicationStructBuilder)? updates]) =>
      (new WorkerJobApplicationStructBuilder()..update(updates))._build();

  _$WorkerJobApplicationStruct._(
      {this.jobId,
      this.appliedOn,
      this.applicationStatus,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WorkerJobApplicationStruct', 'firestoreUtilData');
  }

  @override
  WorkerJobApplicationStruct rebuild(
          void Function(WorkerJobApplicationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkerJobApplicationStructBuilder toBuilder() =>
      new WorkerJobApplicationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkerJobApplicationStruct &&
        jobId == other.jobId &&
        appliedOn == other.appliedOn &&
        applicationStatus == other.applicationStatus &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, appliedOn.hashCode);
    _$hash = $jc(_$hash, applicationStatus.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkerJobApplicationStruct')
          ..add('jobId', jobId)
          ..add('appliedOn', appliedOn)
          ..add('applicationStatus', applicationStatus)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WorkerJobApplicationStructBuilder
    implements
        Builder<WorkerJobApplicationStruct, WorkerJobApplicationStructBuilder> {
  _$WorkerJobApplicationStruct? _$v;

  DocumentReference<Object?>? _jobId;
  DocumentReference<Object?>? get jobId => _$this._jobId;
  set jobId(DocumentReference<Object?>? jobId) => _$this._jobId = jobId;

  DateTime? _appliedOn;
  DateTime? get appliedOn => _$this._appliedOn;
  set appliedOn(DateTime? appliedOn) => _$this._appliedOn = appliedOn;

  int? _applicationStatus;
  int? get applicationStatus => _$this._applicationStatus;
  set applicationStatus(int? applicationStatus) =>
      _$this._applicationStatus = applicationStatus;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WorkerJobApplicationStructBuilder() {
    WorkerJobApplicationStruct._initializeBuilder(this);
  }

  WorkerJobApplicationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobId = $v.jobId;
      _appliedOn = $v.appliedOn;
      _applicationStatus = $v.applicationStatus;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkerJobApplicationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkerJobApplicationStruct;
  }

  @override
  void update(void Function(WorkerJobApplicationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkerJobApplicationStruct build() => _build();

  _$WorkerJobApplicationStruct _build() {
    final _$result = _$v ??
        new _$WorkerJobApplicationStruct._(
            jobId: jobId,
            appliedOn: appliedOn,
            applicationStatus: applicationStatus,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'WorkerJobApplicationStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
