// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_skills_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllSkillsStruct> _$allSkillsStructSerializer =
    new _$AllSkillsStructSerializer();

class _$AllSkillsStructSerializer
    implements StructuredSerializer<AllSkillsStruct> {
  @override
  final Iterable<Type> types = const [AllSkillsStruct, _$AllSkillsStruct];
  @override
  final String wireName = 'AllSkillsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, AllSkillsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SkillStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];

    return result;
  }

  @override
  AllSkillsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllSkillsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SkillStruct)]))!
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

class _$AllSkillsStruct extends AllSkillsStruct {
  @override
  final BuiltList<SkillStruct> data;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AllSkillsStruct([void Function(AllSkillsStructBuilder)? updates]) =>
      (new AllSkillsStructBuilder()..update(updates))._build();

  _$AllSkillsStruct._({required this.data, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'AllSkillsStruct', 'data');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AllSkillsStruct', 'firestoreUtilData');
  }

  @override
  AllSkillsStruct rebuild(void Function(AllSkillsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllSkillsStructBuilder toBuilder() =>
      new AllSkillsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllSkillsStruct &&
        data == other.data &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllSkillsStruct')
          ..add('data', data)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AllSkillsStructBuilder
    implements Builder<AllSkillsStruct, AllSkillsStructBuilder> {
  _$AllSkillsStruct? _$v;

  ListBuilder<SkillStruct>? _data;
  ListBuilder<SkillStruct> get data =>
      _$this._data ??= new ListBuilder<SkillStruct>();
  set data(ListBuilder<SkillStruct>? data) => _$this._data = data;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AllSkillsStructBuilder() {
    AllSkillsStruct._initializeBuilder(this);
  }

  AllSkillsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllSkillsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllSkillsStruct;
  }

  @override
  void update(void Function(AllSkillsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllSkillsStruct build() => _build();

  _$AllSkillsStruct _build() {
    _$AllSkillsStruct _$result;
    try {
      _$result = _$v ??
          new _$AllSkillsStruct._(
              data: data.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'AllSkillsStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllSkillsStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
