// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_contracts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmploymentContractsRecord> _$employmentContractsRecordSerializer =
    new _$EmploymentContractsRecordSerializer();

class _$EmploymentContractsRecordSerializer
    implements StructuredSerializer<EmploymentContractsRecord> {
  @override
  final Iterable<Type> types = const [
    EmploymentContractsRecord,
    _$EmploymentContractsRecord
  ];
  @override
  final String wireName = 'EmploymentContractsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EmploymentContractsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.organisationId;
    if (value != null) {
      result
        ..add('organisation_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
    value = object.salary;
    if (value != null) {
      result
        ..add('salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.salaryType;
    if (value != null) {
      result
        ..add('salary_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isContractSigned;
    if (value != null) {
      result
        ..add('is_contract_signed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workerId;
    if (value != null) {
      result
        ..add('worker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  EmploymentContractsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmploymentContractsRecordBuilder();

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
        case 'organisation_id':
          result.organisationId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'salary_type':
          result.salaryType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_contract_signed':
          result.isContractSigned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'worker_id':
          result.workerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$EmploymentContractsRecord extends EmploymentContractsRecord {
  @override
  final DocumentReference<Object?>? jobId;
  @override
  final DocumentReference<Object?>? organisationId;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? salary;
  @override
  final String? salaryType;
  @override
  final bool? isContractSigned;
  @override
  final DocumentReference<Object?>? workerId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EmploymentContractsRecord(
          [void Function(EmploymentContractsRecordBuilder)? updates]) =>
      (new EmploymentContractsRecordBuilder()..update(updates))._build();

  _$EmploymentContractsRecord._(
      {this.jobId,
      this.organisationId,
      this.startDate,
      this.endDate,
      this.salary,
      this.salaryType,
      this.isContractSigned,
      this.workerId,
      this.ffRef})
      : super._();

  @override
  EmploymentContractsRecord rebuild(
          void Function(EmploymentContractsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmploymentContractsRecordBuilder toBuilder() =>
      new EmploymentContractsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmploymentContractsRecord &&
        jobId == other.jobId &&
        organisationId == other.organisationId &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        salary == other.salary &&
        salaryType == other.salaryType &&
        isContractSigned == other.isContractSigned &&
        workerId == other.workerId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, organisationId.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, salary.hashCode);
    _$hash = $jc(_$hash, salaryType.hashCode);
    _$hash = $jc(_$hash, isContractSigned.hashCode);
    _$hash = $jc(_$hash, workerId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmploymentContractsRecord')
          ..add('jobId', jobId)
          ..add('organisationId', organisationId)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('salary', salary)
          ..add('salaryType', salaryType)
          ..add('isContractSigned', isContractSigned)
          ..add('workerId', workerId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EmploymentContractsRecordBuilder
    implements
        Builder<EmploymentContractsRecord, EmploymentContractsRecordBuilder> {
  _$EmploymentContractsRecord? _$v;

  DocumentReference<Object?>? _jobId;
  DocumentReference<Object?>? get jobId => _$this._jobId;
  set jobId(DocumentReference<Object?>? jobId) => _$this._jobId = jobId;

  DocumentReference<Object?>? _organisationId;
  DocumentReference<Object?>? get organisationId => _$this._organisationId;
  set organisationId(DocumentReference<Object?>? organisationId) =>
      _$this._organisationId = organisationId;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  String? _salary;
  String? get salary => _$this._salary;
  set salary(String? salary) => _$this._salary = salary;

  String? _salaryType;
  String? get salaryType => _$this._salaryType;
  set salaryType(String? salaryType) => _$this._salaryType = salaryType;

  bool? _isContractSigned;
  bool? get isContractSigned => _$this._isContractSigned;
  set isContractSigned(bool? isContractSigned) =>
      _$this._isContractSigned = isContractSigned;

  DocumentReference<Object?>? _workerId;
  DocumentReference<Object?>? get workerId => _$this._workerId;
  set workerId(DocumentReference<Object?>? workerId) =>
      _$this._workerId = workerId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EmploymentContractsRecordBuilder() {
    EmploymentContractsRecord._initializeBuilder(this);
  }

  EmploymentContractsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobId = $v.jobId;
      _organisationId = $v.organisationId;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _salary = $v.salary;
      _salaryType = $v.salaryType;
      _isContractSigned = $v.isContractSigned;
      _workerId = $v.workerId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmploymentContractsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmploymentContractsRecord;
  }

  @override
  void update(void Function(EmploymentContractsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmploymentContractsRecord build() => _build();

  _$EmploymentContractsRecord _build() {
    final _$result = _$v ??
        new _$EmploymentContractsRecord._(
            jobId: jobId,
            organisationId: organisationId,
            startDate: startDate,
            endDate: endDate,
            salary: salary,
            salaryType: salaryType,
            isContractSigned: isContractSigned,
            workerId: workerId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
