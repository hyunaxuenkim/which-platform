// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StationsTable extends Stations with TableInfo<$StationsTable, Station> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stationKeyMeta = const VerificationMeta(
    'stationKey',
  );
  @override
  late final GeneratedColumn<String> stationKey = GeneratedColumn<String>(
    'station_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameKoMeta = const VerificationMeta('nameKo');
  @override
  late final GeneratedColumn<String> nameKo = GeneratedColumn<String>(
    'name_ko',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    stationKey,
    nameKo,
    nameEn,
    latitude,
    longitude,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Station> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('station_key')) {
      context.handle(
        _stationKeyMeta,
        stationKey.isAcceptableOrUnknown(data['station_key']!, _stationKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_stationKeyMeta);
    }
    if (data.containsKey('name_ko')) {
      context.handle(
        _nameKoMeta,
        nameKo.isAcceptableOrUnknown(data['name_ko']!, _nameKoMeta),
      );
    } else if (isInserting) {
      context.missing(_nameKoMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Station map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Station(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      stationKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}station_key'],
      )!,
      nameKo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ko'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StationsTable createAlias(String alias) {
    return $StationsTable(attachedDatabase, alias);
  }
}

class Station extends DataClass implements Insertable<Station> {
  final int id;
  final String stationKey;
  final String nameKo;
  final String? nameEn;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Station({
    required this.id,
    required this.stationKey,
    required this.nameKo,
    this.nameEn,
    this.latitude,
    this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['station_key'] = Variable<String>(stationKey);
    map['name_ko'] = Variable<String>(nameKo);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StationsCompanion toCompanion(bool nullToAbsent) {
    return StationsCompanion(
      id: Value(id),
      stationKey: Value(stationKey),
      nameKo: Value(nameKo),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Station.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Station(
      id: serializer.fromJson<int>(json['id']),
      stationKey: serializer.fromJson<String>(json['stationKey']),
      nameKo: serializer.fromJson<String>(json['nameKo']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stationKey': serializer.toJson<String>(stationKey),
      'nameKo': serializer.toJson<String>(nameKo),
      'nameEn': serializer.toJson<String?>(nameEn),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Station copyWith({
    int? id,
    String? stationKey,
    String? nameKo,
    Value<String?> nameEn = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Station(
    id: id ?? this.id,
    stationKey: stationKey ?? this.stationKey,
    nameKo: nameKo ?? this.nameKo,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Station copyWithCompanion(StationsCompanion data) {
    return Station(
      id: data.id.present ? data.id.value : this.id,
      stationKey: data.stationKey.present
          ? data.stationKey.value
          : this.stationKey,
      nameKo: data.nameKo.present ? data.nameKo.value : this.nameKo,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Station(')
          ..write('id: $id, ')
          ..write('stationKey: $stationKey, ')
          ..write('nameKo: $nameKo, ')
          ..write('nameEn: $nameEn, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    stationKey,
    nameKo,
    nameEn,
    latitude,
    longitude,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Station &&
          other.id == this.id &&
          other.stationKey == this.stationKey &&
          other.nameKo == this.nameKo &&
          other.nameEn == this.nameEn &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StationsCompanion extends UpdateCompanion<Station> {
  final Value<int> id;
  final Value<String> stationKey;
  final Value<String> nameKo;
  final Value<String?> nameEn;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StationsCompanion({
    this.id = const Value.absent(),
    this.stationKey = const Value.absent(),
    this.nameKo = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StationsCompanion.insert({
    this.id = const Value.absent(),
    required String stationKey,
    required String nameKo,
    this.nameEn = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : stationKey = Value(stationKey),
       nameKo = Value(nameKo);
  static Insertable<Station> custom({
    Expression<int>? id,
    Expression<String>? stationKey,
    Expression<String>? nameKo,
    Expression<String>? nameEn,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stationKey != null) 'station_key': stationKey,
      if (nameKo != null) 'name_ko': nameKo,
      if (nameEn != null) 'name_en': nameEn,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StationsCompanion copyWith({
    Value<int>? id,
    Value<String>? stationKey,
    Value<String>? nameKo,
    Value<String?>? nameEn,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StationsCompanion(
      id: id ?? this.id,
      stationKey: stationKey ?? this.stationKey,
      nameKo: nameKo ?? this.nameKo,
      nameEn: nameEn ?? this.nameEn,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stationKey.present) {
      map['station_key'] = Variable<String>(stationKey.value);
    }
    if (nameKo.present) {
      map['name_ko'] = Variable<String>(nameKo.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StationsCompanion(')
          ..write('id: $id, ')
          ..write('stationKey: $stationKey, ')
          ..write('nameKo: $nameKo, ')
          ..write('nameEn: $nameEn, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LinesTable extends Lines with TableInfo<$LinesTable, Line> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lineKeyMeta = const VerificationMeta(
    'lineKey',
  );
  @override
  late final GeneratedColumn<String> lineKey = GeneratedColumn<String>(
    'line_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lineTypeMeta = const VerificationMeta(
    'lineType',
  );
  @override
  late final GeneratedColumn<String> lineType = GeneratedColumn<String>(
    'line_type',
    aliasedName,
    false,
    check: () => lineType.isIn(const <String>['LINEAR', 'LOOP', 'BRANCH']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operatorMeta = const VerificationMeta(
    'operator',
  );
  @override
  late final GeneratedColumn<String> operator = GeneratedColumn<String>(
    'operator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lineKey,
    name,
    color,
    lineType,
    operator,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Line> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('line_key')) {
      context.handle(
        _lineKeyMeta,
        lineKey.isAcceptableOrUnknown(data['line_key']!, _lineKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_lineKeyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('line_type')) {
      context.handle(
        _lineTypeMeta,
        lineType.isAcceptableOrUnknown(data['line_type']!, _lineTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTypeMeta);
    }
    if (data.containsKey('operator')) {
      context.handle(
        _operatorMeta,
        operator.isAcceptableOrUnknown(data['operator']!, _operatorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Line map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Line(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      lineType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_type'],
      )!,
      operator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operator'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LinesTable createAlias(String alias) {
    return $LinesTable(attachedDatabase, alias);
  }
}

class Line extends DataClass implements Insertable<Line> {
  final int id;
  final String lineKey;
  final String name;
  final String? color;
  final String lineType;
  final String? operator;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Line({
    required this.id,
    required this.lineKey,
    required this.name,
    this.color,
    required this.lineType,
    this.operator,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_key'] = Variable<String>(lineKey);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['line_type'] = Variable<String>(lineType);
    if (!nullToAbsent || operator != null) {
      map['operator'] = Variable<String>(operator);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LinesCompanion toCompanion(bool nullToAbsent) {
    return LinesCompanion(
      id: Value(id),
      lineKey: Value(lineKey),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      lineType: Value(lineType),
      operator: operator == null && nullToAbsent
          ? const Value.absent()
          : Value(operator),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Line.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Line(
      id: serializer.fromJson<int>(json['id']),
      lineKey: serializer.fromJson<String>(json['lineKey']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      lineType: serializer.fromJson<String>(json['lineType']),
      operator: serializer.fromJson<String?>(json['operator']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lineKey': serializer.toJson<String>(lineKey),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'lineType': serializer.toJson<String>(lineType),
      'operator': serializer.toJson<String?>(operator),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Line copyWith({
    int? id,
    String? lineKey,
    String? name,
    Value<String?> color = const Value.absent(),
    String? lineType,
    Value<String?> operator = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Line(
    id: id ?? this.id,
    lineKey: lineKey ?? this.lineKey,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    lineType: lineType ?? this.lineType,
    operator: operator.present ? operator.value : this.operator,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Line copyWithCompanion(LinesCompanion data) {
    return Line(
      id: data.id.present ? data.id.value : this.id,
      lineKey: data.lineKey.present ? data.lineKey.value : this.lineKey,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      lineType: data.lineType.present ? data.lineType.value : this.lineType,
      operator: data.operator.present ? data.operator.value : this.operator,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Line(')
          ..write('id: $id, ')
          ..write('lineKey: $lineKey, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('lineType: $lineType, ')
          ..write('operator: $operator, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lineKey,
    name,
    color,
    lineType,
    operator,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Line &&
          other.id == this.id &&
          other.lineKey == this.lineKey &&
          other.name == this.name &&
          other.color == this.color &&
          other.lineType == this.lineType &&
          other.operator == this.operator &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LinesCompanion extends UpdateCompanion<Line> {
  final Value<int> id;
  final Value<String> lineKey;
  final Value<String> name;
  final Value<String?> color;
  final Value<String> lineType;
  final Value<String?> operator;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LinesCompanion({
    this.id = const Value.absent(),
    this.lineKey = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.lineType = const Value.absent(),
    this.operator = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LinesCompanion.insert({
    this.id = const Value.absent(),
    required String lineKey,
    required String name,
    this.color = const Value.absent(),
    required String lineType,
    this.operator = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lineKey = Value(lineKey),
       name = Value(name),
       lineType = Value(lineType);
  static Insertable<Line> custom({
    Expression<int>? id,
    Expression<String>? lineKey,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? lineType,
    Expression<String>? operator,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineKey != null) 'line_key': lineKey,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (lineType != null) 'line_type': lineType,
      if (operator != null) 'operator': operator,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LinesCompanion copyWith({
    Value<int>? id,
    Value<String>? lineKey,
    Value<String>? name,
    Value<String?>? color,
    Value<String>? lineType,
    Value<String?>? operator,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LinesCompanion(
      id: id ?? this.id,
      lineKey: lineKey ?? this.lineKey,
      name: name ?? this.name,
      color: color ?? this.color,
      lineType: lineType ?? this.lineType,
      operator: operator ?? this.operator,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lineKey.present) {
      map['line_key'] = Variable<String>(lineKey.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (lineType.present) {
      map['line_type'] = Variable<String>(lineType.value);
    }
    if (operator.present) {
      map['operator'] = Variable<String>(operator.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinesCompanion(')
          ..write('id: $id, ')
          ..write('lineKey: $lineKey, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('lineType: $lineType, ')
          ..write('operator: $operator, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LineStationsTable extends LineStations
    with TableInfo<$LineStationsTable, LineStation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LineStationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lineIdMeta = const VerificationMeta('lineId');
  @override
  late final GeneratedColumn<int> lineId = GeneratedColumn<int>(
    'line_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lines (id)',
    ),
  );
  static const VerificationMeta _stationIdMeta = const VerificationMeta(
    'stationId',
  );
  @override
  late final GeneratedColumn<int> stationId = GeneratedColumn<int>(
    'station_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stations (id)',
    ),
  );
  static const VerificationMeta _stationCodeMeta = const VerificationMeta(
    'stationCode',
  );
  @override
  late final GeneratedColumn<String> stationCode = GeneratedColumn<String>(
    'station_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stationNoMeta = const VerificationMeta(
    'stationNo',
  );
  @override
  late final GeneratedColumn<String> stationNo = GeneratedColumn<String>(
    'station_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _branchKeyMeta = const VerificationMeta(
    'branchKey',
  );
  @override
  late final GeneratedColumn<String> branchKey = GeneratedColumn<String>(
    'branch_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('MAIN'),
  );
  static const VerificationMeta _isTerminalMeta = const VerificationMeta(
    'isTerminal',
  );
  @override
  late final GeneratedColumn<bool> isTerminal = GeneratedColumn<bool>(
    'is_terminal',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_terminal" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lineId,
    stationId,
    stationCode,
    stationNo,
    orderIndex,
    branchKey,
    isTerminal,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'line_stations';
  @override
  VerificationContext validateIntegrity(
    Insertable<LineStation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('line_id')) {
      context.handle(
        _lineIdMeta,
        lineId.isAcceptableOrUnknown(data['line_id']!, _lineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lineIdMeta);
    }
    if (data.containsKey('station_id')) {
      context.handle(
        _stationIdMeta,
        stationId.isAcceptableOrUnknown(data['station_id']!, _stationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stationIdMeta);
    }
    if (data.containsKey('station_code')) {
      context.handle(
        _stationCodeMeta,
        stationCode.isAcceptableOrUnknown(
          data['station_code']!,
          _stationCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stationCodeMeta);
    }
    if (data.containsKey('station_no')) {
      context.handle(
        _stationNoMeta,
        stationNo.isAcceptableOrUnknown(data['station_no']!, _stationNoMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('branch_key')) {
      context.handle(
        _branchKeyMeta,
        branchKey.isAcceptableOrUnknown(data['branch_key']!, _branchKeyMeta),
      );
    }
    if (data.containsKey('is_terminal')) {
      context.handle(
        _isTerminalMeta,
        isTerminal.isAcceptableOrUnknown(data['is_terminal']!, _isTerminalMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {lineId, stationCode},
    {lineId, stationId, branchKey},
    {lineId, orderIndex, branchKey},
  ];
  @override
  LineStation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LineStation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_id'],
      )!,
      stationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}station_id'],
      )!,
      stationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}station_code'],
      )!,
      stationNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}station_no'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      branchKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}branch_key'],
      )!,
      isTerminal: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_terminal'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LineStationsTable createAlias(String alias) {
    return $LineStationsTable(attachedDatabase, alias);
  }
}

class LineStation extends DataClass implements Insertable<LineStation> {
  final int id;
  final int lineId;
  final int stationId;
  final String stationCode;
  final String? stationNo;
  final int orderIndex;
  final String branchKey;
  final bool isTerminal;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LineStation({
    required this.id,
    required this.lineId,
    required this.stationId,
    required this.stationCode,
    this.stationNo,
    required this.orderIndex,
    required this.branchKey,
    required this.isTerminal,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_id'] = Variable<int>(lineId);
    map['station_id'] = Variable<int>(stationId);
    map['station_code'] = Variable<String>(stationCode);
    if (!nullToAbsent || stationNo != null) {
      map['station_no'] = Variable<String>(stationNo);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['branch_key'] = Variable<String>(branchKey);
    map['is_terminal'] = Variable<bool>(isTerminal);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LineStationsCompanion toCompanion(bool nullToAbsent) {
    return LineStationsCompanion(
      id: Value(id),
      lineId: Value(lineId),
      stationId: Value(stationId),
      stationCode: Value(stationCode),
      stationNo: stationNo == null && nullToAbsent
          ? const Value.absent()
          : Value(stationNo),
      orderIndex: Value(orderIndex),
      branchKey: Value(branchKey),
      isTerminal: Value(isTerminal),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LineStation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LineStation(
      id: serializer.fromJson<int>(json['id']),
      lineId: serializer.fromJson<int>(json['lineId']),
      stationId: serializer.fromJson<int>(json['stationId']),
      stationCode: serializer.fromJson<String>(json['stationCode']),
      stationNo: serializer.fromJson<String?>(json['stationNo']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      branchKey: serializer.fromJson<String>(json['branchKey']),
      isTerminal: serializer.fromJson<bool>(json['isTerminal']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lineId': serializer.toJson<int>(lineId),
      'stationId': serializer.toJson<int>(stationId),
      'stationCode': serializer.toJson<String>(stationCode),
      'stationNo': serializer.toJson<String?>(stationNo),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'branchKey': serializer.toJson<String>(branchKey),
      'isTerminal': serializer.toJson<bool>(isTerminal),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LineStation copyWith({
    int? id,
    int? lineId,
    int? stationId,
    String? stationCode,
    Value<String?> stationNo = const Value.absent(),
    int? orderIndex,
    String? branchKey,
    bool? isTerminal,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LineStation(
    id: id ?? this.id,
    lineId: lineId ?? this.lineId,
    stationId: stationId ?? this.stationId,
    stationCode: stationCode ?? this.stationCode,
    stationNo: stationNo.present ? stationNo.value : this.stationNo,
    orderIndex: orderIndex ?? this.orderIndex,
    branchKey: branchKey ?? this.branchKey,
    isTerminal: isTerminal ?? this.isTerminal,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LineStation copyWithCompanion(LineStationsCompanion data) {
    return LineStation(
      id: data.id.present ? data.id.value : this.id,
      lineId: data.lineId.present ? data.lineId.value : this.lineId,
      stationId: data.stationId.present ? data.stationId.value : this.stationId,
      stationCode: data.stationCode.present
          ? data.stationCode.value
          : this.stationCode,
      stationNo: data.stationNo.present ? data.stationNo.value : this.stationNo,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      branchKey: data.branchKey.present ? data.branchKey.value : this.branchKey,
      isTerminal: data.isTerminal.present
          ? data.isTerminal.value
          : this.isTerminal,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LineStation(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('stationId: $stationId, ')
          ..write('stationCode: $stationCode, ')
          ..write('stationNo: $stationNo, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('branchKey: $branchKey, ')
          ..write('isTerminal: $isTerminal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lineId,
    stationId,
    stationCode,
    stationNo,
    orderIndex,
    branchKey,
    isTerminal,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LineStation &&
          other.id == this.id &&
          other.lineId == this.lineId &&
          other.stationId == this.stationId &&
          other.stationCode == this.stationCode &&
          other.stationNo == this.stationNo &&
          other.orderIndex == this.orderIndex &&
          other.branchKey == this.branchKey &&
          other.isTerminal == this.isTerminal &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LineStationsCompanion extends UpdateCompanion<LineStation> {
  final Value<int> id;
  final Value<int> lineId;
  final Value<int> stationId;
  final Value<String> stationCode;
  final Value<String?> stationNo;
  final Value<int> orderIndex;
  final Value<String> branchKey;
  final Value<bool> isTerminal;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LineStationsCompanion({
    this.id = const Value.absent(),
    this.lineId = const Value.absent(),
    this.stationId = const Value.absent(),
    this.stationCode = const Value.absent(),
    this.stationNo = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.branchKey = const Value.absent(),
    this.isTerminal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LineStationsCompanion.insert({
    this.id = const Value.absent(),
    required int lineId,
    required int stationId,
    required String stationCode,
    this.stationNo = const Value.absent(),
    required int orderIndex,
    this.branchKey = const Value.absent(),
    this.isTerminal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lineId = Value(lineId),
       stationId = Value(stationId),
       stationCode = Value(stationCode),
       orderIndex = Value(orderIndex);
  static Insertable<LineStation> custom({
    Expression<int>? id,
    Expression<int>? lineId,
    Expression<int>? stationId,
    Expression<String>? stationCode,
    Expression<String>? stationNo,
    Expression<int>? orderIndex,
    Expression<String>? branchKey,
    Expression<bool>? isTerminal,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineId != null) 'line_id': lineId,
      if (stationId != null) 'station_id': stationId,
      if (stationCode != null) 'station_code': stationCode,
      if (stationNo != null) 'station_no': stationNo,
      if (orderIndex != null) 'order_index': orderIndex,
      if (branchKey != null) 'branch_key': branchKey,
      if (isTerminal != null) 'is_terminal': isTerminal,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LineStationsCompanion copyWith({
    Value<int>? id,
    Value<int>? lineId,
    Value<int>? stationId,
    Value<String>? stationCode,
    Value<String?>? stationNo,
    Value<int>? orderIndex,
    Value<String>? branchKey,
    Value<bool>? isTerminal,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LineStationsCompanion(
      id: id ?? this.id,
      lineId: lineId ?? this.lineId,
      stationId: stationId ?? this.stationId,
      stationCode: stationCode ?? this.stationCode,
      stationNo: stationNo ?? this.stationNo,
      orderIndex: orderIndex ?? this.orderIndex,
      branchKey: branchKey ?? this.branchKey,
      isTerminal: isTerminal ?? this.isTerminal,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lineId.present) {
      map['line_id'] = Variable<int>(lineId.value);
    }
    if (stationId.present) {
      map['station_id'] = Variable<int>(stationId.value);
    }
    if (stationCode.present) {
      map['station_code'] = Variable<String>(stationCode.value);
    }
    if (stationNo.present) {
      map['station_no'] = Variable<String>(stationNo.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (branchKey.present) {
      map['branch_key'] = Variable<String>(branchKey.value);
    }
    if (isTerminal.present) {
      map['is_terminal'] = Variable<bool>(isTerminal.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LineStationsCompanion(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('stationId: $stationId, ')
          ..write('stationCode: $stationCode, ')
          ..write('stationNo: $stationNo, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('branchKey: $branchKey, ')
          ..write('isTerminal: $isTerminal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransfersTable extends Transfers
    with TableInfo<$TransfersTable, Transfer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fromLineStationIdMeta = const VerificationMeta(
    'fromLineStationId',
  );
  @override
  late final GeneratedColumn<int> fromLineStationId = GeneratedColumn<int>(
    'from_line_station_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_stations (id)',
    ),
  );
  static const VerificationMeta _toLineStationIdMeta = const VerificationMeta(
    'toLineStationId',
  );
  @override
  late final GeneratedColumn<int> toLineStationId = GeneratedColumn<int>(
    'to_line_station_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_stations (id)',
    ),
  );
  static const VerificationMeta _walkingSecondsMeta = const VerificationMeta(
    'walkingSeconds',
  );
  @override
  late final GeneratedColumn<int> walkingSeconds = GeneratedColumn<int>(
    'walking_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transferTypeMeta = const VerificationMeta(
    'transferType',
  );
  @override
  late final GeneratedColumn<String> transferType = GeneratedColumn<String>(
    'transfer_type',
    aliasedName,
    true,
    check: () => transferType.isIn(const <String>[
      'SAME_PLATFORM',
      'NORMAL',
      'LONG_WALK',
    ]),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fromLineStationId,
    toLineStationId,
    walkingSeconds,
    transferType,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transfer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from_line_station_id')) {
      context.handle(
        _fromLineStationIdMeta,
        fromLineStationId.isAcceptableOrUnknown(
          data['from_line_station_id']!,
          _fromLineStationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fromLineStationIdMeta);
    }
    if (data.containsKey('to_line_station_id')) {
      context.handle(
        _toLineStationIdMeta,
        toLineStationId.isAcceptableOrUnknown(
          data['to_line_station_id']!,
          _toLineStationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toLineStationIdMeta);
    }
    if (data.containsKey('walking_seconds')) {
      context.handle(
        _walkingSecondsMeta,
        walkingSeconds.isAcceptableOrUnknown(
          data['walking_seconds']!,
          _walkingSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_walkingSecondsMeta);
    }
    if (data.containsKey('transfer_type')) {
      context.handle(
        _transferTypeMeta,
        transferType.isAcceptableOrUnknown(
          data['transfer_type']!,
          _transferTypeMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {fromLineStationId, toLineStationId},
  ];
  @override
  Transfer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transfer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fromLineStationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_line_station_id'],
      )!,
      toLineStationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_line_station_id'],
      )!,
      walkingSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}walking_seconds'],
      )!,
      transferType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transfer_type'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TransfersTable createAlias(String alias) {
    return $TransfersTable(attachedDatabase, alias);
  }
}

class Transfer extends DataClass implements Insertable<Transfer> {
  final int id;
  final int fromLineStationId;
  final int toLineStationId;
  final int walkingSeconds;
  final String? transferType;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Transfer({
    required this.id,
    required this.fromLineStationId,
    required this.toLineStationId,
    required this.walkingSeconds,
    this.transferType,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['from_line_station_id'] = Variable<int>(fromLineStationId);
    map['to_line_station_id'] = Variable<int>(toLineStationId);
    map['walking_seconds'] = Variable<int>(walkingSeconds);
    if (!nullToAbsent || transferType != null) {
      map['transfer_type'] = Variable<String>(transferType);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransfersCompanion toCompanion(bool nullToAbsent) {
    return TransfersCompanion(
      id: Value(id),
      fromLineStationId: Value(fromLineStationId),
      toLineStationId: Value(toLineStationId),
      walkingSeconds: Value(walkingSeconds),
      transferType: transferType == null && nullToAbsent
          ? const Value.absent()
          : Value(transferType),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Transfer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transfer(
      id: serializer.fromJson<int>(json['id']),
      fromLineStationId: serializer.fromJson<int>(json['fromLineStationId']),
      toLineStationId: serializer.fromJson<int>(json['toLineStationId']),
      walkingSeconds: serializer.fromJson<int>(json['walkingSeconds']),
      transferType: serializer.fromJson<String?>(json['transferType']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fromLineStationId': serializer.toJson<int>(fromLineStationId),
      'toLineStationId': serializer.toJson<int>(toLineStationId),
      'walkingSeconds': serializer.toJson<int>(walkingSeconds),
      'transferType': serializer.toJson<String?>(transferType),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Transfer copyWith({
    int? id,
    int? fromLineStationId,
    int? toLineStationId,
    int? walkingSeconds,
    Value<String?> transferType = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Transfer(
    id: id ?? this.id,
    fromLineStationId: fromLineStationId ?? this.fromLineStationId,
    toLineStationId: toLineStationId ?? this.toLineStationId,
    walkingSeconds: walkingSeconds ?? this.walkingSeconds,
    transferType: transferType.present ? transferType.value : this.transferType,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Transfer copyWithCompanion(TransfersCompanion data) {
    return Transfer(
      id: data.id.present ? data.id.value : this.id,
      fromLineStationId: data.fromLineStationId.present
          ? data.fromLineStationId.value
          : this.fromLineStationId,
      toLineStationId: data.toLineStationId.present
          ? data.toLineStationId.value
          : this.toLineStationId,
      walkingSeconds: data.walkingSeconds.present
          ? data.walkingSeconds.value
          : this.walkingSeconds,
      transferType: data.transferType.present
          ? data.transferType.value
          : this.transferType,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transfer(')
          ..write('id: $id, ')
          ..write('fromLineStationId: $fromLineStationId, ')
          ..write('toLineStationId: $toLineStationId, ')
          ..write('walkingSeconds: $walkingSeconds, ')
          ..write('transferType: $transferType, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fromLineStationId,
    toLineStationId,
    walkingSeconds,
    transferType,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transfer &&
          other.id == this.id &&
          other.fromLineStationId == this.fromLineStationId &&
          other.toLineStationId == this.toLineStationId &&
          other.walkingSeconds == this.walkingSeconds &&
          other.transferType == this.transferType &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransfersCompanion extends UpdateCompanion<Transfer> {
  final Value<int> id;
  final Value<int> fromLineStationId;
  final Value<int> toLineStationId;
  final Value<int> walkingSeconds;
  final Value<String?> transferType;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransfersCompanion({
    this.id = const Value.absent(),
    this.fromLineStationId = const Value.absent(),
    this.toLineStationId = const Value.absent(),
    this.walkingSeconds = const Value.absent(),
    this.transferType = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransfersCompanion.insert({
    this.id = const Value.absent(),
    required int fromLineStationId,
    required int toLineStationId,
    required int walkingSeconds,
    this.transferType = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : fromLineStationId = Value(fromLineStationId),
       toLineStationId = Value(toLineStationId),
       walkingSeconds = Value(walkingSeconds);
  static Insertable<Transfer> custom({
    Expression<int>? id,
    Expression<int>? fromLineStationId,
    Expression<int>? toLineStationId,
    Expression<int>? walkingSeconds,
    Expression<String>? transferType,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromLineStationId != null) 'from_line_station_id': fromLineStationId,
      if (toLineStationId != null) 'to_line_station_id': toLineStationId,
      if (walkingSeconds != null) 'walking_seconds': walkingSeconds,
      if (transferType != null) 'transfer_type': transferType,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransfersCompanion copyWith({
    Value<int>? id,
    Value<int>? fromLineStationId,
    Value<int>? toLineStationId,
    Value<int>? walkingSeconds,
    Value<String?>? transferType,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TransfersCompanion(
      id: id ?? this.id,
      fromLineStationId: fromLineStationId ?? this.fromLineStationId,
      toLineStationId: toLineStationId ?? this.toLineStationId,
      walkingSeconds: walkingSeconds ?? this.walkingSeconds,
      transferType: transferType ?? this.transferType,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fromLineStationId.present) {
      map['from_line_station_id'] = Variable<int>(fromLineStationId.value);
    }
    if (toLineStationId.present) {
      map['to_line_station_id'] = Variable<int>(toLineStationId.value);
    }
    if (walkingSeconds.present) {
      map['walking_seconds'] = Variable<int>(walkingSeconds.value);
    }
    if (transferType.present) {
      map['transfer_type'] = Variable<String>(transferType.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransfersCompanion(')
          ..write('id: $id, ')
          ..write('fromLineStationId: $fromLineStationId, ')
          ..write('toLineStationId: $toLineStationId, ')
          ..write('walkingSeconds: $walkingSeconds, ')
          ..write('transferType: $transferType, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StationsTable stations = $StationsTable(this);
  late final $LinesTable lines = $LinesTable(this);
  late final $LineStationsTable lineStations = $LineStationsTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    stations,
    lines,
    lineStations,
    transfers,
  ];
}

typedef $$StationsTableCreateCompanionBuilder =
    StationsCompanion Function({
      Value<int> id,
      required String stationKey,
      required String nameKo,
      Value<String?> nameEn,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$StationsTableUpdateCompanionBuilder =
    StationsCompanion Function({
      Value<int> id,
      Value<String> stationKey,
      Value<String> nameKo,
      Value<String?> nameEn,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$StationsTableReferences
    extends BaseReferences<_$AppDatabase, $StationsTable, Station> {
  $$StationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LineStationsTable, List<LineStation>>
  _lineStationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lineStations,
    aliasName: $_aliasNameGenerator(db.stations.id, db.lineStations.stationId),
  );

  $$LineStationsTableProcessedTableManager get lineStationsRefs {
    final manager = $$LineStationsTableTableManager(
      $_db,
      $_db.lineStations,
    ).filter((f) => f.stationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lineStationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StationsTableFilterComposer
    extends Composer<_$AppDatabase, $StationsTable> {
  $$StationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stationKey => $composableBuilder(
    column: $table.stationKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKo => $composableBuilder(
    column: $table.nameKo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lineStationsRefs(
    Expression<bool> Function($$LineStationsTableFilterComposer f) f,
  ) {
    final $$LineStationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.stationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableFilterComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StationsTableOrderingComposer
    extends Composer<_$AppDatabase, $StationsTable> {
  $$StationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stationKey => $composableBuilder(
    column: $table.stationKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKo => $composableBuilder(
    column: $table.nameKo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StationsTable> {
  $$StationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stationKey => $composableBuilder(
    column: $table.stationKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameKo =>
      $composableBuilder(column: $table.nameKo, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> lineStationsRefs<T extends Object>(
    Expression<T> Function($$LineStationsTableAnnotationComposer a) f,
  ) {
    final $$LineStationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.stationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StationsTable,
          Station,
          $$StationsTableFilterComposer,
          $$StationsTableOrderingComposer,
          $$StationsTableAnnotationComposer,
          $$StationsTableCreateCompanionBuilder,
          $$StationsTableUpdateCompanionBuilder,
          (Station, $$StationsTableReferences),
          Station,
          PrefetchHooks Function({bool lineStationsRefs})
        > {
  $$StationsTableTableManager(_$AppDatabase db, $StationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> stationKey = const Value.absent(),
                Value<String> nameKo = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationsCompanion(
                id: id,
                stationKey: stationKey,
                nameKo: nameKo,
                nameEn: nameEn,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String stationKey,
                required String nameKo,
                Value<String?> nameEn = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationsCompanion.insert(
                id: id,
                stationKey: stationKey,
                nameKo: nameKo,
                nameEn: nameEn,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lineStationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lineStationsRefs) db.lineStations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lineStationsRefs)
                    await $_getPrefetchedData<
                      Station,
                      $StationsTable,
                      LineStation
                    >(
                      currentTable: table,
                      referencedTable: $$StationsTableReferences
                          ._lineStationsRefsTable(db),
                      managerFromTypedResult: (p0) => $$StationsTableReferences(
                        db,
                        table,
                        p0,
                      ).lineStationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.stationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StationsTable,
      Station,
      $$StationsTableFilterComposer,
      $$StationsTableOrderingComposer,
      $$StationsTableAnnotationComposer,
      $$StationsTableCreateCompanionBuilder,
      $$StationsTableUpdateCompanionBuilder,
      (Station, $$StationsTableReferences),
      Station,
      PrefetchHooks Function({bool lineStationsRefs})
    >;
typedef $$LinesTableCreateCompanionBuilder =
    LinesCompanion Function({
      Value<int> id,
      required String lineKey,
      required String name,
      Value<String?> color,
      required String lineType,
      Value<String?> operator,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LinesTableUpdateCompanionBuilder =
    LinesCompanion Function({
      Value<int> id,
      Value<String> lineKey,
      Value<String> name,
      Value<String?> color,
      Value<String> lineType,
      Value<String?> operator,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$LinesTableReferences
    extends BaseReferences<_$AppDatabase, $LinesTable, Line> {
  $$LinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LineStationsTable, List<LineStation>>
  _lineStationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lineStations,
    aliasName: $_aliasNameGenerator(db.lines.id, db.lineStations.lineId),
  );

  $$LineStationsTableProcessedTableManager get lineStationsRefs {
    final manager = $$LineStationsTableTableManager(
      $_db,
      $_db.lineStations,
    ).filter((f) => f.lineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lineStationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LinesTableFilterComposer extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineKey => $composableBuilder(
    column: $table.lineKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operator => $composableBuilder(
    column: $table.operator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lineStationsRefs(
    Expression<bool> Function($$LineStationsTableFilterComposer f) f,
  ) {
    final $$LineStationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.lineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableFilterComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LinesTableOrderingComposer
    extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineKey => $composableBuilder(
    column: $table.lineKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operator => $composableBuilder(
    column: $table.operator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lineKey =>
      $composableBuilder(column: $table.lineKey, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get lineType =>
      $composableBuilder(column: $table.lineType, builder: (column) => column);

  GeneratedColumn<String> get operator =>
      $composableBuilder(column: $table.operator, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> lineStationsRefs<T extends Object>(
    Expression<T> Function($$LineStationsTableAnnotationComposer a) f,
  ) {
    final $$LineStationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.lineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinesTable,
          Line,
          $$LinesTableFilterComposer,
          $$LinesTableOrderingComposer,
          $$LinesTableAnnotationComposer,
          $$LinesTableCreateCompanionBuilder,
          $$LinesTableUpdateCompanionBuilder,
          (Line, $$LinesTableReferences),
          Line,
          PrefetchHooks Function({bool lineStationsRefs})
        > {
  $$LinesTableTableManager(_$AppDatabase db, $LinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> lineKey = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String> lineType = const Value.absent(),
                Value<String?> operator = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion(
                id: id,
                lineKey: lineKey,
                name: name,
                color: color,
                lineType: lineType,
                operator: operator,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String lineKey,
                required String name,
                Value<String?> color = const Value.absent(),
                required String lineType,
                Value<String?> operator = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion.insert(
                id: id,
                lineKey: lineKey,
                name: name,
                color: color,
                lineType: lineType,
                operator: operator,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LinesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({lineStationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lineStationsRefs) db.lineStations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lineStationsRefs)
                    await $_getPrefetchedData<Line, $LinesTable, LineStation>(
                      currentTable: table,
                      referencedTable: $$LinesTableReferences
                          ._lineStationsRefsTable(db),
                      managerFromTypedResult: (p0) => $$LinesTableReferences(
                        db,
                        table,
                        p0,
                      ).lineStationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.lineId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinesTable,
      Line,
      $$LinesTableFilterComposer,
      $$LinesTableOrderingComposer,
      $$LinesTableAnnotationComposer,
      $$LinesTableCreateCompanionBuilder,
      $$LinesTableUpdateCompanionBuilder,
      (Line, $$LinesTableReferences),
      Line,
      PrefetchHooks Function({bool lineStationsRefs})
    >;
typedef $$LineStationsTableCreateCompanionBuilder =
    LineStationsCompanion Function({
      Value<int> id,
      required int lineId,
      required int stationId,
      required String stationCode,
      Value<String?> stationNo,
      required int orderIndex,
      Value<String> branchKey,
      Value<bool> isTerminal,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LineStationsTableUpdateCompanionBuilder =
    LineStationsCompanion Function({
      Value<int> id,
      Value<int> lineId,
      Value<int> stationId,
      Value<String> stationCode,
      Value<String?> stationNo,
      Value<int> orderIndex,
      Value<String> branchKey,
      Value<bool> isTerminal,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$LineStationsTableReferences
    extends BaseReferences<_$AppDatabase, $LineStationsTable, LineStation> {
  $$LineStationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LinesTable _lineIdTable(_$AppDatabase db) => db.lines.createAlias(
    $_aliasNameGenerator(db.lineStations.lineId, db.lines.id),
  );

  $$LinesTableProcessedTableManager get lineId {
    final $_column = $_itemColumn<int>('line_id')!;

    final manager = $$LinesTableTableManager(
      $_db,
      $_db.lines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StationsTable _stationIdTable(_$AppDatabase db) =>
      db.stations.createAlias(
        $_aliasNameGenerator(db.lineStations.stationId, db.stations.id),
      );

  $$StationsTableProcessedTableManager get stationId {
    final $_column = $_itemColumn<int>('station_id')!;

    final manager = $$StationsTableTableManager(
      $_db,
      $_db.stations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransfersTable, List<Transfer>>
  _outgoingTransfersTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transfers,
    aliasName: $_aliasNameGenerator(
      db.lineStations.id,
      db.transfers.fromLineStationId,
    ),
  );

  $$TransfersTableProcessedTableManager get outgoingTransfers {
    final manager = $$TransfersTableTableManager(
      $_db,
      $_db.transfers,
    ).filter((f) => f.fromLineStationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_outgoingTransfersTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransfersTable, List<Transfer>>
  _incomingTransfersTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transfers,
    aliasName: $_aliasNameGenerator(
      db.lineStations.id,
      db.transfers.toLineStationId,
    ),
  );

  $$TransfersTableProcessedTableManager get incomingTransfers {
    final manager = $$TransfersTableTableManager(
      $_db,
      $_db.transfers,
    ).filter((f) => f.toLineStationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomingTransfersTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LineStationsTableFilterComposer
    extends Composer<_$AppDatabase, $LineStationsTable> {
  $$LineStationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stationCode => $composableBuilder(
    column: $table.stationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stationNo => $composableBuilder(
    column: $table.stationNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get branchKey => $composableBuilder(
    column: $table.branchKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LinesTableFilterComposer get lineId {
    final $$LinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineId,
      referencedTable: $db.lines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinesTableFilterComposer(
            $db: $db,
            $table: $db.lines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StationsTableFilterComposer get stationId {
    final $$StationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stationId,
      referencedTable: $db.stations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StationsTableFilterComposer(
            $db: $db,
            $table: $db.stations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> outgoingTransfers(
    Expression<bool> Function($$TransfersTableFilterComposer f) f,
  ) {
    final $$TransfersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transfers,
      getReferencedColumn: (t) => t.fromLineStationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransfersTableFilterComposer(
            $db: $db,
            $table: $db.transfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> incomingTransfers(
    Expression<bool> Function($$TransfersTableFilterComposer f) f,
  ) {
    final $$TransfersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transfers,
      getReferencedColumn: (t) => t.toLineStationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransfersTableFilterComposer(
            $db: $db,
            $table: $db.transfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LineStationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LineStationsTable> {
  $$LineStationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stationCode => $composableBuilder(
    column: $table.stationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stationNo => $composableBuilder(
    column: $table.stationNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get branchKey => $composableBuilder(
    column: $table.branchKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LinesTableOrderingComposer get lineId {
    final $$LinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineId,
      referencedTable: $db.lines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinesTableOrderingComposer(
            $db: $db,
            $table: $db.lines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StationsTableOrderingComposer get stationId {
    final $$StationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stationId,
      referencedTable: $db.stations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StationsTableOrderingComposer(
            $db: $db,
            $table: $db.stations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LineStationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LineStationsTable> {
  $$LineStationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stationCode => $composableBuilder(
    column: $table.stationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stationNo =>
      $composableBuilder(column: $table.stationNo, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get branchKey =>
      $composableBuilder(column: $table.branchKey, builder: (column) => column);

  GeneratedColumn<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LinesTableAnnotationComposer get lineId {
    final $$LinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineId,
      referencedTable: $db.lines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinesTableAnnotationComposer(
            $db: $db,
            $table: $db.lines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StationsTableAnnotationComposer get stationId {
    final $$StationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stationId,
      referencedTable: $db.stations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StationsTableAnnotationComposer(
            $db: $db,
            $table: $db.stations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> outgoingTransfers<T extends Object>(
    Expression<T> Function($$TransfersTableAnnotationComposer a) f,
  ) {
    final $$TransfersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transfers,
      getReferencedColumn: (t) => t.fromLineStationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransfersTableAnnotationComposer(
            $db: $db,
            $table: $db.transfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> incomingTransfers<T extends Object>(
    Expression<T> Function($$TransfersTableAnnotationComposer a) f,
  ) {
    final $$TransfersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transfers,
      getReferencedColumn: (t) => t.toLineStationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransfersTableAnnotationComposer(
            $db: $db,
            $table: $db.transfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LineStationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LineStationsTable,
          LineStation,
          $$LineStationsTableFilterComposer,
          $$LineStationsTableOrderingComposer,
          $$LineStationsTableAnnotationComposer,
          $$LineStationsTableCreateCompanionBuilder,
          $$LineStationsTableUpdateCompanionBuilder,
          (LineStation, $$LineStationsTableReferences),
          LineStation,
          PrefetchHooks Function({
            bool lineId,
            bool stationId,
            bool outgoingTransfers,
            bool incomingTransfers,
          })
        > {
  $$LineStationsTableTableManager(_$AppDatabase db, $LineStationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LineStationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LineStationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LineStationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lineId = const Value.absent(),
                Value<int> stationId = const Value.absent(),
                Value<String> stationCode = const Value.absent(),
                Value<String?> stationNo = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> branchKey = const Value.absent(),
                Value<bool> isTerminal = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LineStationsCompanion(
                id: id,
                lineId: lineId,
                stationId: stationId,
                stationCode: stationCode,
                stationNo: stationNo,
                orderIndex: orderIndex,
                branchKey: branchKey,
                isTerminal: isTerminal,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lineId,
                required int stationId,
                required String stationCode,
                Value<String?> stationNo = const Value.absent(),
                required int orderIndex,
                Value<String> branchKey = const Value.absent(),
                Value<bool> isTerminal = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LineStationsCompanion.insert(
                id: id,
                lineId: lineId,
                stationId: stationId,
                stationCode: stationCode,
                stationNo: stationNo,
                orderIndex: orderIndex,
                branchKey: branchKey,
                isTerminal: isTerminal,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LineStationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                lineId = false,
                stationId = false,
                outgoingTransfers = false,
                incomingTransfers = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (outgoingTransfers) db.transfers,
                    if (incomingTransfers) db.transfers,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lineId,
                                    referencedTable:
                                        $$LineStationsTableReferences
                                            ._lineIdTable(db),
                                    referencedColumn:
                                        $$LineStationsTableReferences
                                            ._lineIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (stationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stationId,
                                    referencedTable:
                                        $$LineStationsTableReferences
                                            ._stationIdTable(db),
                                    referencedColumn:
                                        $$LineStationsTableReferences
                                            ._stationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (outgoingTransfers)
                        await $_getPrefetchedData<
                          LineStation,
                          $LineStationsTable,
                          Transfer
                        >(
                          currentTable: table,
                          referencedTable: $$LineStationsTableReferences
                              ._outgoingTransfersTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStationsTableReferences(
                                db,
                                table,
                                p0,
                              ).outgoingTransfers,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.fromLineStationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (incomingTransfers)
                        await $_getPrefetchedData<
                          LineStation,
                          $LineStationsTable,
                          Transfer
                        >(
                          currentTable: table,
                          referencedTable: $$LineStationsTableReferences
                              ._incomingTransfersTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStationsTableReferences(
                                db,
                                table,
                                p0,
                              ).incomingTransfers,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.toLineStationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LineStationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LineStationsTable,
      LineStation,
      $$LineStationsTableFilterComposer,
      $$LineStationsTableOrderingComposer,
      $$LineStationsTableAnnotationComposer,
      $$LineStationsTableCreateCompanionBuilder,
      $$LineStationsTableUpdateCompanionBuilder,
      (LineStation, $$LineStationsTableReferences),
      LineStation,
      PrefetchHooks Function({
        bool lineId,
        bool stationId,
        bool outgoingTransfers,
        bool incomingTransfers,
      })
    >;
typedef $$TransfersTableCreateCompanionBuilder =
    TransfersCompanion Function({
      Value<int> id,
      required int fromLineStationId,
      required int toLineStationId,
      required int walkingSeconds,
      Value<String?> transferType,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$TransfersTableUpdateCompanionBuilder =
    TransfersCompanion Function({
      Value<int> id,
      Value<int> fromLineStationId,
      Value<int> toLineStationId,
      Value<int> walkingSeconds,
      Value<String?> transferType,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$TransfersTableReferences
    extends BaseReferences<_$AppDatabase, $TransfersTable, Transfer> {
  $$TransfersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LineStationsTable _fromLineStationIdTable(_$AppDatabase db) =>
      db.lineStations.createAlias(
        $_aliasNameGenerator(
          db.transfers.fromLineStationId,
          db.lineStations.id,
        ),
      );

  $$LineStationsTableProcessedTableManager get fromLineStationId {
    final $_column = $_itemColumn<int>('from_line_station_id')!;

    final manager = $$LineStationsTableTableManager(
      $_db,
      $_db.lineStations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromLineStationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LineStationsTable _toLineStationIdTable(_$AppDatabase db) =>
      db.lineStations.createAlias(
        $_aliasNameGenerator(db.transfers.toLineStationId, db.lineStations.id),
      );

  $$LineStationsTableProcessedTableManager get toLineStationId {
    final $_column = $_itemColumn<int>('to_line_station_id')!;

    final manager = $$LineStationsTableTableManager(
      $_db,
      $_db.lineStations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toLineStationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransfersTableFilterComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get walkingSeconds => $composableBuilder(
    column: $table.walkingSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LineStationsTableFilterComposer get fromLineStationId {
    final $$LineStationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableFilterComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStationsTableFilterComposer get toLineStationId {
    final $$LineStationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableFilterComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get walkingSeconds => $composableBuilder(
    column: $table.walkingSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LineStationsTableOrderingComposer get fromLineStationId {
    final $$LineStationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStationsTableOrderingComposer get toLineStationId {
    final $$LineStationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get walkingSeconds => $composableBuilder(
    column: $table.walkingSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LineStationsTableAnnotationComposer get fromLineStationId {
    final $$LineStationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fromLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStationsTableAnnotationComposer get toLineStationId {
    final $$LineStationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toLineStationId,
      referencedTable: $db.lineStations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStationsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransfersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransfersTable,
          Transfer,
          $$TransfersTableFilterComposer,
          $$TransfersTableOrderingComposer,
          $$TransfersTableAnnotationComposer,
          $$TransfersTableCreateCompanionBuilder,
          $$TransfersTableUpdateCompanionBuilder,
          (Transfer, $$TransfersTableReferences),
          Transfer,
          PrefetchHooks Function({bool fromLineStationId, bool toLineStationId})
        > {
  $$TransfersTableTableManager(_$AppDatabase db, $TransfersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> fromLineStationId = const Value.absent(),
                Value<int> toLineStationId = const Value.absent(),
                Value<int> walkingSeconds = const Value.absent(),
                Value<String?> transferType = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransfersCompanion(
                id: id,
                fromLineStationId: fromLineStationId,
                toLineStationId: toLineStationId,
                walkingSeconds: walkingSeconds,
                transferType: transferType,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int fromLineStationId,
                required int toLineStationId,
                required int walkingSeconds,
                Value<String?> transferType = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransfersCompanion.insert(
                id: id,
                fromLineStationId: fromLineStationId,
                toLineStationId: toLineStationId,
                walkingSeconds: walkingSeconds,
                transferType: transferType,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransfersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({fromLineStationId = false, toLineStationId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (fromLineStationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.fromLineStationId,
                                    referencedTable: $$TransfersTableReferences
                                        ._fromLineStationIdTable(db),
                                    referencedColumn: $$TransfersTableReferences
                                        ._fromLineStationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (toLineStationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.toLineStationId,
                                    referencedTable: $$TransfersTableReferences
                                        ._toLineStationIdTable(db),
                                    referencedColumn: $$TransfersTableReferences
                                        ._toLineStationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TransfersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransfersTable,
      Transfer,
      $$TransfersTableFilterComposer,
      $$TransfersTableOrderingComposer,
      $$TransfersTableAnnotationComposer,
      $$TransfersTableCreateCompanionBuilder,
      $$TransfersTableUpdateCompanionBuilder,
      (Transfer, $$TransfersTableReferences),
      Transfer,
      PrefetchHooks Function({bool fromLineStationId, bool toLineStationId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StationsTableTableManager get stations =>
      $$StationsTableTableManager(_db, _db.stations);
  $$LinesTableTableManager get lines =>
      $$LinesTableTableManager(_db, _db.lines);
  $$LineStationsTableTableManager get lineStations =>
      $$LineStationsTableTableManager(_db, _db.lineStations);
  $$TransfersTableTableManager get transfers =>
      $$TransfersTableTableManager(_db, _db.transfers);
}
