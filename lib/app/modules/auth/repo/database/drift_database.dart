
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class LoginTable extends Table {
  // autoincrement sets this to the primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text()();

  TextColumn get password => text()();

}

class RegisterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 2, max: 50)();

  TextColumn get email => text()();

  TextColumn get password => text()();

  TextColumn get quentity => text()();

}

/*@DriftDatabase(tables: [LoginTable, RegisterTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<LoginTableData>> getAllLoginUser() => select(loginTable).get();

  Future insertData(LoginTableCompanion login) =>
      into(loginTable).insert(login);

  Future updateData(LoginTableData medicine) =>
      update(loginTable).replace(login);

  Future deleteData(LoginTableData login) =>
      delete(loginTable).delete(login);



  Future<List<RegisterTableData>> getAllUsers() => select(registerTable).get();

  Future insertRecent(RegisterTableCompanion register) =>
      into(registerTable).insert(register);

  Future updateRecent(RegisterTableData register) =>
      update(registerTable).replace(register);

  Future deleteRecent(RegisterTableData register) =>
      delete(registerTable).delete(register);
}*/

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}