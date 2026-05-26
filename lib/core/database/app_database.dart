import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_pokemon/core/database/trainer_table.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TrainerTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ─────────────────────────────────────────────────────────────
  // Save trainer session
  // ─────────────────────────────────────────────────────────────

  Future<void> saveTrainer({
    required String uid,
    required String username,
    required String email,
    required String gender,
  }) async {
    await into(trainerTable).insertOnConflictUpdate(
      TrainerTableCompanion.insert(
        uid: uid,
        username: username,
        email: email,
        gender: gender,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Get current trainer
  // ─────────────────────────────────────────────────────────────

  Future<TrainerTableData?> getTrainer() async {
    return await select(
      trainerTable,
    ).getSingleOrNull();
  }

  // ─────────────────────────────────────────────────────────────
  // Clear session
  // ─────────────────────────────────────────────────────────────

  Future<void> clearSession() async {
    await delete(trainerTable).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File(
      p.join(dir.path, 'app.sqlite'),
    );

    return NativeDatabase(file);
  });
}