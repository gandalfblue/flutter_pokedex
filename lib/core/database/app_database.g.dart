// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TrainerTableTable extends TrainerTable
    with TableInfo<$TrainerTableTable, TrainerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uid, username, email, gender];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainer_table';
  @override
  VerificationContext validateIntegrity(Insertable<TrainerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  TrainerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainerTableData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
    );
  }

  @override
  $TrainerTableTable createAlias(String alias) {
    return $TrainerTableTable(attachedDatabase, alias);
  }
}

class TrainerTableData extends DataClass
    implements Insertable<TrainerTableData> {
  final String uid;
  final String username;
  final String email;
  final String gender;
  const TrainerTableData(
      {required this.uid,
      required this.username,
      required this.email,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    return map;
  }

  TrainerTableCompanion toCompanion(bool nullToAbsent) {
    return TrainerTableCompanion(
      uid: Value(uid),
      username: Value(username),
      email: Value(email),
      gender: Value(gender),
    );
  }

  factory TrainerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainerTableData(
      uid: serializer.fromJson<String>(json['uid']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
    };
  }

  TrainerTableData copyWith(
          {String? uid, String? username, String? email, String? gender}) =>
      TrainerTableData(
        uid: uid ?? this.uid,
        username: username ?? this.username,
        email: email ?? this.email,
        gender: gender ?? this.gender,
      );
  TrainerTableData copyWithCompanion(TrainerTableCompanion data) {
    return TrainerTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainerTableData(')
          ..write('uid: $uid, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, username, email, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainerTableData &&
          other.uid == this.uid &&
          other.username == this.username &&
          other.email == this.email &&
          other.gender == this.gender);
}

class TrainerTableCompanion extends UpdateCompanion<TrainerTableData> {
  final Value<String> uid;
  final Value<String> username;
  final Value<String> email;
  final Value<String> gender;
  final Value<int> rowid;
  const TrainerTableCompanion({
    this.uid = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainerTableCompanion.insert({
    required String uid,
    required String username,
    required String email,
    required String gender,
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        username = Value(username),
        email = Value(email),
        gender = Value(gender);
  static Insertable<TrainerTableData> custom({
    Expression<String>? uid,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainerTableCompanion copyWith(
      {Value<String>? uid,
      Value<String>? username,
      Value<String>? email,
      Value<String>? gender,
      Value<int>? rowid}) {
    return TrainerTableCompanion(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainerTableCompanion(')
          ..write('uid: $uid, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TrainerTableTable trainerTable = $TrainerTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [trainerTable];
}

typedef $$TrainerTableTableCreateCompanionBuilder = TrainerTableCompanion
    Function({
  required String uid,
  required String username,
  required String email,
  required String gender,
  Value<int> rowid,
});
typedef $$TrainerTableTableUpdateCompanionBuilder = TrainerTableCompanion
    Function({
  Value<String> uid,
  Value<String> username,
  Value<String> email,
  Value<String> gender,
  Value<int> rowid,
});

class $$TrainerTableTableFilterComposer
    extends Composer<_$AppDatabase, $TrainerTableTable> {
  $$TrainerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));
}

class $$TrainerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainerTableTable> {
  $$TrainerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));
}

class $$TrainerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainerTableTable> {
  $$TrainerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);
}

class $$TrainerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainerTableTable,
    TrainerTableData,
    $$TrainerTableTableFilterComposer,
    $$TrainerTableTableOrderingComposer,
    $$TrainerTableTableAnnotationComposer,
    $$TrainerTableTableCreateCompanionBuilder,
    $$TrainerTableTableUpdateCompanionBuilder,
    (
      TrainerTableData,
      BaseReferences<_$AppDatabase, $TrainerTableTable, TrainerTableData>
    ),
    TrainerTableData,
    PrefetchHooks Function()> {
  $$TrainerTableTableTableManager(_$AppDatabase db, $TrainerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerTableCompanion(
            uid: uid,
            username: username,
            email: email,
            gender: gender,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String username,
            required String email,
            required String gender,
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerTableCompanion.insert(
            uid: uid,
            username: username,
            email: email,
            gender: gender,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainerTableTable,
    TrainerTableData,
    $$TrainerTableTableFilterComposer,
    $$TrainerTableTableOrderingComposer,
    $$TrainerTableTableAnnotationComposer,
    $$TrainerTableTableCreateCompanionBuilder,
    $$TrainerTableTableUpdateCompanionBuilder,
    (
      TrainerTableData,
      BaseReferences<_$AppDatabase, $TrainerTableTable, TrainerTableData>
    ),
    TrainerTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TrainerTableTableTableManager get trainerTable =>
      $$TrainerTableTableTableManager(_db, _db.trainerTable);
}
