// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobimage_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobimageRecord> _$jobimageRecordSerializer =
    new _$JobimageRecordSerializer();

class _$JobimageRecordSerializer
    implements StructuredSerializer<JobimageRecord> {
  @override
  final Iterable<Type> types = const [JobimageRecord, _$JobimageRecord];
  @override
  final String wireName = 'JobimageRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JobimageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.textile;
    if (value != null) {
      result
        ..add('textile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.garments;
    if (value != null) {
      result
        ..add('garments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.construction;
    if (value != null) {
      result
        ..add('construction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mining;
    if (value != null) {
      result
        ..add('mining')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.restraunt;
    if (value != null) {
      result
        ..add('restraunt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.automobile;
    if (value != null) {
      result
        ..add('automobile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homestaff;
    if (value != null) {
      result
        ..add('homestaff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.agri;
    if (value != null) {
      result
        ..add('agri')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.driver;
    if (value != null) {
      result
        ..add('driver')
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
  JobimageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobimageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'textile':
          result.textile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'garments':
          result.garments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'construction':
          result.construction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mining':
          result.mining = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'restraunt':
          result.restraunt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'automobile':
          result.automobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'homestaff':
          result.homestaff = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'agri':
          result.agri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'driver':
          result.driver = serializers.deserialize(value,
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

class _$JobimageRecord extends JobimageRecord {
  @override
  final String? textile;
  @override
  final String? garments;
  @override
  final String? construction;
  @override
  final String? mining;
  @override
  final String? restraunt;
  @override
  final String? automobile;
  @override
  final String? homestaff;
  @override
  final String? agri;
  @override
  final String? driver;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobimageRecord([void Function(JobimageRecordBuilder)? updates]) =>
      (new JobimageRecordBuilder()..update(updates))._build();

  _$JobimageRecord._(
      {this.textile,
      this.garments,
      this.construction,
      this.mining,
      this.restraunt,
      this.automobile,
      this.homestaff,
      this.agri,
      this.driver,
      this.ffRef})
      : super._();

  @override
  JobimageRecord rebuild(void Function(JobimageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobimageRecordBuilder toBuilder() =>
      new JobimageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobimageRecord &&
        textile == other.textile &&
        garments == other.garments &&
        construction == other.construction &&
        mining == other.mining &&
        restraunt == other.restraunt &&
        automobile == other.automobile &&
        homestaff == other.homestaff &&
        agri == other.agri &&
        driver == other.driver &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, textile.hashCode);
    _$hash = $jc(_$hash, garments.hashCode);
    _$hash = $jc(_$hash, construction.hashCode);
    _$hash = $jc(_$hash, mining.hashCode);
    _$hash = $jc(_$hash, restraunt.hashCode);
    _$hash = $jc(_$hash, automobile.hashCode);
    _$hash = $jc(_$hash, homestaff.hashCode);
    _$hash = $jc(_$hash, agri.hashCode);
    _$hash = $jc(_$hash, driver.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobimageRecord')
          ..add('textile', textile)
          ..add('garments', garments)
          ..add('construction', construction)
          ..add('mining', mining)
          ..add('restraunt', restraunt)
          ..add('automobile', automobile)
          ..add('homestaff', homestaff)
          ..add('agri', agri)
          ..add('driver', driver)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobimageRecordBuilder
    implements Builder<JobimageRecord, JobimageRecordBuilder> {
  _$JobimageRecord? _$v;

  String? _textile;
  String? get textile => _$this._textile;
  set textile(String? textile) => _$this._textile = textile;

  String? _garments;
  String? get garments => _$this._garments;
  set garments(String? garments) => _$this._garments = garments;

  String? _construction;
  String? get construction => _$this._construction;
  set construction(String? construction) => _$this._construction = construction;

  String? _mining;
  String? get mining => _$this._mining;
  set mining(String? mining) => _$this._mining = mining;

  String? _restraunt;
  String? get restraunt => _$this._restraunt;
  set restraunt(String? restraunt) => _$this._restraunt = restraunt;

  String? _automobile;
  String? get automobile => _$this._automobile;
  set automobile(String? automobile) => _$this._automobile = automobile;

  String? _homestaff;
  String? get homestaff => _$this._homestaff;
  set homestaff(String? homestaff) => _$this._homestaff = homestaff;

  String? _agri;
  String? get agri => _$this._agri;
  set agri(String? agri) => _$this._agri = agri;

  String? _driver;
  String? get driver => _$this._driver;
  set driver(String? driver) => _$this._driver = driver;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobimageRecordBuilder() {
    JobimageRecord._initializeBuilder(this);
  }

  JobimageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _textile = $v.textile;
      _garments = $v.garments;
      _construction = $v.construction;
      _mining = $v.mining;
      _restraunt = $v.restraunt;
      _automobile = $v.automobile;
      _homestaff = $v.homestaff;
      _agri = $v.agri;
      _driver = $v.driver;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobimageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobimageRecord;
  }

  @override
  void update(void Function(JobimageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobimageRecord build() => _build();

  _$JobimageRecord _build() {
    final _$result = _$v ??
        new _$JobimageRecord._(
            textile: textile,
            garments: garments,
            construction: construction,
            mining: mining,
            restraunt: restraunt,
            automobile: automobile,
            homestaff: homestaff,
            agri: agri,
            driver: driver,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
