// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillStruct> _$skillStructSerializer = new _$SkillStructSerializer();

class _$SkillStructSerializer implements StructuredSerializer<SkillStruct> {
  @override
  final Iterable<Type> types = const [SkillStruct, _$SkillStruct];
  @override
  final String wireName = 'SkillStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.skillName;
    if (value != null) {
      result
        ..add('skill_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.experience;
    if (value != null) {
      result
        ..add('experience')
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
    return result;
  }

  @override
  SkillStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skill_name':
          result.skillName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_primary':
          result.isPrimary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$SkillStruct extends SkillStruct {
  @override
  final String? skillName;
  @override
  final String? experience;
  @override
  final bool? isPrimary;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SkillStruct([void Function(SkillStructBuilder)? updates]) =>
      (new SkillStructBuilder()..update(updates))._build();

  _$SkillStruct._(
      {this.skillName,
      this.experience,
      this.isPrimary,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SkillStruct', 'firestoreUtilData');
  }

  @override
  SkillStruct rebuild(void Function(SkillStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillStructBuilder toBuilder() => new SkillStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillStruct &&
        skillName == other.skillName &&
        experience == other.experience &&
        isPrimary == other.isPrimary &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skillName.hashCode);
    _$hash = $jc(_$hash, experience.hashCode);
    _$hash = $jc(_$hash, isPrimary.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillStruct')
          ..add('skillName', skillName)
          ..add('experience', experience)
          ..add('isPrimary', isPrimary)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SkillStructBuilder implements Builder<SkillStruct, SkillStructBuilder> {
  _$SkillStruct? _$v;

  String? _skillName;
  String? get skillName => _$this._skillName;
  set skillName(String? skillName) => _$this._skillName = skillName;

  String? _experience;
  String? get experience => _$this._experience;
  set experience(String? experience) => _$this._experience = experience;

  bool? _isPrimary;
  bool? get isPrimary => _$this._isPrimary;
  set isPrimary(bool? isPrimary) => _$this._isPrimary = isPrimary;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SkillStructBuilder() {
    SkillStruct._initializeBuilder(this);
  }

  SkillStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillName = $v.skillName;
      _experience = $v.experience;
      _isPrimary = $v.isPrimary;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillStruct;
  }

  @override
  void update(void Function(SkillStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillStruct build() => _build();

  _$SkillStruct _build() {
    final _$result = _$v ??
        new _$SkillStruct._(
            skillName: skillName,
            experience: experience,
            isPrimary: isPrimary,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'SkillStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
