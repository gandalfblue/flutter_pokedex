import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';

part 'auth_database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(
    AppDatabaseRef ref,
    ) {
  return AppDatabase();
}