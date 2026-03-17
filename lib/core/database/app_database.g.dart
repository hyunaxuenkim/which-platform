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
    check: () => lineType.isIn(const <String>['LINEAR', 'LOOP', 'BRANCH']),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  final String name;
  final String? color;
  final String? lineType;
  final String? operator;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Line({
    required this.id,
    required this.name,
    this.color,
    this.lineType,
    this.operator,
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
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      lineType: lineType == null && nullToAbsent
          ? const Value.absent()
          : Value(lineType),
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
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      lineType: serializer.fromJson<String?>(json['lineType']),
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
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'lineType': serializer.toJson<String?>(lineType),
      'operator': serializer.toJson<String?>(operator),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Line copyWith({
    int? id,
    String? name,
    Value<String?> color = const Value.absent(),
    Value<String?> lineType = const Value.absent(),
    Value<String?> operator = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Line(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    lineType: lineType.present ? lineType.value : this.lineType,
    operator: operator.present ? operator.value : this.operator,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Line copyWithCompanion(LinesCompanion data) {
    return Line(
      id: data.id.present ? data.id.value : this.id,
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
  int get hashCode =>
      Object.hash(id, name, color, lineType, operator, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Line &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.lineType == this.lineType &&
          other.operator == this.operator &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LinesCompanion extends UpdateCompanion<Line> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String?> lineType;
  final Value<String?> operator;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.lineType = const Value.absent(),
    this.operator = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.lineType = const Value.absent(),
    this.operator = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Line> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? lineType,
    Expression<String>? operator,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
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
    Value<String>? name,
    Value<String?>? color,
    Value<String?>? lineType,
    Value<String?>? operator,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LinesCompanion(
      id: id ?? this.id,
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
  static const VerificationMeta _servicePatternKeyMeta = const VerificationMeta(
    'servicePatternKey',
  );
  @override
  late final GeneratedColumn<String> servicePatternKey =
      GeneratedColumn<String>(
        'service_pattern_key',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _directionKindMeta = const VerificationMeta(
    'directionKind',
  );
  @override
  late final GeneratedColumn<String> directionKind = GeneratedColumn<String>(
    'direction_kind',
    aliasedName,
    false,
    check: () => directionKind.isIn(const <String>[
      'UP',
      'DOWN',
      'INNER',
      'OUTER',
      'TERMINAL',
      'BRANCH',
    ]),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiDirectionMeta = const VerificationMeta(
    'apiDirection',
  );
  @override
  late final GeneratedColumn<String> apiDirection = GeneratedColumn<String>(
    'api_direction',
    aliasedName,
    true,
    check: () => apiDirection.isIn(const <String>['상행', '하행', '내선', '외선']),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _destinationStationIdMeta =
      const VerificationMeta('destinationStationId');
  @override
  late final GeneratedColumn<int> destinationStationId = GeneratedColumn<int>(
    'destination_station_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stations (id)',
    ),
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
  static const VerificationMeta _displayLabelEnMeta = const VerificationMeta(
    'displayLabelEn',
  );
  @override
  late final GeneratedColumn<String> displayLabelEn = GeneratedColumn<String>(
    'display_label_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayLabelJpMeta = const VerificationMeta(
    'displayLabelJp',
  );
  @override
  late final GeneratedColumn<String> displayLabelJp = GeneratedColumn<String>(
    'display_label_jp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayLabelChMeta = const VerificationMeta(
    'displayLabelCh',
  );
  @override
  late final GeneratedColumn<String> displayLabelCh = GeneratedColumn<String>(
    'display_label_ch',
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
    servicePatternKey,
    directionKind,
    apiDirection,
    apiTerminalStationCode,
    apiTerminalStationName,
    destinationStationId,
    displayLabelKo,
    displayLabelEn,
    displayLabelJp,
    displayLabelCh,
    priority,
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
    if (data.containsKey('service_pattern_key')) {
      context.handle(
        _servicePatternKeyMeta,
        servicePatternKey.isAcceptableOrUnknown(
          data['service_pattern_key']!,
          _servicePatternKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servicePatternKeyMeta);
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
    if (data.containsKey('api_terminal_station_name')) {
      context.handle(
        _apiTerminalStationNameMeta,
        apiTerminalStationName.isAcceptableOrUnknown(
          data['api_terminal_station_name']!,
          _apiTerminalStationNameMeta,
        ),
      );
    }
    if (data.containsKey('destination_station_id')) {
      context.handle(
        _destinationStationIdMeta,
        destinationStationId.isAcceptableOrUnknown(
          data['destination_station_id']!,
          _destinationStationIdMeta,
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
    if (data.containsKey('display_label_en')) {
      context.handle(
        _displayLabelEnMeta,
        displayLabelEn.isAcceptableOrUnknown(
          data['display_label_en']!,
          _displayLabelEnMeta,
        ),
      );
    }
    if (data.containsKey('display_label_jp')) {
      context.handle(
        _displayLabelJpMeta,
        displayLabelJp.isAcceptableOrUnknown(
          data['display_label_jp']!,
          _displayLabelJpMeta,
        ),
      );
    }
    if (data.containsKey('display_label_ch')) {
      context.handle(
        _displayLabelChMeta,
        displayLabelCh.isAcceptableOrUnknown(
          data['display_label_ch']!,
          _displayLabelChMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
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
    {
      lineId,
      branchKey,
      servicePatternKey,
      directionKind,
      apiDirection,
      apiTerminalStationCode,
    },
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
      servicePatternKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_pattern_key'],
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
      apiTerminalStationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_terminal_station_name'],
      ),
      destinationStationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}destination_station_id'],
      ),
      displayLabelKo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_label_ko'],
      )!,
      displayLabelEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_label_en'],
      ),
      displayLabelJp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_label_jp'],
      ),
      displayLabelCh: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_label_ch'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
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
  final String servicePatternKey;
  final String directionKind;
  final String? apiDirection;
  final String? apiTerminalStationCode;
  final String? apiTerminalStationName;
  final int? destinationStationId;
  final String displayLabelKo;
  final String? displayLabelEn;
  final String? displayLabelJp;
  final String? displayLabelCh;
  final int priority;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DirectionPolicy({
    required this.id,
    required this.lineId,
    required this.branchKey,
    required this.servicePatternKey,
    required this.directionKind,
    this.apiDirection,
    this.apiTerminalStationCode,
    this.apiTerminalStationName,
    this.destinationStationId,
    required this.displayLabelKo,
    this.displayLabelEn,
    this.displayLabelJp,
    this.displayLabelCh,
    required this.priority,
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
    map['service_pattern_key'] = Variable<String>(servicePatternKey);
    map['direction_kind'] = Variable<String>(directionKind);
    if (!nullToAbsent || apiDirection != null) {
      map['api_direction'] = Variable<String>(apiDirection);
    }
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
    if (!nullToAbsent || destinationStationId != null) {
      map['destination_station_id'] = Variable<int>(destinationStationId);
    }
    map['display_label_ko'] = Variable<String>(displayLabelKo);
    if (!nullToAbsent || displayLabelEn != null) {
      map['display_label_en'] = Variable<String>(displayLabelEn);
    }
    if (!nullToAbsent || displayLabelJp != null) {
      map['display_label_jp'] = Variable<String>(displayLabelJp);
    }
    if (!nullToAbsent || displayLabelCh != null) {
      map['display_label_ch'] = Variable<String>(displayLabelCh);
    }
    map['priority'] = Variable<int>(priority);
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
      servicePatternKey: Value(servicePatternKey),
      directionKind: Value(directionKind),
      apiDirection: apiDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(apiDirection),
      apiTerminalStationCode: apiTerminalStationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(apiTerminalStationCode),
      apiTerminalStationName: apiTerminalStationName == null && nullToAbsent
          ? const Value.absent()
          : Value(apiTerminalStationName),
      destinationStationId: destinationStationId == null && nullToAbsent
          ? const Value.absent()
          : Value(destinationStationId),
      displayLabelKo: Value(displayLabelKo),
      displayLabelEn: displayLabelEn == null && nullToAbsent
          ? const Value.absent()
          : Value(displayLabelEn),
      displayLabelJp: displayLabelJp == null && nullToAbsent
          ? const Value.absent()
          : Value(displayLabelJp),
      displayLabelCh: displayLabelCh == null && nullToAbsent
          ? const Value.absent()
          : Value(displayLabelCh),
      priority: Value(priority),
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
      servicePatternKey: serializer.fromJson<String>(json['servicePatternKey']),
      directionKind: serializer.fromJson<String>(json['directionKind']),
      apiDirection: serializer.fromJson<String?>(json['apiDirection']),
      apiTerminalStationCode: serializer.fromJson<String?>(
        json['apiTerminalStationCode'],
      ),
      apiTerminalStationName: serializer.fromJson<String?>(
        json['apiTerminalStationName'],
      ),
      destinationStationId: serializer.fromJson<int?>(
        json['destinationStationId'],
      ),
      displayLabelKo: serializer.fromJson<String>(json['displayLabelKo']),
      displayLabelEn: serializer.fromJson<String?>(json['displayLabelEn']),
      displayLabelJp: serializer.fromJson<String?>(json['displayLabelJp']),
      displayLabelCh: serializer.fromJson<String?>(json['displayLabelCh']),
      priority: serializer.fromJson<int>(json['priority']),
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
      'servicePatternKey': serializer.toJson<String>(servicePatternKey),
      'directionKind': serializer.toJson<String>(directionKind),
      'apiDirection': serializer.toJson<String?>(apiDirection),
      'apiTerminalStationCode': serializer.toJson<String?>(
        apiTerminalStationCode,
      ),
      'apiTerminalStationName': serializer.toJson<String?>(
        apiTerminalStationName,
      ),
      'destinationStationId': serializer.toJson<int?>(destinationStationId),
      'displayLabelKo': serializer.toJson<String>(displayLabelKo),
      'displayLabelEn': serializer.toJson<String?>(displayLabelEn),
      'displayLabelJp': serializer.toJson<String?>(displayLabelJp),
      'displayLabelCh': serializer.toJson<String?>(displayLabelCh),
      'priority': serializer.toJson<int>(priority),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DirectionPolicy copyWith({
    int? id,
    int? lineId,
    String? branchKey,
    String? servicePatternKey,
    String? directionKind,
    Value<String?> apiDirection = const Value.absent(),
    Value<String?> apiTerminalStationCode = const Value.absent(),
    Value<String?> apiTerminalStationName = const Value.absent(),
    Value<int?> destinationStationId = const Value.absent(),
    String? displayLabelKo,
    Value<String?> displayLabelEn = const Value.absent(),
    Value<String?> displayLabelJp = const Value.absent(),
    Value<String?> displayLabelCh = const Value.absent(),
    int? priority,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DirectionPolicy(
    id: id ?? this.id,
    lineId: lineId ?? this.lineId,
    branchKey: branchKey ?? this.branchKey,
    servicePatternKey: servicePatternKey ?? this.servicePatternKey,
    directionKind: directionKind ?? this.directionKind,
    apiDirection: apiDirection.present ? apiDirection.value : this.apiDirection,
    apiTerminalStationCode: apiTerminalStationCode.present
        ? apiTerminalStationCode.value
        : this.apiTerminalStationCode,
    apiTerminalStationName: apiTerminalStationName.present
        ? apiTerminalStationName.value
        : this.apiTerminalStationName,
    destinationStationId: destinationStationId.present
        ? destinationStationId.value
        : this.destinationStationId,
    displayLabelKo: displayLabelKo ?? this.displayLabelKo,
    displayLabelEn: displayLabelEn.present
        ? displayLabelEn.value
        : this.displayLabelEn,
    displayLabelJp: displayLabelJp.present
        ? displayLabelJp.value
        : this.displayLabelJp,
    displayLabelCh: displayLabelCh.present
        ? displayLabelCh.value
        : this.displayLabelCh,
    priority: priority ?? this.priority,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DirectionPolicy copyWithCompanion(DirectionPoliciesCompanion data) {
    return DirectionPolicy(
      id: data.id.present ? data.id.value : this.id,
      lineId: data.lineId.present ? data.lineId.value : this.lineId,
      branchKey: data.branchKey.present ? data.branchKey.value : this.branchKey,
      servicePatternKey: data.servicePatternKey.present
          ? data.servicePatternKey.value
          : this.servicePatternKey,
      directionKind: data.directionKind.present
          ? data.directionKind.value
          : this.directionKind,
      apiDirection: data.apiDirection.present
          ? data.apiDirection.value
          : this.apiDirection,
      apiTerminalStationCode: data.apiTerminalStationCode.present
          ? data.apiTerminalStationCode.value
          : this.apiTerminalStationCode,
      apiTerminalStationName: data.apiTerminalStationName.present
          ? data.apiTerminalStationName.value
          : this.apiTerminalStationName,
      destinationStationId: data.destinationStationId.present
          ? data.destinationStationId.value
          : this.destinationStationId,
      displayLabelKo: data.displayLabelKo.present
          ? data.displayLabelKo.value
          : this.displayLabelKo,
      displayLabelEn: data.displayLabelEn.present
          ? data.displayLabelEn.value
          : this.displayLabelEn,
      displayLabelJp: data.displayLabelJp.present
          ? data.displayLabelJp.value
          : this.displayLabelJp,
      displayLabelCh: data.displayLabelCh.present
          ? data.displayLabelCh.value
          : this.displayLabelCh,
      priority: data.priority.present ? data.priority.value : this.priority,
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
          ..write('servicePatternKey: $servicePatternKey, ')
          ..write('directionKind: $directionKind, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('apiTerminalStationName: $apiTerminalStationName, ')
          ..write('destinationStationId: $destinationStationId, ')
          ..write('displayLabelKo: $displayLabelKo, ')
          ..write('displayLabelEn: $displayLabelEn, ')
          ..write('displayLabelJp: $displayLabelJp, ')
          ..write('displayLabelCh: $displayLabelCh, ')
          ..write('priority: $priority, ')
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
    servicePatternKey,
    directionKind,
    apiDirection,
    apiTerminalStationCode,
    apiTerminalStationName,
    destinationStationId,
    displayLabelKo,
    displayLabelEn,
    displayLabelJp,
    displayLabelCh,
    priority,
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
          other.servicePatternKey == this.servicePatternKey &&
          other.directionKind == this.directionKind &&
          other.apiDirection == this.apiDirection &&
          other.apiTerminalStationCode == this.apiTerminalStationCode &&
          other.apiTerminalStationName == this.apiTerminalStationName &&
          other.destinationStationId == this.destinationStationId &&
          other.displayLabelKo == this.displayLabelKo &&
          other.displayLabelEn == this.displayLabelEn &&
          other.displayLabelJp == this.displayLabelJp &&
          other.displayLabelCh == this.displayLabelCh &&
          other.priority == this.priority &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DirectionPoliciesCompanion extends UpdateCompanion<DirectionPolicy> {
  final Value<int> id;
  final Value<int> lineId;
  final Value<String> branchKey;
  final Value<String> servicePatternKey;
  final Value<String> directionKind;
  final Value<String?> apiDirection;
  final Value<String?> apiTerminalStationCode;
  final Value<String?> apiTerminalStationName;
  final Value<int?> destinationStationId;
  final Value<String> displayLabelKo;
  final Value<String?> displayLabelEn;
  final Value<String?> displayLabelJp;
  final Value<String?> displayLabelCh;
  final Value<int> priority;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DirectionPoliciesCompanion({
    this.id = const Value.absent(),
    this.lineId = const Value.absent(),
    this.branchKey = const Value.absent(),
    this.servicePatternKey = const Value.absent(),
    this.directionKind = const Value.absent(),
    this.apiDirection = const Value.absent(),
    this.apiTerminalStationCode = const Value.absent(),
    this.apiTerminalStationName = const Value.absent(),
    this.destinationStationId = const Value.absent(),
    this.displayLabelKo = const Value.absent(),
    this.displayLabelEn = const Value.absent(),
    this.displayLabelJp = const Value.absent(),
    this.displayLabelCh = const Value.absent(),
    this.priority = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DirectionPoliciesCompanion.insert({
    this.id = const Value.absent(),
    required int lineId,
    this.branchKey = const Value.absent(),
    required String servicePatternKey,
    required String directionKind,
    this.apiDirection = const Value.absent(),
    this.apiTerminalStationCode = const Value.absent(),
    this.apiTerminalStationName = const Value.absent(),
    this.destinationStationId = const Value.absent(),
    required String displayLabelKo,
    this.displayLabelEn = const Value.absent(),
    this.displayLabelJp = const Value.absent(),
    this.displayLabelCh = const Value.absent(),
    this.priority = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lineId = Value(lineId),
       servicePatternKey = Value(servicePatternKey),
       directionKind = Value(directionKind),
       displayLabelKo = Value(displayLabelKo);
  static Insertable<DirectionPolicy> custom({
    Expression<int>? id,
    Expression<int>? lineId,
    Expression<String>? branchKey,
    Expression<String>? servicePatternKey,
    Expression<String>? directionKind,
    Expression<String>? apiDirection,
    Expression<String>? apiTerminalStationCode,
    Expression<String>? apiTerminalStationName,
    Expression<int>? destinationStationId,
    Expression<String>? displayLabelKo,
    Expression<String>? displayLabelEn,
    Expression<String>? displayLabelJp,
    Expression<String>? displayLabelCh,
    Expression<int>? priority,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineId != null) 'line_id': lineId,
      if (branchKey != null) 'branch_key': branchKey,
      if (servicePatternKey != null) 'service_pattern_key': servicePatternKey,
      if (directionKind != null) 'direction_kind': directionKind,
      if (apiDirection != null) 'api_direction': apiDirection,
      if (apiTerminalStationCode != null)
        'api_terminal_station_code': apiTerminalStationCode,
      if (apiTerminalStationName != null)
        'api_terminal_station_name': apiTerminalStationName,
      if (destinationStationId != null)
        'destination_station_id': destinationStationId,
      if (displayLabelKo != null) 'display_label_ko': displayLabelKo,
      if (displayLabelEn != null) 'display_label_en': displayLabelEn,
      if (displayLabelJp != null) 'display_label_jp': displayLabelJp,
      if (displayLabelCh != null) 'display_label_ch': displayLabelCh,
      if (priority != null) 'priority': priority,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DirectionPoliciesCompanion copyWith({
    Value<int>? id,
    Value<int>? lineId,
    Value<String>? branchKey,
    Value<String>? servicePatternKey,
    Value<String>? directionKind,
    Value<String?>? apiDirection,
    Value<String?>? apiTerminalStationCode,
    Value<String?>? apiTerminalStationName,
    Value<int?>? destinationStationId,
    Value<String>? displayLabelKo,
    Value<String?>? displayLabelEn,
    Value<String?>? displayLabelJp,
    Value<String?>? displayLabelCh,
    Value<int>? priority,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return DirectionPoliciesCompanion(
      id: id ?? this.id,
      lineId: lineId ?? this.lineId,
      branchKey: branchKey ?? this.branchKey,
      servicePatternKey: servicePatternKey ?? this.servicePatternKey,
      directionKind: directionKind ?? this.directionKind,
      apiDirection: apiDirection ?? this.apiDirection,
      apiTerminalStationCode:
          apiTerminalStationCode ?? this.apiTerminalStationCode,
      apiTerminalStationName:
          apiTerminalStationName ?? this.apiTerminalStationName,
      destinationStationId: destinationStationId ?? this.destinationStationId,
      displayLabelKo: displayLabelKo ?? this.displayLabelKo,
      displayLabelEn: displayLabelEn ?? this.displayLabelEn,
      displayLabelJp: displayLabelJp ?? this.displayLabelJp,
      displayLabelCh: displayLabelCh ?? this.displayLabelCh,
      priority: priority ?? this.priority,
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
    if (servicePatternKey.present) {
      map['service_pattern_key'] = Variable<String>(servicePatternKey.value);
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
    if (apiTerminalStationName.present) {
      map['api_terminal_station_name'] = Variable<String>(
        apiTerminalStationName.value,
      );
    }
    if (destinationStationId.present) {
      map['destination_station_id'] = Variable<int>(destinationStationId.value);
    }
    if (displayLabelKo.present) {
      map['display_label_ko'] = Variable<String>(displayLabelKo.value);
    }
    if (displayLabelEn.present) {
      map['display_label_en'] = Variable<String>(displayLabelEn.value);
    }
    if (displayLabelJp.present) {
      map['display_label_jp'] = Variable<String>(displayLabelJp.value);
    }
    if (displayLabelCh.present) {
      map['display_label_ch'] = Variable<String>(displayLabelCh.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
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
          ..write('servicePatternKey: $servicePatternKey, ')
          ..write('directionKind: $directionKind, ')
          ..write('apiDirection: $apiDirection, ')
          ..write('apiTerminalStationCode: $apiTerminalStationCode, ')
          ..write('apiTerminalStationName: $apiTerminalStationName, ')
          ..write('destinationStationId: $destinationStationId, ')
          ..write('displayLabelKo: $displayLabelKo, ')
          ..write('displayLabelEn: $displayLabelEn, ')
          ..write('displayLabelJp: $displayLabelJp, ')
          ..write('displayLabelCh: $displayLabelCh, ')
          ..write('priority: $priority, ')
          ..write('isActive: $isActive, ')
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
  static const VerificationMeta _transferDistanceMMeta = const VerificationMeta(
    'transferDistanceM',
  );
  @override
  late final GeneratedColumn<int> transferDistanceM = GeneratedColumn<int>(
    'transfer_distance_m',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _transferTimeTextMeta = const VerificationMeta(
    'transferTimeText',
  );
  @override
  late final GeneratedColumn<String> transferTimeText = GeneratedColumn<String>(
    'transfer_time_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    transferDistanceM,
    transferTimeText,
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
    if (data.containsKey('transfer_distance_m')) {
      context.handle(
        _transferDistanceMMeta,
        transferDistanceM.isAcceptableOrUnknown(
          data['transfer_distance_m']!,
          _transferDistanceMMeta,
        ),
      );
    }
    if (data.containsKey('transfer_time_text')) {
      context.handle(
        _transferTimeTextMeta,
        transferTimeText.isAcceptableOrUnknown(
          data['transfer_time_text']!,
          _transferTimeTextMeta,
        ),
      );
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
      transferDistanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transfer_distance_m'],
      ),
      transferTimeText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transfer_time_text'],
      ),
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
  final int? transferDistanceM;
  final String? transferTimeText;
  final String? transferType;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Transfer({
    required this.id,
    required this.fromLineStationId,
    required this.toLineStationId,
    required this.walkingSeconds,
    this.transferDistanceM,
    this.transferTimeText,
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
    if (!nullToAbsent || transferDistanceM != null) {
      map['transfer_distance_m'] = Variable<int>(transferDistanceM);
    }
    if (!nullToAbsent || transferTimeText != null) {
      map['transfer_time_text'] = Variable<String>(transferTimeText);
    }
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
      transferDistanceM: transferDistanceM == null && nullToAbsent
          ? const Value.absent()
          : Value(transferDistanceM),
      transferTimeText: transferTimeText == null && nullToAbsent
          ? const Value.absent()
          : Value(transferTimeText),
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
      transferDistanceM: serializer.fromJson<int?>(json['transferDistanceM']),
      transferTimeText: serializer.fromJson<String?>(json['transferTimeText']),
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
      'transferDistanceM': serializer.toJson<int?>(transferDistanceM),
      'transferTimeText': serializer.toJson<String?>(transferTimeText),
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
    Value<int?> transferDistanceM = const Value.absent(),
    Value<String?> transferTimeText = const Value.absent(),
    Value<String?> transferType = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Transfer(
    id: id ?? this.id,
    fromLineStationId: fromLineStationId ?? this.fromLineStationId,
    toLineStationId: toLineStationId ?? this.toLineStationId,
    walkingSeconds: walkingSeconds ?? this.walkingSeconds,
    transferDistanceM: transferDistanceM.present
        ? transferDistanceM.value
        : this.transferDistanceM,
    transferTimeText: transferTimeText.present
        ? transferTimeText.value
        : this.transferTimeText,
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
      transferDistanceM: data.transferDistanceM.present
          ? data.transferDistanceM.value
          : this.transferDistanceM,
      transferTimeText: data.transferTimeText.present
          ? data.transferTimeText.value
          : this.transferTimeText,
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
          ..write('transferDistanceM: $transferDistanceM, ')
          ..write('transferTimeText: $transferTimeText, ')
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
    transferDistanceM,
    transferTimeText,
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
          other.transferDistanceM == this.transferDistanceM &&
          other.transferTimeText == this.transferTimeText &&
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
  final Value<int?> transferDistanceM;
  final Value<String?> transferTimeText;
  final Value<String?> transferType;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransfersCompanion({
    this.id = const Value.absent(),
    this.fromLineStationId = const Value.absent(),
    this.toLineStationId = const Value.absent(),
    this.walkingSeconds = const Value.absent(),
    this.transferDistanceM = const Value.absent(),
    this.transferTimeText = const Value.absent(),
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
    this.transferDistanceM = const Value.absent(),
    this.transferTimeText = const Value.absent(),
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
    Expression<int>? transferDistanceM,
    Expression<String>? transferTimeText,
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
      if (transferDistanceM != null) 'transfer_distance_m': transferDistanceM,
      if (transferTimeText != null) 'transfer_time_text': transferTimeText,
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
    Value<int?>? transferDistanceM,
    Value<String?>? transferTimeText,
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
      transferDistanceM: transferDistanceM ?? this.transferDistanceM,
      transferTimeText: transferTimeText ?? this.transferTimeText,
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
    if (transferDistanceM.present) {
      map['transfer_distance_m'] = Variable<int>(transferDistanceM.value);
    }
    if (transferTimeText.present) {
      map['transfer_time_text'] = Variable<String>(transferTimeText.value);
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
          ..write('transferDistanceM: $transferDistanceM, ')
          ..write('transferTimeText: $transferTimeText, ')
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
  late final $DirectionPoliciesTable directionPolicies =
      $DirectionPoliciesTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    stations,
    lines,
    lineStations,
    directionPolicies,
    transfers,
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

  static MultiTypedResultKey<$DirectionPoliciesTable, List<DirectionPolicy>>
  _directionPoliciesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.directionPolicies,
        aliasName: $_aliasNameGenerator(
          db.stations.id,
          db.directionPolicies.destinationStationId,
        ),
      );

  $$DirectionPoliciesTableProcessedTableManager get directionPoliciesRefs {
    final manager =
        $$DirectionPoliciesTableTableManager(
          $_db,
          $_db.directionPolicies,
        ).filter(
          (f) => f.destinationStationId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _directionPoliciesRefsTable($_db),
    );
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

  Expression<bool> directionPoliciesRefs(
    Expression<bool> Function($$DirectionPoliciesTableFilterComposer f) f,
  ) {
    final $$DirectionPoliciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.directionPolicies,
      getReferencedColumn: (t) => t.destinationStationId,
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

  Expression<T> directionPoliciesRefs<T extends Object>(
    Expression<T> Function($$DirectionPoliciesTableAnnotationComposer a) f,
  ) {
    final $$DirectionPoliciesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.directionPolicies,
          getReferencedColumn: (t) => t.destinationStationId,
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
          PrefetchHooks Function({
            bool lineStationsRefs,
            bool directionPoliciesRefs,
          })
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
          prefetchHooksCallback:
              ({lineStationsRefs = false, directionPoliciesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lineStationsRefs) db.lineStations,
                    if (directionPoliciesRefs) db.directionPolicies,
                  ],
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
                          managerFromTypedResult: (p0) =>
                              $$StationsTableReferences(
                                db,
                                table,
                                p0,
                              ).lineStationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (directionPoliciesRefs)
                        await $_getPrefetchedData<
                          Station,
                          $StationsTable,
                          DirectionPolicy
                        >(
                          currentTable: table,
                          referencedTable: $$StationsTableReferences
                              ._directionPoliciesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StationsTableReferences(
                                db,
                                table,
                                p0,
                              ).directionPoliciesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.destinationStationId == item.id,
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
      PrefetchHooks Function({
        bool lineStationsRefs,
        bool directionPoliciesRefs,
      })
    >;
typedef $$LinesTableCreateCompanionBuilder =
    LinesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> color,
      Value<String?> lineType,
      Value<String?> operator,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LinesTableUpdateCompanionBuilder =
    LinesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> color,
      Value<String?> lineType,
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
                Value<String?> operator = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion(
                id: id,
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
                required String name,
                Value<String?> color = const Value.absent(),
                Value<String?> lineType = const Value.absent(),
                Value<String?> operator = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinesCompanion.insert(
                id: id,
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
          prefetchHooksCallback:
              ({lineStationsRefs = false, directionPoliciesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lineStationsRefs) db.lineStations,
                    if (directionPoliciesRefs) db.directionPolicies,
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
typedef $$DirectionPoliciesTableCreateCompanionBuilder =
    DirectionPoliciesCompanion Function({
      Value<int> id,
      required int lineId,
      Value<String> branchKey,
      required String servicePatternKey,
      required String directionKind,
      Value<String?> apiDirection,
      Value<String?> apiTerminalStationCode,
      Value<String?> apiTerminalStationName,
      Value<int?> destinationStationId,
      required String displayLabelKo,
      Value<String?> displayLabelEn,
      Value<String?> displayLabelJp,
      Value<String?> displayLabelCh,
      Value<int> priority,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$DirectionPoliciesTableUpdateCompanionBuilder =
    DirectionPoliciesCompanion Function({
      Value<int> id,
      Value<int> lineId,
      Value<String> branchKey,
      Value<String> servicePatternKey,
      Value<String> directionKind,
      Value<String?> apiDirection,
      Value<String?> apiTerminalStationCode,
      Value<String?> apiTerminalStationName,
      Value<int?> destinationStationId,
      Value<String> displayLabelKo,
      Value<String?> displayLabelEn,
      Value<String?> displayLabelJp,
      Value<String?> displayLabelCh,
      Value<int> priority,
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

  static $StationsTable _destinationStationIdTable(_$AppDatabase db) =>
      db.stations.createAlias(
        $_aliasNameGenerator(
          db.directionPolicies.destinationStationId,
          db.stations.id,
        ),
      );

  $$StationsTableProcessedTableManager? get destinationStationId {
    final $_column = $_itemColumn<int>('destination_station_id');
    if ($_column == null) return null;
    final manager = $$StationsTableTableManager(
      $_db,
      $_db.stations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _destinationStationIdTable($_db),
    );
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

  ColumnFilters<String> get servicePatternKey => $composableBuilder(
    column: $table.servicePatternKey,
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

  ColumnFilters<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayLabelEn => $composableBuilder(
    column: $table.displayLabelEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayLabelJp => $composableBuilder(
    column: $table.displayLabelJp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayLabelCh => $composableBuilder(
    column: $table.displayLabelCh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
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

  $$StationsTableFilterComposer get destinationStationId {
    final $$StationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationStationId,
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

  ColumnOrderings<String> get servicePatternKey => $composableBuilder(
    column: $table.servicePatternKey,
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

  ColumnOrderings<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayLabelEn => $composableBuilder(
    column: $table.displayLabelEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayLabelJp => $composableBuilder(
    column: $table.displayLabelJp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayLabelCh => $composableBuilder(
    column: $table.displayLabelCh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
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

  $$StationsTableOrderingComposer get destinationStationId {
    final $$StationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationStationId,
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

  GeneratedColumn<String> get servicePatternKey => $composableBuilder(
    column: $table.servicePatternKey,
    builder: (column) => column,
  );

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

  GeneratedColumn<String> get apiTerminalStationName => $composableBuilder(
    column: $table.apiTerminalStationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayLabelKo => $composableBuilder(
    column: $table.displayLabelKo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayLabelEn => $composableBuilder(
    column: $table.displayLabelEn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayLabelJp => $composableBuilder(
    column: $table.displayLabelJp,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayLabelCh => $composableBuilder(
    column: $table.displayLabelCh,
    builder: (column) => column,
  );

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

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

  $$StationsTableAnnotationComposer get destinationStationId {
    final $$StationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.destinationStationId,
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
          PrefetchHooks Function({bool lineId, bool destinationStationId})
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
                Value<String> servicePatternKey = const Value.absent(),
                Value<String> directionKind = const Value.absent(),
                Value<String?> apiDirection = const Value.absent(),
                Value<String?> apiTerminalStationCode = const Value.absent(),
                Value<String?> apiTerminalStationName = const Value.absent(),
                Value<int?> destinationStationId = const Value.absent(),
                Value<String> displayLabelKo = const Value.absent(),
                Value<String?> displayLabelEn = const Value.absent(),
                Value<String?> displayLabelJp = const Value.absent(),
                Value<String?> displayLabelCh = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DirectionPoliciesCompanion(
                id: id,
                lineId: lineId,
                branchKey: branchKey,
                servicePatternKey: servicePatternKey,
                directionKind: directionKind,
                apiDirection: apiDirection,
                apiTerminalStationCode: apiTerminalStationCode,
                apiTerminalStationName: apiTerminalStationName,
                destinationStationId: destinationStationId,
                displayLabelKo: displayLabelKo,
                displayLabelEn: displayLabelEn,
                displayLabelJp: displayLabelJp,
                displayLabelCh: displayLabelCh,
                priority: priority,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lineId,
                Value<String> branchKey = const Value.absent(),
                required String servicePatternKey,
                required String directionKind,
                Value<String?> apiDirection = const Value.absent(),
                Value<String?> apiTerminalStationCode = const Value.absent(),
                Value<String?> apiTerminalStationName = const Value.absent(),
                Value<int?> destinationStationId = const Value.absent(),
                required String displayLabelKo,
                Value<String?> displayLabelEn = const Value.absent(),
                Value<String?> displayLabelJp = const Value.absent(),
                Value<String?> displayLabelCh = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DirectionPoliciesCompanion.insert(
                id: id,
                lineId: lineId,
                branchKey: branchKey,
                servicePatternKey: servicePatternKey,
                directionKind: directionKind,
                apiDirection: apiDirection,
                apiTerminalStationCode: apiTerminalStationCode,
                apiTerminalStationName: apiTerminalStationName,
                destinationStationId: destinationStationId,
                displayLabelKo: displayLabelKo,
                displayLabelEn: displayLabelEn,
                displayLabelJp: displayLabelJp,
                displayLabelCh: displayLabelCh,
                priority: priority,
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
          prefetchHooksCallback:
              ({lineId = false, destinationStationId = false}) {
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
                        if (destinationStationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.destinationStationId,
                                    referencedTable:
                                        $$DirectionPoliciesTableReferences
                                            ._destinationStationIdTable(db),
                                    referencedColumn:
                                        $$DirectionPoliciesTableReferences
                                            ._destinationStationIdTable(db)
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
      PrefetchHooks Function({bool lineId, bool destinationStationId})
    >;
typedef $$TransfersTableCreateCompanionBuilder =
    TransfersCompanion Function({
      Value<int> id,
      required int fromLineStationId,
      required int toLineStationId,
      required int walkingSeconds,
      Value<int?> transferDistanceM,
      Value<String?> transferTimeText,
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
      Value<int?> transferDistanceM,
      Value<String?> transferTimeText,
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

  ColumnFilters<int> get transferDistanceM => $composableBuilder(
    column: $table.transferDistanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transferTimeText => $composableBuilder(
    column: $table.transferTimeText,
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

  ColumnOrderings<int> get transferDistanceM => $composableBuilder(
    column: $table.transferDistanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transferTimeText => $composableBuilder(
    column: $table.transferTimeText,
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

  GeneratedColumn<int> get transferDistanceM => $composableBuilder(
    column: $table.transferDistanceM,
    builder: (column) => column,
  );

  GeneratedColumn<String> get transferTimeText => $composableBuilder(
    column: $table.transferTimeText,
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
                Value<int?> transferDistanceM = const Value.absent(),
                Value<String?> transferTimeText = const Value.absent(),
                Value<String?> transferType = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransfersCompanion(
                id: id,
                fromLineStationId: fromLineStationId,
                toLineStationId: toLineStationId,
                walkingSeconds: walkingSeconds,
                transferDistanceM: transferDistanceM,
                transferTimeText: transferTimeText,
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
                Value<int?> transferDistanceM = const Value.absent(),
                Value<String?> transferTimeText = const Value.absent(),
                Value<String?> transferType = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TransfersCompanion.insert(
                id: id,
                fromLineStationId: fromLineStationId,
                toLineStationId: toLineStationId,
                walkingSeconds: walkingSeconds,
                transferDistanceM: transferDistanceM,
                transferTimeText: transferTimeText,
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
  $$DirectionPoliciesTableTableManager get directionPolicies =>
      $$DirectionPoliciesTableTableManager(_db, _db.directionPolicies);
  $$TransfersTableTableManager get transfers =>
      $$TransfersTableTableManager(_db, _db.transfers);
}
