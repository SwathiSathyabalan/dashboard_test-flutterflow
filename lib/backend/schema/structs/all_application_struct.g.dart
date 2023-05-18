// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_application_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllApplicationStruct> _$allApplicationStructSerializer =
    new _$AllApplicationStructSerializer();

class _$AllApplicationStructSerializer
    implements StructuredSerializer<AllApplicationStruct> {
  @override
  final Iterable<Type> types = const [
    AllApplicationStruct,
    _$AllApplicationStruct
  ];
  @override
  final String wireName = 'AllApplicationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AllApplicationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'job_application',
      serializers.serialize(object.jobApplication,
          specifiedType: const FullType(
              BuiltList, const [const FullType(JobApplicationStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];

    return result;
  }

  @override
  AllApplicationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllApplicationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'job_application':
          result.jobApplication.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(JobApplicationStruct)]))!
              as BuiltList<Object?>);
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

class _$AllApplicationStruct extends AllApplicationStruct {
  @override
  final BuiltList<JobApplicationStruct> jobApplication;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AllApplicationStruct(
          [void Function(AllApplicationStructBuilder)? updates]) =>
      (new AllApplicationStructBuilder()..update(updates))._build();

  _$AllApplicationStruct._(
      {required this.jobApplication, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        jobApplication, r'AllApplicationStruct', 'jobApplication');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AllApplicationStruct', 'firestoreUtilData');
  }

  @override
  AllApplicationStruct rebuild(
          void Function(AllApplicationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllApplicationStructBuilder toBuilder() =>
      new AllApplicationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllApplicationStruct &&
        jobApplication == other.jobApplication &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jobApplication.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllApplicationStruct')
          ..add('jobApplication', jobApplication)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AllApplicationStructBuilder
    implements Builder<AllApplicationStruct, AllApplicationStructBuilder> {
  _$AllApplicationStruct? _$v;

  ListBuilder<JobApplicationStruct>? _jobApplication;
  ListBuilder<JobApplicationStruct> get jobApplication =>
      _$this._jobApplication ??= new ListBuilder<JobApplicationStruct>();
  set jobApplication(ListBuilder<JobApplicationStruct>? jobApplication) =>
      _$this._jobApplication = jobApplication;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AllApplicationStructBuilder() {
    AllApplicationStruct._initializeBuilder(this);
  }

  AllApplicationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobApplication = $v.jobApplication.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllApplicationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllApplicationStruct;
  }

  @override
  void update(void Function(AllApplicationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllApplicationStruct build() => _build();

  _$AllApplicationStruct _build() {
    _$AllApplicationStruct _$result;
    try {
      _$result = _$v ??
          new _$AllApplicationStruct._(
              jobApplication: jobApplication.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'AllApplicationStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'jobApplication';
        jobApplication.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllApplicationStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
