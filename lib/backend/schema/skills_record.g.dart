// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillsRecord> _$skillsRecordSerializer =
    new _$SkillsRecordSerializer();

class _$SkillsRecordSerializer implements StructuredSerializer<SkillsRecord> {
  @override
  final Iterable<Type> types = const [SkillsRecord, _$SkillsRecord];
  @override
  final String wireName = 'SkillsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.primarySkill;
    if (value != null) {
      result
        ..add('primary_skill')
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
  SkillsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillsRecordBuilder();

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
        case 'primary_skill':
          result.primarySkill = serializers.deserialize(value,
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

class _$SkillsRecord extends SkillsRecord {
  @override
  final String? skillName;
  @override
  final String? experience;
  @override
  final bool? isPrimary;
  @override
  final String? primarySkill;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SkillsRecord([void Function(SkillsRecordBuilder)? updates]) =>
      (new SkillsRecordBuilder()..update(updates))._build();

  _$SkillsRecord._(
      {this.skillName,
      this.experience,
      this.isPrimary,
      this.primarySkill,
      this.ffRef})
      : super._();

  @override
  SkillsRecord rebuild(void Function(SkillsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillsRecordBuilder toBuilder() => new SkillsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillsRecord &&
        skillName == other.skillName &&
        experience == other.experience &&
        isPrimary == other.isPrimary &&
        primarySkill == other.primarySkill &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skillName.hashCode);
    _$hash = $jc(_$hash, experience.hashCode);
    _$hash = $jc(_$hash, isPrimary.hashCode);
    _$hash = $jc(_$hash, primarySkill.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillsRecord')
          ..add('skillName', skillName)
          ..add('experience', experience)
          ..add('isPrimary', isPrimary)
          ..add('primarySkill', primarySkill)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SkillsRecordBuilder
    implements Builder<SkillsRecord, SkillsRecordBuilder> {
  _$SkillsRecord? _$v;

  String? _skillName;
  String? get skillName => _$this._skillName;
  set skillName(String? skillName) => _$this._skillName = skillName;

  String? _experience;
  String? get experience => _$this._experience;
  set experience(String? experience) => _$this._experience = experience;

  bool? _isPrimary;
  bool? get isPrimary => _$this._isPrimary;
  set isPrimary(bool? isPrimary) => _$this._isPrimary = isPrimary;

  String? _primarySkill;
  String? get primarySkill => _$this._primarySkill;
  set primarySkill(String? primarySkill) => _$this._primarySkill = primarySkill;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SkillsRecordBuilder() {
    SkillsRecord._initializeBuilder(this);
  }

  SkillsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillName = $v.skillName;
      _experience = $v.experience;
      _isPrimary = $v.isPrimary;
      _primarySkill = $v.primarySkill;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillsRecord;
  }

  @override
  void update(void Function(SkillsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillsRecord build() => _build();

  _$SkillsRecord _build() {
    final _$result = _$v ??
        new _$SkillsRecord._(
            skillName: skillName,
            experience: experience,
            isPrimary: isPrimary,
            primarySkill: primarySkill,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
