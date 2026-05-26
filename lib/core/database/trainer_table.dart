import 'package:drift/drift.dart';

class TrainerTable extends Table {
  TextColumn get uid => text()();

  TextColumn get username => text()();

  TextColumn get email => text()();

  TextColumn get gender => text()();

  @override
  Set<Column> get primaryKey => {uid};
}