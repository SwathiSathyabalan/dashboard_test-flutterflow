// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_expeience_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllExpeienceStruct> _$allExpeienceStructSerializer =
    new _$AllExpeienceStructSerializer();

class _$AllExpeienceStructSerializer
    implements StructuredSerializer<AllExpeienceStruct> {
  @override
  final Iterable<Type> types = const [AllExpeienceStruct, _$AllExpeienceStruct];
  @override
  final String wireName = 'AllExpeienceStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AllExpeienceStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ExperienceStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];

    return result;
  }

  @override
  AllExpeienceStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllExpeienceStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ExperienceStruct)]))!
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

class _$AllExpeienceStruct extends AllExpeienceStruct {
  @override
  final BuiltList<ExperienceStruct> data;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AllExpeienceStruct(
          [void Function(AllExpeienceStructBuilder)? updates]) =>
      (new AllExpeienceStructBuilder()..update(updates))._build();

  _$AllExpeienceStruct._({required this.data, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'AllExpeienceStruct', 'data');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AllExpeienceStruct', 'firestoreUtilData');
  }

  @override
  AllExpeienceStruct rebuild(
          void Function(AllExpeienceStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllExpeienceStructBuilder toBuilder() =>
      new AllExpeienceStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllExpeienceStruct &&
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
    return (newBuiltValueToStringHelper(r'AllExpeienceStruct')
          ..add('data', data)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AllExpeienceStructBuilder
    implements Builder<AllExpeienceStruct, AllExpeienceStructBuilder> {
  _$AllExpeienceStruct? _$v;

  ListBuilder<ExperienceStruct>? _data;
  ListBuilder<ExperienceStruct> get data =>
      _$this._data ??= new ListBuilder<ExperienceStruct>();
  set data(ListBuilder<ExperienceStruct>? data) => _$this._data = data;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AllExpeienceStructBuilder() {
    AllExpeienceStruct._initializeBuilder(this);
  }

  AllExpeienceStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllExpeienceStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllExpeienceStruct;
  }

  @override
  void update(void Function(AllExpeienceStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllExpeienceStruct build() => _build();

  _$AllExpeienceStruct _build() {
    _$AllExpeienceStruct _$result;
    try {
      _$result = _$v ??
          new _$AllExpeienceStruct._(
              data: data.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'AllExpeienceStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllExpeienceStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
