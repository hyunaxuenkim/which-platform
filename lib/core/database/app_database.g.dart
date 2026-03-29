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
  static const VerificationMeta _nameJpMeta = const VerificationMeta('nameJp');
  @override
  late final GeneratedColumn<String> nameJp = GeneratedColumn<String>(
    'name_jp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameChMeta = const VerificationMeta('nameCh');
  @override
  late final GeneratedColumn<String> nameCh = GeneratedColumn<String>(
    'name_ch',
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
    nameKo,
    nameEn,
    nameJp,
    nameCh,
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
    if (data.containsKey('name_jp')) {
      context.handle(
        _nameJpMeta,
        nameJp.isAcceptableOrUnknown(data['name_jp']!, _nameJpMeta),
      );
    }
    if (data.containsKey('name_ch')) {
      context.handle(
        _nameChMeta,
        nameCh.isAcceptableOrUnknown(data['name_ch']!, _nameChMeta),
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
      nameKo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ko'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      ),
      nameJp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_jp'],
      ),
      nameCh: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ch'],
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
  final String nameKo;
  final String? nameEn;
  final String? nameJp;
  final String? nameCh;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Station({
    required this.id,
    required this.nameKo,
    this.nameEn,
    this.nameJp,
    this.nameCh,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ko'] = Variable<String>(nameKo);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String>(nameEn);
    }
    if (!nullToAbsent || nameJp != null) {
      map['name_jp'] = Variable<String>(nameJp);
    }
    if (!nullToAbsent || nameCh != null) {
      map['name_ch'] = Variable<String>(nameCh);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StationsCompanion toCompanion(bool nullToAbsent) {
    return StationsCompanion(
      id: Value(id),
      nameKo: Value(nameKo),
      nameEn: nameEn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameEn),
      nameJp: nameJp == null && nullToAbsent
          ? const Value.absent()
          : Value(nameJp),
      nameCh: nameCh == null && nullToAbsent
          ? const Value.absent()
          : Value(nameCh),
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
      nameKo: serializer.fromJson<String>(json['nameKo']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      nameJp: serializer.fromJson<String?>(json['nameJp']),
      nameCh: serializer.fromJson<String?>(json['nameCh']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameKo': serializer.toJson<String>(nameKo),
      'nameEn': serializer.toJson<String?>(nameEn),
      'nameJp': serializer.toJson<String?>(nameJp),
      'nameCh': serializer.toJson<String?>(nameCh),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Station copyWith({
    int? id,
    String? nameKo,
    Value<String?> nameEn = const Value.absent(),
    Value<String?> nameJp = const Value.absent(),
    Value<String?> nameCh = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Station(
    id: id ?? this.id,
    nameKo: nameKo ?? this.nameKo,
    nameEn: nameEn.present ? nameEn.value : this.nameEn,
    nameJp: nameJp.present ? nameJp.value : this.nameJp,
    nameCh: nameCh.present ? nameCh.value : this.nameCh,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Station copyWithCompanion(StationsCompanion data) {
    return Station(
      id: data.id.present ? data.id.value : this.id,
      nameKo: data.nameKo.present ? data.nameKo.value : this.nameKo,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameJp: data.nameJp.present ? data.nameJp.value : this.nameJp,
      nameCh: data.nameCh.present ? data.nameCh.value : this.nameCh,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Station(')
          ..write('id: $id, ')
          ..write('nameKo: $nameKo, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameJp: $nameJp, ')
          ..write('nameCh: $nameCh, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nameKo, nameEn, nameJp, nameCh, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Station &&
          other.id == this.id &&
          other.nameKo == this.nameKo &&
          other.nameEn == this.nameEn &&
          other.nameJp == this.nameJp &&
          other.nameCh == this.nameCh &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StationsCompanion extends UpdateCompanion<Station> {
  final Value<int> id;
  final Value<String> nameKo;
  final Value<String?> nameEn;
  final Value<String?> nameJp;
  final Value<String?> nameCh;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StationsCompanion({
    this.id = const Value.absent(),
    this.nameKo = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameJp = const Value.absent(),
    this.nameCh = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StationsCompanion.insert({
    this.id = const Value.absent(),
    required String nameKo,
    this.nameEn = const Value.absent(),
    this.nameJp = const Value.absent(),
    this.nameCh = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : nameKo = Value(nameKo);
  static Insertable<Station> custom({
    Expression<int>? id,
    Expression<String>? nameKo,
    Expression<String>? nameEn,
    Expression<String>? nameJp,
    Expression<String>? nameCh,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameKo != null) 'name_ko': nameKo,
      if (nameEn != null) 'name_en': nameEn,
      if (nameJp != null) 'name_jp': nameJp,
      if (nameCh != null) 'name_ch': nameCh,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StationsCompanion copyWith({
    Value<int>? id,
    Value<String>? nameKo,
    Value<String?>? nameEn,
    Value<String?>? nameJp,
    Value<String?>? nameCh,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StationsCompanion(
      id: id ?? this.id,
      nameKo: nameKo ?? this.nameKo,
      nameEn: nameEn ?? this.nameEn,
      nameJp: nameJp ?? this.nameJp,
      nameCh: nameCh ?? this.nameCh,
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
    if (nameKo.present) {
      map['name_ko'] = Variable<String>(nameKo.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameJp.present) {
      map['name_jp'] = Variable<String>(nameJp.value);
    }
    if (nameCh.present) {
      map['name_ch'] = Variable<String>(nameCh.value);
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
          ..write('nameKo: $nameKo, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameJp: $nameJp, ')
          ..write('nameCh: $nameCh, ')
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (line_type IS NULL OR line_type IN (\'LINEAR\', \'LOOP\', \'BRANCH\'))',
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
    name,
    color,
    lineType,
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
  final String name;
  final String? color;
  final String? lineType;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Line({
    required this.id,
    required this.name,
    this.color,
    this.lineType,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || lineType != null) {
      map['line_type'] = Variable<String>(lineType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LinesCompanion toCompanion(bool nullToAbsent) {
    return LinesCompanion(
      id: Value(id),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      lineType: lineType == null && nullToAbsent
          ? const Value.absent()
          : Value(lineType),
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
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      lineType: serializer.fromJson<String?>(json['lineType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'lineType': serializer.toJson<String?>(lineType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Line copyWith({
    int? id,
    String? name,
    Value<String?> color = const Value.absent(),
    Value<String?> lineType = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Line(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    lineType: lineType.present ? lineType.value : this.lineType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Line copyWithCompanion(LinesCompanion data) {
    return Line(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      lineType: data.lineType.present ? data.lineType.value : this.lineType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Line(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('lineType: $lineType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, lineType, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Line &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.lineType == this.lineType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LinesCompanion extends UpdateCompanion<Line> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String?> lineType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.lineType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.lineType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Line> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? lineType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (lineType != null) 'line_type': lineType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LinesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? color,
    Value<String?>? lineType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      lineType: lineType ?? this.lineType,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (lineType.present) {
      map['line_type'] = Variable<String>(lineType.value);
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
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('lineType: $lineType, ')
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
    {lineId, stationId, branchKey},
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

class $DirectionPoliciesTable extends DirectionPolicies
    with TableInfo<$DirectionPoliciesTable, DirectionPolicy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DirectionPoliciesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _directionKindMeta = const VerificationMeta(
    'directionKind',
  );
  @override
  late final GeneratedColumn<String> directionKind = GeneratedColumn<String>(
    'direction_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'CHECK (direction_kind IN (\'UP\', \'DOWN\', \'INNER\', \'OUTER\', \'TERMINAL\', \'BRANCH\'))',
  );
  static const VerificationMeta _apiDirectionMeta = const VerificationMeta(
    'apiDirection',
  );
  @override
  late final GeneratedColumn<String> apiDirection = GeneratedColumn<String>(
    'api_direction',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (api_direction IS NULL OR api_direction IN (\'상행\', \'하행\', \'내선\', \'외선\'))',
  );
  static const VerificationMeta _apiTerminalStationCodeMeta =
      const VerificationMeta('apiTerminalStationCode');
  @override
  late final GeneratedColumn<String> apiTerminalStationCode =
      GeneratedColumn<String>(
        'api_terminal_station_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _displayLabelKoMeta = const VerificationMeta(
    'displayLabelKo',
  );
  @override
  late final GeneratedColumn<String> displayLabelKo = GeneratedColumn<String>(
    'display_label_ko',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    lineId,
    branchKey,
    directionKind,
    apiDirection,
    apiTerminalStationCode,
    displayLabelKo,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'direction_policies';
  @override
  VerificationContext validateIntegrity(
    Insertable<DirectionPolicy> instance, {
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
    if (data.containsKey('branch_key')) {
      context.handle(
        _branchKeyMeta,
        branchKey.isAcceptableOrUnknown(data['branch_key']!, _branchKeyMeta),
      );
    }
    if (data.containsKey('direction_kind')) {
      context.handle(
        _directionKindMeta,
        directionKind.isAcceptableOrUnknown(
          data['direction_kind']!,
          _directionKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_directionKindMeta);
    }
    if (data.containsKey('api_direction')) {
      context.handle(
        _apiDirectionMeta,
        apiDirection.isAcceptableOrUnknown(
          data['api_direction']!,
          _apiDirectionMeta,
        ),
      );
    }
    if (data.containsKey('api_terminal_station_code')) {
      context.handle(
        _apiTerminalStationCodeMeta,
        apiTerminalStationCode.isAcceptableOrUnknown(
          data['api_terminal_station_code']!,
          _apiTerminalStationCodeMeta,
        ),
      );
    }
    if (data.containsKey('display_label_ko')) {
      context.handle(
        _displayLabelKoMeta,
        displayLabelKo.isAcceptableOrUnknown(
          data['display_label_ko']!,
          _displayLabelKoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayLabelKoMeta);
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
    {lineId, branchKey, directionKind, apiDirection, apiTerminalStationCode},
  ];
  @override
  DirectionPolicy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DirectionPolicy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_id'],
      )!,
      branchKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}branch_key'],
      )!,
      directionKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction_kind'],
      )!,
      apiDirection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_direction'],
      ),
      apiTerminalStationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_terminal_station_code'],
      ),
      displayLabelKo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_label_ko'],
      )!,
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
  $DirectionPoliciesTable createAlias(String alias) {
    return $DirectionPoliciesTable(attachedDatabase, alias);
  }
}

class DirectionPolicy extends DataClass implements Insertable<DirectionPolicy> {
  final int id;
  final int lineId;
  final String branchKey;
  final String directionKind;
  final String? apiDirection;
  final String? apiTerminalStationCode;
  final String displayLabelKo;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DirectionPolicy({
    required this.id,
    required this.lineId,
    required this.branchKey,
    required this.directionKind,
    this.apiDirection,
    this.apiTerminalStationCode,
    required this.displayLabelKo,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_id'] = Variable<int>(lineId);
    map['branch_key'] = Variable<String>(branchKey);
    map['direction_kind'] = Variable<String>(directionKind);
    if (!nullToAbsent || apiDirection != null) {
      map['api_direction'] = Variable<String>(apiDirection);
    }
    if (!nullToAbsent || apiTerminalStationCode != null) {
      map['api_terminal_station_code'] = Variable<String>(
        apiTerminalStationCode,
      );
    }
    map['display_label_ko'] = Variable<String>(displayLabelKo);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DirectionPoliciesCompanion toCompanion(bool nullToAbsent) {
    return DirectionPoliciesCompanion(
      id: Value(id),
      lineId: Value(lineId),
      branchKey: Value(branchKey),
      directionKind: Value(directionKind),
      apiDirection: apiDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(apiDirection),
      apiTerminalStationCode: apiTerminalStationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(apiTerminalStationCode),
      displayLabelKo: Value(displayLabelKo),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DirectionPolicy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DirectionPolicy(
      id: serializer.fromJson<int>(json['id']),
      lineId: serializer.fromJson<int>(json['lineId']),
      branchKey: serializer.fromJson<String>(json['branchKey']),
      directionKind: serializer.fromJson<String>(json['directionKind']),
      apiDirection: serializer.fromJson<String?>(json['apiDirection']),
      apiTerminalStationCode: serializer.fromJson<String?>(
        json['apiTerminalStationCode'],
      ),
      displayLabelKo: serializer.fromJson<String>(json['displayLabelKo']),
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
      'lineId': serializer.toJson<int>(lineId),
      'branchKey': serializer.toJson<String>(branchKey),
      'directionKind': serializer.toJson<String>(directionKind),
      'apiDirection': serializer.toJson<String?>(apiDirection),
      'apiTerminalStationCode': serializer.toJson<String?>(
        apiTerminalStationCode,
      ),
      'displayLabelKo': serializer.toJson<String>(displayLabelKo),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DirectionPolicy copyWith({
    int? id,
    int? lineId,
    String? branchKey,
    String? directionKind,
    Value<String?> apiDirection = const Value.absent(),
    Value<String?> apiTerminalStationCode = const Value.absent(),
    String? displayLabelKo,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DirectionPolicy(
    id: id ?? this.id,
    lineId: lineId ?? this.lineId,
    branchKey: branchKey ?? this.branchKey,
    directionKind: directionKind ?? this.directionKind,
    apiDirection: apiDirection.present ? apiDirection.value : this.apiDirection,
    apiTerminalStationCode: apiTerminalStationCode.present
        ? apiTerminalStationCode.value
        : this.apiTerminalStationCode,
    displayLabelKo: displayLabelKo ?? this.displayLabelKo,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DirectionPolicy copyWithCompanion(DirectionPoliciesCompanion data) {
    return DirectionPolicy(
      id: data.id.present ? data.id.value : this.id,
      lineId: data.lineId.present ? data.lineId.value : this.lineId,
      branchKey: data.branchKey.present ? data.branchKey.value : this.branchKey,
      directionKind: data.directionKind.present
          ? data.directionKind.value
          : this.directionKind,
      apiDirection: data.apiDirection.present
          ? data.apiDirection.value
          : this.apiDirection,
      apiTerminalStationCode: data.apiTerminalStationCode.present
          ? data.apiTerminalStationCode.value
          : this.apiTerminalStationCode,
      displayLabelKo: data.displayLabelKo.present
          ? data.displayLabelKo.value
          : this.displayLabelKo,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DirectionPolicy(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('branchKey: $branchKey, ')
          ..write('directionKind: $directionKind, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('displayLabelKo: $displayLabelKo, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lineId,
    branchKey,
    directionKind,
    apiDirection,
    apiTerminalStationCode,
    displayLabelKo,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DirectionPolicy &&
          other.id == this.id &&
          other.lineId == this.lineId &&
          other.branchKey == this.branchKey &&
          other.directionKind == this.directionKind &&
          other.apiDirection == this.apiDirection &&
          other.apiTerminalStationCode == this.apiTerminalStationCode &&
          other.displayLabelKo == this.displayLabelKo &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DirectionPoliciesCompanion extends UpdateCompanion<DirectionPolicy> {
  final Value<int> id;
  final Value<int> lineId;
  final Value<String> branchKey;
  final Value<String> directionKind;
  final Value<String?> apiDirection;
  final Value<String?> apiTerminalStationCode;
  final Value<String> displayLabelKo;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DirectionPoliciesCompanion({
    this.id = const Value.absent(),
    this.lineId = const Value.absent(),
    this.branchKey = const Value.absent(),
    this.directionKind = const Value.absent(),
    this.apiDirection = const Value.absent(),
    this.apiTerminalStationCode = const Value.absent(),
    this.displayLabelKo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DirectionPoliciesCompanion.insert({
    this.id = const Value.absent(),
    required int lineId,
    this.branchKey = const Value.absent(),
    required String directionKind,
    this.apiDirection = const Value.absent(),
    this.apiTerminalStationCode = const Value.absent(),
    required String displayLabelKo,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lineId = Value(lineId),
       directionKind = Value(directionKind),
       displayLabelKo = Value(displayLabelKo);
  static Insertable<DirectionPolicy> custom({
    Expression<int>? id,
    Expression<int>? lineId,
    Expression<String>? branchKey,
    Expression<String>? directionKind,
    Expression<String>? apiDirection,
    Expression<String>? apiTerminalStationCode,
    Expression<String>? displayLabelKo,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineId != null) 'line_id': lineId,
      if (branchKey != null) 'branch_key': branchKey,
      if (directionKind != null) 'direction_kind': directionKind,
      if (apiDirection != null) 'api_direction': apiDirection,
      if (apiTerminalStationCode != null)
        'api_terminal_station_code': apiTerminalStationCode,
      if (displayLabelKo != null) 'display_label_ko': displayLabelKo,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DirectionPoliciesCompanion copyWith({
    Value<int>? id,
    Value<int>? lineId,
    Value<String>? branchKey,
    Value<String>? directionKind,
    Value<String?>? apiDirection,
    Value<String?>? apiTerminalStationCode,
    Value<String>? displayLabelKo,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DirectionPoliciesCompanion(
      id: id ?? this.id,
      lineId: lineId ?? this.lineId,
      branchKey: branchKey ?? this.branchKey,
      directionKind: directionKind ?? this.directionKind,
      apiDirection: apiDirection ?? this.apiDirection,
      apiTerminalStationCode:
          apiTerminalStationCode ?? this.apiTerminalStationCode,
      displayLabelKo: displayLabelKo ?? this.displayLabelKo,
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
    if (lineId.present) {
      map['line_id'] = Variable<int>(lineId.value);
    }
    if (branchKey.present) {
      map['branch_key'] = Variable<String>(branchKey.value);
    }
    if (directionKind.present) {
      map['direction_kind'] = Variable<String>(directionKind.value);
    }
    if (apiDirection.present) {
      map['api_direction'] = Variable<String>(apiDirection.value);
    }
    if (apiTerminalStationCode.present) {
      map['api_terminal_station_code'] = Variable<String>(
        apiTerminalStationCode.value,
      );
    }
    if (displayLabelKo.present) {
      map['display_label_ko'] = Variable<String>(displayLabelKo.value);
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
    return (StringBuffer('DirectionPoliciesCompanion(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('branchKey: $branchKey, ')
          ..write('directionKind: $directionKind, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('displayLabelKo: $displayLabelKo, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StationTransitionOverridesTable extends StationTransitionOverrides
    with
        TableInfo<$StationTransitionOverridesTable, StationTransitionOverride> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StationTransitionOverridesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _currentStationCodeMeta =
      const VerificationMeta('currentStationCode');
  @override
  late final GeneratedColumn<String> currentStationCode =
      GeneratedColumn<String>(
        'current_station_code',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nextStationCodeMeta = const VerificationMeta(
    'nextStationCode',
  );
  @override
  late final GeneratedColumn<String> nextStationCode = GeneratedColumn<String>(
    'next_station_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiTerminalStationCodeMeta =
      const VerificationMeta('apiTerminalStationCode');
  @override
  late final GeneratedColumn<String> apiTerminalStationCode =
      GeneratedColumn<String>(
        'api_terminal_station_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _apiTerminalStationNameMeta =
      const VerificationMeta('apiTerminalStationName');
  @override
  late final GeneratedColumn<String> apiTerminalStationName =
      GeneratedColumn<String>(
        'api_terminal_station_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _apiDirectionMeta = const VerificationMeta(
    'apiDirection',
  );
  @override
  late final GeneratedColumn<String> apiDirection = GeneratedColumn<String>(
    'api_direction',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (api_direction IS NULL OR api_direction IN (\'상행\', \'하행\', \'내선\', \'외선\'))',
  );
  static const VerificationMeta _resolvedBranchKeyMeta = const VerificationMeta(
    'resolvedBranchKey',
  );
  @override
  late final GeneratedColumn<String> resolvedBranchKey =
      GeneratedColumn<String>(
        'resolved_branch_key',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _prevStationCodeMeta = const VerificationMeta(
    'prevStationCode',
  );
  @override
  late final GeneratedColumn<String> prevStationCode = GeneratedColumn<String>(
    'prev_station_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
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
    lineId,
    currentStationCode,
    nextStationCode,
    apiTerminalStationCode,
    apiTerminalStationName,
    apiDirection,
    resolvedBranchKey,
    prevStationCode,
    priority,
    note,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'station_transition_overrides';
  @override
  VerificationContext validateIntegrity(
    Insertable<StationTransitionOverride> instance, {
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
    if (data.containsKey('current_station_code')) {
      context.handle(
        _currentStationCodeMeta,
        currentStationCode.isAcceptableOrUnknown(
          data['current_station_code']!,
          _currentStationCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentStationCodeMeta);
    }
    if (data.containsKey('next_station_code')) {
      context.handle(
        _nextStationCodeMeta,
        nextStationCode.isAcceptableOrUnknown(
          data['next_station_code']!,
          _nextStationCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextStationCodeMeta);
    }
    if (data.containsKey('api_terminal_station_code')) {
      context.handle(
        _apiTerminalStationCodeMeta,
        apiTerminalStationCode.isAcceptableOrUnknown(
          data['api_terminal_station_code']!,
          _apiTerminalStationCodeMeta,
        ),
      );
    }
    if (data.containsKey('api_terminal_station_name')) {
      context.handle(
        _apiTerminalStationNameMeta,
        apiTerminalStationName.isAcceptableOrUnknown(
          data['api_terminal_station_name']!,
          _apiTerminalStationNameMeta,
        ),
      );
    }
    if (data.containsKey('api_direction')) {
      context.handle(
        _apiDirectionMeta,
        apiDirection.isAcceptableOrUnknown(
          data['api_direction']!,
          _apiDirectionMeta,
        ),
      );
    }
    if (data.containsKey('resolved_branch_key')) {
      context.handle(
        _resolvedBranchKeyMeta,
        resolvedBranchKey.isAcceptableOrUnknown(
          data['resolved_branch_key']!,
          _resolvedBranchKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_resolvedBranchKeyMeta);
    }
    if (data.containsKey('prev_station_code')) {
      context.handle(
        _prevStationCodeMeta,
        prevStationCode.isAcceptableOrUnknown(
          data['prev_station_code']!,
          _prevStationCodeMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
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
  StationTransitionOverride map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StationTransitionOverride(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_id'],
      )!,
      currentStationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_station_code'],
      )!,
      nextStationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_station_code'],
      )!,
      apiTerminalStationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_terminal_station_code'],
      ),
      apiTerminalStationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_terminal_station_name'],
      ),
      apiDirection: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_direction'],
      ),
      resolvedBranchKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolved_branch_key'],
      )!,
      prevStationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prev_station_code'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
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
  $StationTransitionOverridesTable createAlias(String alias) {
    return $StationTransitionOverridesTable(attachedDatabase, alias);
  }
}

class StationTransitionOverride extends DataClass
    implements Insertable<StationTransitionOverride> {
  final int id;
  final int lineId;
  final String currentStationCode;
  final String nextStationCode;
  final String? apiTerminalStationCode;
  final String? apiTerminalStationName;
  final String? apiDirection;
  final String resolvedBranchKey;
  final String? prevStationCode;
  final int priority;
  final String? note;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const StationTransitionOverride({
    required this.id,
    required this.lineId,
    required this.currentStationCode,
    required this.nextStationCode,
    this.apiTerminalStationCode,
    this.apiTerminalStationName,
    this.apiDirection,
    required this.resolvedBranchKey,
    this.prevStationCode,
    required this.priority,
    this.note,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_id'] = Variable<int>(lineId);
    map['current_station_code'] = Variable<String>(currentStationCode);
    map['next_station_code'] = Variable<String>(nextStationCode);
    if (!nullToAbsent || apiTerminalStationCode != null) {
      map['api_terminal_station_code'] = Variable<String>(
        apiTerminalStationCode,
      );
    }
    if (!nullToAbsent || apiTerminalStationName != null) {
      map['api_terminal_station_name'] = Variable<String>(
        apiTerminalStationName,
      );
    }
    if (!nullToAbsent || apiDirection != null) {
      map['api_direction'] = Variable<String>(apiDirection);
    }
    map['resolved_branch_key'] = Variable<String>(resolvedBranchKey);
    if (!nullToAbsent || prevStationCode != null) {
      map['prev_station_code'] = Variable<String>(prevStationCode);
    }
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StationTransitionOverridesCompanion toCompanion(bool nullToAbsent) {
    return StationTransitionOverridesCompanion(
      id: Value(id),
      lineId: Value(lineId),
      currentStationCode: Value(currentStationCode),
      nextStationCode: Value(nextStationCode),
      apiTerminalStationCode: apiTerminalStationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(apiTerminalStationCode),
      apiTerminalStationName: apiTerminalStationName == null && nullToAbsent
          ? const Value.absent()
          : Value(apiTerminalStationName),
      apiDirection: apiDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(apiDirection),
      resolvedBranchKey: Value(resolvedBranchKey),
      prevStationCode: prevStationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(prevStationCode),
      priority: Value(priority),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StationTransitionOverride.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StationTransitionOverride(
      id: serializer.fromJson<int>(json['id']),
      lineId: serializer.fromJson<int>(json['lineId']),
      currentStationCode: serializer.fromJson<String>(
        json['currentStationCode'],
      ),
      nextStationCode: serializer.fromJson<String>(json['nextStationCode']),
      apiTerminalStationCode: serializer.fromJson<String?>(
        json['apiTerminalStationCode'],
      ),
      apiTerminalStationName: serializer.fromJson<String?>(
        json['apiTerminalStationName'],
      ),
      apiDirection: serializer.fromJson<String?>(json['apiDirection']),
      resolvedBranchKey: serializer.fromJson<String>(json['resolvedBranchKey']),
      prevStationCode: serializer.fromJson<String?>(json['prevStationCode']),
      priority: serializer.fromJson<int>(json['priority']),
      note: serializer.fromJson<String?>(json['note']),
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
      'lineId': serializer.toJson<int>(lineId),
      'currentStationCode': serializer.toJson<String>(currentStationCode),
      'nextStationCode': serializer.toJson<String>(nextStationCode),
      'apiTerminalStationCode': serializer.toJson<String?>(
        apiTerminalStationCode,
      ),
      'apiTerminalStationName': serializer.toJson<String?>(
        apiTerminalStationName,
      ),
      'apiDirection': serializer.toJson<String?>(apiDirection),
      'resolvedBranchKey': serializer.toJson<String>(resolvedBranchKey),
      'prevStationCode': serializer.toJson<String?>(prevStationCode),
      'priority': serializer.toJson<int>(priority),
      'note': serializer.toJson<String?>(note),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StationTransitionOverride copyWith({
    int? id,
    int? lineId,
    String? currentStationCode,
    String? nextStationCode,
    Value<String?> apiTerminalStationCode = const Value.absent(),
    Value<String?> apiTerminalStationName = const Value.absent(),
    Value<String?> apiDirection = const Value.absent(),
    String? resolvedBranchKey,
    Value<String?> prevStationCode = const Value.absent(),
    int? priority,
    Value<String?> note = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => StationTransitionOverride(
    id: id ?? this.id,
    lineId: lineId ?? this.lineId,
    currentStationCode: currentStationCode ?? this.currentStationCode,
    nextStationCode: nextStationCode ?? this.nextStationCode,
    apiTerminalStationCode: apiTerminalStationCode.present
        ? apiTerminalStationCode.value
        : this.apiTerminalStationCode,
    apiTerminalStationName: apiTerminalStationName.present
        ? apiTerminalStationName.value
        : this.apiTerminalStationName,
    apiDirection: apiDirection.present ? apiDirection.value : this.apiDirection,
    resolvedBranchKey: resolvedBranchKey ?? this.resolvedBranchKey,
    prevStationCode: prevStationCode.present
        ? prevStationCode.value
        : this.prevStationCode,
    priority: priority ?? this.priority,
    note: note.present ? note.value : this.note,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StationTransitionOverride copyWithCompanion(
    StationTransitionOverridesCompanion data,
  ) {
    return StationTransitionOverride(
      id: data.id.present ? data.id.value : this.id,
      lineId: data.lineId.present ? data.lineId.value : this.lineId,
      currentStationCode: data.currentStationCode.present
          ? data.currentStationCode.value
          : this.currentStationCode,
      nextStationCode: data.nextStationCode.present
          ? data.nextStationCode.value
          : this.nextStationCode,
      apiTerminalStationCode: data.apiTerminalStationCode.present
          ? data.apiTerminalStationCode.value
          : this.apiTerminalStationCode,
      apiTerminalStationName: data.apiTerminalStationName.present
          ? data.apiTerminalStationName.value
          : this.apiTerminalStationName,
      apiDirection: data.apiDirection.present
          ? data.apiDirection.value
          : this.apiDirection,
      resolvedBranchKey: data.resolvedBranchKey.present
          ? data.resolvedBranchKey.value
          : this.resolvedBranchKey,
      prevStationCode: data.prevStationCode.present
          ? data.prevStationCode.value
          : this.prevStationCode,
      priority: data.priority.present ? data.priority.value : this.priority,
      note: data.note.present ? data.note.value : this.note,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StationTransitionOverride(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('currentStationCode: $currentStationCode, ')
          ..write('nextStationCode: $nextStationCode, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('apiTerminalStationName: $apiTerminalStationName, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('resolvedBranchKey: $resolvedBranchKey, ')
          ..write('prevStationCode: $prevStationCode, ')
          ..write('priority: $priority, ')
          ..write('note: $note, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lineId,
    currentStationCode,
    nextStationCode,
    apiTerminalStationCode,
    apiTerminalStationName,
    apiDirection,
    resolvedBranchKey,
    prevStationCode,
    priority,
    note,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StationTransitionOverride &&
          other.id == this.id &&
          other.lineId == this.lineId &&
          other.currentStationCode == this.currentStationCode &&
          other.nextStationCode == this.nextStationCode &&
          other.apiTerminalStationCode == this.apiTerminalStationCode &&
          other.apiTerminalStationName == this.apiTerminalStationName &&
          other.apiDirection == this.apiDirection &&
          other.resolvedBranchKey == this.resolvedBranchKey &&
          other.prevStationCode == this.prevStationCode &&
          other.priority == this.priority &&
          other.note == this.note &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StationTransitionOverridesCompanion
    extends UpdateCompanion<StationTransitionOverride> {
  final Value<int> id;
  final Value<int> lineId;
  final Value<String> currentStationCode;
  final Value<String> nextStationCode;
  final Value<String?> apiTerminalStationCode;
  final Value<String?> apiTerminalStationName;
  final Value<String?> apiDirection;
  final Value<String> resolvedBranchKey;
  final Value<String?> prevStationCode;
  final Value<int> priority;
  final Value<String?> note;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StationTransitionOverridesCompanion({
    this.id = const Value.absent(),
    this.lineId = const Value.absent(),
    this.currentStationCode = const Value.absent(),
    this.nextStationCode = const Value.absent(),
    this.apiTerminalStationCode = const Value.absent(),
    this.apiTerminalStationName = const Value.absent(),
    this.apiDirection = const Value.absent(),
    this.resolvedBranchKey = const Value.absent(),
    this.prevStationCode = const Value.absent(),
    this.priority = const Value.absent(),
    this.note = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StationTransitionOverridesCompanion.insert({
    this.id = const Value.absent(),
    required int lineId,
    required String currentStationCode,
    required String nextStationCode,
    this.apiTerminalStationCode = const Value.absent(),
    this.apiTerminalStationName = const Value.absent(),
    this.apiDirection = const Value.absent(),
    required String resolvedBranchKey,
    this.prevStationCode = const Value.absent(),
    this.priority = const Value.absent(),
    this.note = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lineId = Value(lineId),
       currentStationCode = Value(currentStationCode),
       nextStationCode = Value(nextStationCode),
       resolvedBranchKey = Value(resolvedBranchKey);
  static Insertable<StationTransitionOverride> custom({
    Expression<int>? id,
    Expression<int>? lineId,
    Expression<String>? currentStationCode,
    Expression<String>? nextStationCode,
    Expression<String>? apiTerminalStationCode,
    Expression<String>? apiTerminalStationName,
    Expression<String>? apiDirection,
    Expression<String>? resolvedBranchKey,
    Expression<String>? prevStationCode,
    Expression<int>? priority,
    Expression<String>? note,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineId != null) 'line_id': lineId,
      if (currentStationCode != null)
        'current_station_code': currentStationCode,
      if (nextStationCode != null) 'next_station_code': nextStationCode,
      if (apiTerminalStationCode != null)
        'api_terminal_station_code': apiTerminalStationCode,
      if (apiTerminalStationName != null)
        'api_terminal_station_name': apiTerminalStationName,
      if (apiDirection != null) 'api_direction': apiDirection,
      if (resolvedBranchKey != null) 'resolved_branch_key': resolvedBranchKey,
      if (prevStationCode != null) 'prev_station_code': prevStationCode,
      if (priority != null) 'priority': priority,
      if (note != null) 'note': note,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StationTransitionOverridesCompanion copyWith({
    Value<int>? id,
    Value<int>? lineId,
    Value<String>? currentStationCode,
    Value<String>? nextStationCode,
    Value<String?>? apiTerminalStationCode,
    Value<String?>? apiTerminalStationName,
    Value<String?>? apiDirection,
    Value<String>? resolvedBranchKey,
    Value<String?>? prevStationCode,
    Value<int>? priority,
    Value<String?>? note,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StationTransitionOverridesCompanion(
      id: id ?? this.id,
      lineId: lineId ?? this.lineId,
      currentStationCode: currentStationCode ?? this.currentStationCode,
      nextStationCode: nextStationCode ?? this.nextStationCode,
      apiTerminalStationCode:
          apiTerminalStationCode ?? this.apiTerminalStationCode,
      apiTerminalStationName:
          apiTerminalStationName ?? this.apiTerminalStationName,
      apiDirection: apiDirection ?? this.apiDirection,
      resolvedBranchKey: resolvedBranchKey ?? this.resolvedBranchKey,
      prevStationCode: prevStationCode ?? this.prevStationCode,
      priority: priority ?? this.priority,
      note: note ?? this.note,
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
    if (lineId.present) {
      map['line_id'] = Variable<int>(lineId.value);
    }
    if (currentStationCode.present) {
      map['current_station_code'] = Variable<String>(currentStationCode.value);
    }
    if (nextStationCode.present) {
      map['next_station_code'] = Variable<String>(nextStationCode.value);
    }
    if (apiTerminalStationCode.present) {
      map['api_terminal_station_code'] = Variable<String>(
        apiTerminalStationCode.value,
      );
    }
    if (apiTerminalStationName.present) {
      map['api_terminal_station_name'] = Variable<String>(
        apiTerminalStationName.value,
      );
    }
    if (apiDirection.present) {
      map['api_direction'] = Variable<String>(apiDirection.value);
    }
    if (resolvedBranchKey.present) {
      map['resolved_branch_key'] = Variable<String>(resolvedBranchKey.value);
    }
    if (prevStationCode.present) {
      map['prev_station_code'] = Variable<String>(prevStationCode.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
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
    return (StringBuffer('StationTransitionOverridesCompanion(')
          ..write('id: $id, ')
          ..write('lineId: $lineId, ')
          ..write('currentStationCode: $currentStationCode, ')
          ..write('nextStationCode: $nextStationCode, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('apiTerminalStationName: $apiTerminalStationName, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('resolvedBranchKey: $resolvedBranchKey, ')
          ..write('prevStationCode: $prevStationCode, ')
          ..write('priority: $priority, ')
          ..write('note: $note, ')
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
  late final $DirectionPoliciesTable directionPolicies =
      $DirectionPoliciesTable(this);
  late final $StationTransitionOverridesTable stationTransitionOverrides =
      $StationTransitionOverridesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    stations,
    lines,
    lineStations,
    directionPolicies,
    stationTransitionOverrides,
  ];
}

typedef $$StationsTableCreateCompanionBuilder =
    StationsCompanion Function({
      Value<int> id,
      required String nameKo,
      Value<String?> nameEn,
      Value<String?> nameJp,
      Value<String?> nameCh,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$StationsTableUpdateCompanionBuilder =
    StationsCompanion Function({
      Value<int> id,
      Value<String> nameKo,
      Value<String?> nameEn,
      Value<String?> nameJp,
      Value<String?> nameCh,
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

  ColumnFilters<String> get nameKo => $composableBuilder(
    column: $table.nameKo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameJp => $composableBuilder(
    column: $table.nameJp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameCh => $composableBuilder(
    column: $table.nameCh,
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

  ColumnOrderings<String> get nameKo => $composableBuilder(
    column: $table.nameKo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameJp => $composableBuilder(
    column: $table.nameJp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameCh => $composableBuilder(
    column: $table.nameCh,
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

  GeneratedColumn<String> get nameKo =>
      $composableBuilder(column: $table.nameKo, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameJp =>
      $composableBuilder(column: $table.nameJp, builder: (column) => column);

  GeneratedColumn<String> get nameCh =>
      $composableBuilder(column: $table.nameCh, builder: (column) => column);

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
                Value<String> nameKo = const Value.absent(),
                Value<String?> nameEn = const Value.absent(),
                Value<String?> nameJp = const Value.absent(),
                Value<String?> nameCh = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationsCompanion(
                id: id,
                nameKo: nameKo,
                nameEn: nameEn,
                nameJp: nameJp,
                nameCh: nameCh,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameKo,
                Value<String?> nameEn = const Value.absent(),
                Value<String?> nameJp = const Value.absent(),
                Value<String?> nameCh = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationsCompanion.insert(
                id: id,
                nameKo: nameKo,
                nameEn: nameEn,
                nameJp: nameJp,
                nameCh: nameCh,
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
      required String name,
      Value<String?> color,
      Value<String?> lineType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LinesTableUpdateCompanionBuilder =
    LinesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> color,
      Value<String?> lineType,
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

  static MultiTypedResultKey<$DirectionPoliciesTable, List<DirectionPolicy>>
  _directionPoliciesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.directionPolicies,
        aliasName: $_aliasNameGenerator(
          db.lines.id,
          db.directionPolicies.lineId,
        ),
      );

  $$DirectionPoliciesTableProcessedTableManager get directionPoliciesRefs {
    final manager = $$DirectionPoliciesTableTableManager(
      $_db,
      $_db.directionPolicies,
    ).filter((f) => f.lineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _directionPoliciesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $StationTransitionOverridesTable,
    List<StationTransitionOverride>
  >
  _stationTransitionOverridesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.stationTransitionOverrides,
        aliasName: $_aliasNameGenerator(
          db.lines.id,
          db.stationTransitionOverrides.lineId,
        ),
      );

  $$StationTransitionOverridesTableProcessedTableManager
  get stationTransitionOverridesRefs {
    final manager = $$StationTransitionOverridesTableTableManager(
      $_db,
      $_db.stationTransitionOverrides,
    ).filter((f) => f.lineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _stationTransitionOverridesRefsTable($_db),
    );
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

  Expression<bool> directionPoliciesRefs(
    Expression<bool> Function($$DirectionPoliciesTableFilterComposer f) f,
  ) {
    final $$DirectionPoliciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.directionPolicies,
      getReferencedColumn: (t) => t.lineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DirectionPoliciesTableFilterComposer(
            $db: $db,
            $table: $db.directionPolicies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> stationTransitionOverridesRefs(
    Expression<bool> Function($$StationTransitionOverridesTableFilterComposer f)
    f,
  ) {
    final $$StationTransitionOverridesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.stationTransitionOverrides,
          getReferencedColumn: (t) => t.lineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$StationTransitionOverridesTableFilterComposer(
                $db: $db,
                $table: $db.stationTransitionOverrides,
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get lineType =>
      $composableBuilder(column: $table.lineType, builder: (column) => column);

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

  Expression<T> directionPoliciesRefs<T extends Object>(
    Expression<T> Function($$DirectionPoliciesTableAnnotationComposer a) f,
  ) {
    final $$DirectionPoliciesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.directionPolicies,
          getReferencedColumn: (t) => t.lineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DirectionPoliciesTableAnnotationComposer(
                $db: $db,
                $table: $db.directionPolicies,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> stationTransitionOverridesRefs<T extends Object>(
    Expression<T> Function(
      $$StationTransitionOverridesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$StationTransitionOverridesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.stationTransitionOverrides,
          getReferencedColumn: (t) => t.lineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$StationTransitionOverridesTableAnnotationComposer(
                $db: $db,
                $table: $db.stationTransitionOverrides,
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
          PrefetchHooks Function({
            bool lineStationsRefs,
            bool directionPoliciesRefs,
            bool stationTransitionOverridesRefs,
          })
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
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> lineType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion(
                id: id,
                name: name,
                color: color,
                lineType: lineType,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> color = const Value.absent(),
                Value<String?> lineType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion.insert(
                id: id,
                name: name,
                color: color,
                lineType: lineType,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LinesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                lineStationsRefs = false,
                directionPoliciesRefs = false,
                stationTransitionOverridesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lineStationsRefs) db.lineStations,
                    if (directionPoliciesRefs) db.directionPolicies,
                    if (stationTransitionOverridesRefs)
                      db.stationTransitionOverrides,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lineStationsRefs)
                        await $_getPrefetchedData<
                          Line,
                          $LinesTable,
                          LineStation
                        >(
                          currentTable: table,
                          referencedTable: $$LinesTableReferences
                              ._lineStationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinesTableReferences(
                                db,
                                table,
                                p0,
                              ).lineStationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (directionPoliciesRefs)
                        await $_getPrefetchedData<
                          Line,
                          $LinesTable,
                          DirectionPolicy
                        >(
                          currentTable: table,
                          referencedTable: $$LinesTableReferences
                              ._directionPoliciesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinesTableReferences(
                                db,
                                table,
                                p0,
                              ).directionPoliciesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (stationTransitionOverridesRefs)
                        await $_getPrefetchedData<
                          Line,
                          $LinesTable,
                          StationTransitionOverride
                        >(
                          currentTable: table,
                          referencedTable: $$LinesTableReferences
                              ._stationTransitionOverridesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinesTableReferences(
                                db,
                                table,
                                p0,
                              ).stationTransitionOverridesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineId == item.id,
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
      PrefetchHooks Function({
        bool lineStationsRefs,
        bool directionPoliciesRefs,
        bool stationTransitionOverridesRefs,
      })
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
          PrefetchHooks Function({bool lineId, bool stationId})
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
          prefetchHooksCallback: ({lineId = false, stationId = false}) {
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
                    if (lineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineId,
                                referencedTable: $$LineStationsTableReferences
                                    ._lineIdTable(db),
                                referencedColumn: $$LineStationsTableReferences
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
                                referencedTable: $$LineStationsTableReferences
                                    ._stationIdTable(db),
                                referencedColumn: $$LineStationsTableReferences
                                    ._stationIdTable(db)
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
      PrefetchHooks Function({bool lineId, bool stationId})
    >;
typedef $$DirectionPoliciesTableCreateCompanionBuilder =
    DirectionPoliciesCompanion Function({
      Value<int> id,
      required int lineId,
      Value<String> branchKey,
      required String directionKind,
      Value<String?> apiDirection,
      Value<String?> apiTerminalStationCode,
      required String displayLabelKo,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DirectionPoliciesTableUpdateCompanionBuilder =
    DirectionPoliciesCompanion Function({
      Value<int> id,
      Value<int> lineId,
      Value<String> branchKey,
      Value<String> directionKind,
      Value<String?> apiDirection,
      Value<String?> apiTerminalStationCode,
      Value<String> displayLabelKo,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$DirectionPoliciesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DirectionPoliciesTable,
          DirectionPolicy
        > {
  $$DirectionPoliciesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LinesTable _lineIdTable(_$AppDatabase db) => db.lines.createAlias(
    $_aliasNameGenerator(db.directionPolicies.lineId, db.lines.id),
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
}

class $$DirectionPoliciesTableFilterComposer
    extends Composer<_$AppDatabase, $DirectionPoliciesTable> {
  $$DirectionPoliciesTableFilterComposer({
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

  ColumnFilters<String> get branchKey => $composableBuilder(
    column: $table.branchKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get directionKind => $composableBuilder(
    column: $table.directionKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
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
}

class $$DirectionPoliciesTableOrderingComposer
    extends Composer<_$AppDatabase, $DirectionPoliciesTable> {
  $$DirectionPoliciesTableOrderingComposer({
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

  ColumnOrderings<String> get branchKey => $composableBuilder(
    column: $table.branchKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get directionKind => $composableBuilder(
    column: $table.directionKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
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
}

class $$DirectionPoliciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DirectionPoliciesTable> {
  $$DirectionPoliciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get branchKey =>
      $composableBuilder(column: $table.branchKey, builder: (column) => column);

  GeneratedColumn<String> get directionKind => $composableBuilder(
    column: $table.directionKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

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
}

class $$DirectionPoliciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DirectionPoliciesTable,
          DirectionPolicy,
          $$DirectionPoliciesTableFilterComposer,
          $$DirectionPoliciesTableOrderingComposer,
          $$DirectionPoliciesTableAnnotationComposer,
          $$DirectionPoliciesTableCreateCompanionBuilder,
          $$DirectionPoliciesTableUpdateCompanionBuilder,
          (DirectionPolicy, $$DirectionPoliciesTableReferences),
          DirectionPolicy,
          PrefetchHooks Function({bool lineId})
        > {
  $$DirectionPoliciesTableTableManager(
    _$AppDatabase db,
    $DirectionPoliciesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DirectionPoliciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DirectionPoliciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DirectionPoliciesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lineId = const Value.absent(),
                Value<String> branchKey = const Value.absent(),
                Value<String> directionKind = const Value.absent(),
                Value<String?> apiDirection = const Value.absent(),
                Value<String?> apiTerminalStationCode = const Value.absent(),
                Value<String> displayLabelKo = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DirectionPoliciesCompanion(
                id: id,
                lineId: lineId,
                branchKey: branchKey,
                directionKind: directionKind,
                apiDirection: apiDirection,
                apiTerminalStationCode: apiTerminalStationCode,
                displayLabelKo: displayLabelKo,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lineId,
                Value<String> branchKey = const Value.absent(),
                required String directionKind,
                Value<String?> apiDirection = const Value.absent(),
                Value<String?> apiTerminalStationCode = const Value.absent(),
                required String displayLabelKo,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DirectionPoliciesCompanion.insert(
                id: id,
                lineId: lineId,
                branchKey: branchKey,
                directionKind: directionKind,
                apiDirection: apiDirection,
                apiTerminalStationCode: apiTerminalStationCode,
                displayLabelKo: displayLabelKo,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DirectionPoliciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lineId = false}) {
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
                    if (lineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineId,
                                referencedTable:
                                    $$DirectionPoliciesTableReferences
                                        ._lineIdTable(db),
                                referencedColumn:
                                    $$DirectionPoliciesTableReferences
                                        ._lineIdTable(db)
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

typedef $$DirectionPoliciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DirectionPoliciesTable,
      DirectionPolicy,
      $$DirectionPoliciesTableFilterComposer,
      $$DirectionPoliciesTableOrderingComposer,
      $$DirectionPoliciesTableAnnotationComposer,
      $$DirectionPoliciesTableCreateCompanionBuilder,
      $$DirectionPoliciesTableUpdateCompanionBuilder,
      (DirectionPolicy, $$DirectionPoliciesTableReferences),
      DirectionPolicy,
      PrefetchHooks Function({bool lineId})
    >;
typedef $$StationTransitionOverridesTableCreateCompanionBuilder =
    StationTransitionOverridesCompanion Function({
      Value<int> id,
      required int lineId,
      required String currentStationCode,
      required String nextStationCode,
      Value<String?> apiTerminalStationCode,
      Value<String?> apiTerminalStationName,
      Value<String?> apiDirection,
      required String resolvedBranchKey,
      Value<String?> prevStationCode,
      Value<int> priority,
      Value<String?> note,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$StationTransitionOverridesTableUpdateCompanionBuilder =
    StationTransitionOverridesCompanion Function({
      Value<int> id,
      Value<int> lineId,
      Value<String> currentStationCode,
      Value<String> nextStationCode,
      Value<String?> apiTerminalStationCode,
      Value<String?> apiTerminalStationName,
      Value<String?> apiDirection,
      Value<String> resolvedBranchKey,
      Value<String?> prevStationCode,
      Value<int> priority,
      Value<String?> note,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$StationTransitionOverridesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $StationTransitionOverridesTable,
          StationTransitionOverride
        > {
  $$StationTransitionOverridesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LinesTable _lineIdTable(_$AppDatabase db) => db.lines.createAlias(
    $_aliasNameGenerator(db.stationTransitionOverrides.lineId, db.lines.id),
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
}

class $$StationTransitionOverridesTableFilterComposer
    extends Composer<_$AppDatabase, $StationTransitionOverridesTable> {
  $$StationTransitionOverridesTableFilterComposer({
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

  ColumnFilters<String> get currentStationCode => $composableBuilder(
    column: $table.currentStationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextStationCode => $composableBuilder(
    column: $table.nextStationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolvedBranchKey => $composableBuilder(
    column: $table.resolvedBranchKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prevStationCode => $composableBuilder(
    column: $table.prevStationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
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
}

class $$StationTransitionOverridesTableOrderingComposer
    extends Composer<_$AppDatabase, $StationTransitionOverridesTable> {
  $$StationTransitionOverridesTableOrderingComposer({
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

  ColumnOrderings<String> get currentStationCode => $composableBuilder(
    column: $table.currentStationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextStationCode => $composableBuilder(
    column: $table.nextStationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolvedBranchKey => $composableBuilder(
    column: $table.resolvedBranchKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prevStationCode => $composableBuilder(
    column: $table.prevStationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
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
}

class $$StationTransitionOverridesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StationTransitionOverridesTable> {
  $$StationTransitionOverridesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get currentStationCode => $composableBuilder(
    column: $table.currentStationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextStationCode => $composableBuilder(
    column: $table.nextStationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiTerminalStationCode => $composableBuilder(
    column: $table.apiTerminalStationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get apiDirection => $composableBuilder(
    column: $table.apiDirection,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resolvedBranchKey => $composableBuilder(
    column: $table.resolvedBranchKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prevStationCode => $composableBuilder(
    column: $table.prevStationCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

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
}

class $$StationTransitionOverridesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StationTransitionOverridesTable,
          StationTransitionOverride,
          $$StationTransitionOverridesTableFilterComposer,
          $$StationTransitionOverridesTableOrderingComposer,
          $$StationTransitionOverridesTableAnnotationComposer,
          $$StationTransitionOverridesTableCreateCompanionBuilder,
          $$StationTransitionOverridesTableUpdateCompanionBuilder,
          (
            StationTransitionOverride,
            $$StationTransitionOverridesTableReferences,
          ),
          StationTransitionOverride,
          PrefetchHooks Function({bool lineId})
        > {
  $$StationTransitionOverridesTableTableManager(
    _$AppDatabase db,
    $StationTransitionOverridesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StationTransitionOverridesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$StationTransitionOverridesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$StationTransitionOverridesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lineId = const Value.absent(),
                Value<String> currentStationCode = const Value.absent(),
                Value<String> nextStationCode = const Value.absent(),
                Value<String?> apiTerminalStationCode = const Value.absent(),
                Value<String?> apiTerminalStationName = const Value.absent(),
                Value<String?> apiDirection = const Value.absent(),
                Value<String> resolvedBranchKey = const Value.absent(),
                Value<String?> prevStationCode = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationTransitionOverridesCompanion(
                id: id,
                lineId: lineId,
                currentStationCode: currentStationCode,
                nextStationCode: nextStationCode,
                apiTerminalStationCode: apiTerminalStationCode,
                apiTerminalStationName: apiTerminalStationName,
                apiDirection: apiDirection,
                resolvedBranchKey: resolvedBranchKey,
                prevStationCode: prevStationCode,
                priority: priority,
                note: note,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lineId,
                required String currentStationCode,
                required String nextStationCode,
                Value<String?> apiTerminalStationCode = const Value.absent(),
                Value<String?> apiTerminalStationName = const Value.absent(),
                Value<String?> apiDirection = const Value.absent(),
                required String resolvedBranchKey,
                Value<String?> prevStationCode = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StationTransitionOverridesCompanion.insert(
                id: id,
                lineId: lineId,
                currentStationCode: currentStationCode,
                nextStationCode: nextStationCode,
                apiTerminalStationCode: apiTerminalStationCode,
                apiTerminalStationName: apiTerminalStationName,
                apiDirection: apiDirection,
                resolvedBranchKey: resolvedBranchKey,
                prevStationCode: prevStationCode,
                priority: priority,
                note: note,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StationTransitionOverridesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lineId = false}) {
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
                    if (lineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineId,
                                referencedTable:
                                    $$StationTransitionOverridesTableReferences
                                        ._lineIdTable(db),
                                referencedColumn:
                                    $$StationTransitionOverridesTableReferences
                                        ._lineIdTable(db)
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

typedef $$StationTransitionOverridesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StationTransitionOverridesTable,
      StationTransitionOverride,
      $$StationTransitionOverridesTableFilterComposer,
      $$StationTransitionOverridesTableOrderingComposer,
      $$StationTransitionOverridesTableAnnotationComposer,
      $$StationTransitionOverridesTableCreateCompanionBuilder,
      $$StationTransitionOverridesTableUpdateCompanionBuilder,
      (StationTransitionOverride, $$StationTransitionOverridesTableReferences),
      StationTransitionOverride,
      PrefetchHooks Function({bool lineId})
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
  $$DirectionPoliciesTableTableManager get directionPolicies =>
      $$DirectionPoliciesTableTableManager(_db, _db.directionPolicies);
  $$StationTransitionOverridesTableTableManager
  get stationTransitionOverrides =>
      $$StationTransitionOverridesTableTableManager(
        _db,
        _db.stationTransitionOverrides,
      );
}
