// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workers_list_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkersListStruct> _$workersListStructSerializer =
new _$WorkersListStructSerializer();

class _$WorkersListStructSerializer
    implements StructuredSerializer<WorkersListStruct> {
  @override
  final Iterable<Type> types = const [WorkersListStruct, _$WorkersListStruct];
  @override
  final String wireName = 'WorkersListStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, WorkersListStruct object,
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
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    return result;
  }

  @override
  WorkersListStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkersListStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'worker_id':
          result.workerId.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$WorkersListStruct extends WorkersListStruct {
  @override
  final BuiltList<DocumentReference<Object?>>? workerId;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WorkersListStruct(
      [void Function(WorkersListStructBuilder)? updates]) =>
      (new WorkersListStructBuilder()..update(updates))._build();

  _$WorkersListStruct._({this.workerId, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WorkersListStruct', 'firestoreUtilData');
  }

  @override
  WorkersListStruct rebuild(void Function(WorkersListStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkersListStructBuilder toBuilder() =>
      new WorkersListStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkersListStruct &&
        workerId == other.workerId &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workerId.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkersListStruct')
      ..add('workerId', workerId)
      ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WorkersListStructBuilder
    implements Builder<WorkersListStruct, WorkersListStructBuilder> {
  _$WorkersListStruct? _$v;

  ListBuilder<DocumentReference<Object?>>? _workerId;
  ListBuilder<DocumentReference<Object?>> get workerId =>
      _$this._workerId ??= new ListBuilder<DocumentReference<Object?>>();
  set workerId(ListBuilder<DocumentReference<Object?>>? workerId) =>
      _$this._workerId = workerId;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WorkersListStructBuilder() {
    WorkersListStruct._initializeBuilder(this);
  }

  WorkersListStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workerId = $v.workerId?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkersListStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkersListStruct;
  }

  @override
  void update(void Function(WorkersListStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkersListStruct build() => _build();

  _$WorkersListStruct _build() {
    _$WorkersListStruct _$result;
    try {
      _$result = _$v ??
          new _$WorkersListStruct._(
              workerId: _workerId?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'WorkersListStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workerId';
        _workerId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WorkersListStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
