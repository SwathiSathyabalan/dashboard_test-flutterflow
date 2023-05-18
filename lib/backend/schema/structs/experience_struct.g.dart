// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExperienceStruct> _$experienceStructSerializer =
    new _$ExperienceStructSerializer();

class _$ExperienceStructSerializer
    implements StructuredSerializer<ExperienceStruct> {
  @override
  final Iterable<Type> types = const [ExperienceStruct, _$ExperienceStruct];
  @override
  final String wireName = 'ExperienceStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExperienceStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
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
    value = object.primarySkill;
    if (value != null) {
      result
        ..add('primary_skill')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ExperienceStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExperienceStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_title':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primary_skill':
          result.primarySkill = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
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

class _$ExperienceStruct extends ExperienceStruct {
  @override
  final String? companyName;
  @override
  final String? jobTitle;
  @override
  final String? primarySkill;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ExperienceStruct(
          [void Function(ExperienceStructBuilder)? updates]) =>
      (new ExperienceStructBuilder()..update(updates))._build();

  _$ExperienceStruct._(
      {this.companyName,
      this.jobTitle,
      this.primarySkill,
      this.startDate,
      this.endDate,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ExperienceStruct', 'firestoreUtilData');
  }

  @override
  ExperienceStruct rebuild(void Function(ExperienceStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExperienceStructBuilder toBuilder() =>
      new ExperienceStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExperienceStruct &&
        companyName == other.companyName &&
        jobTitle == other.jobTitle &&
        primarySkill == other.primarySkill &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, jobTitle.hashCode);
    _$hash = $jc(_$hash, primarySkill.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExperienceStruct')
          ..add('companyName', companyName)
          ..add('jobTitle', jobTitle)
          ..add('primarySkill', primarySkill)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ExperienceStructBuilder
    implements Builder<ExperienceStruct, ExperienceStructBuilder> {
  _$ExperienceStruct? _$v;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _primarySkill;
  String? get primarySkill => _$this._primarySkill;
  set primarySkill(String? primarySkill) => _$this._primarySkill = primarySkill;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ExperienceStructBuilder() {
    ExperienceStruct._initializeBuilder(this);
  }

  ExperienceStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _jobTitle = $v.jobTitle;
      _primarySkill = $v.primarySkill;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExperienceStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExperienceStruct;
  }

  @override
  void update(void Function(ExperienceStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExperienceStruct build() => _build();

  _$ExperienceStruct _build() {
    final _$result = _$v ??
        new _$ExperienceStruct._(
            companyName: companyName,
            jobTitle: jobTitle,
            primarySkill: primarySkill,
            startDate: startDate,
            endDate: endDate,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ExperienceStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
