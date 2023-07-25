
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:structure_mvvm/app/database/databse_values.dart';

class DatabaseHelper {
  Database? db;

  Future<bool> isTableExists(Database database, String tableName) async {
    final List<Map<String, dynamic>> tables = await database.query(
      'sqlite_master',
      where: 'type = ? AND name = ?',
      whereArgs: ['table', tableName],
    );
    return tables.isNotEmpty;
  }

  Future<void> createtables(Database database,
      {tableName, executeCommamd}) async {
    final bool tableExists = await isTableExists(database, tableName);

    if (!tableExists) {
      await database.execute(executeCommamd);
      print('Table Created');
    } else {
      print('Table already exists');
    }
  }

  Future<Database?> dpOpen() async {
    db = await openDatabase(
      DatabaseValues.dbName,
      version: DatabaseValues.dbVersion,
      onConfigure: (Database database) async {},
    );

    debugPrint(db?.path);
    return db;
  }

  Future<dynamic> insertItem(String tableName, {dynamic model}) async {
    await db?.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint("Data Inserted Successfully into $tableName ${model}");
    return model;
  }

  Future<List<Map<String, dynamic>>?> getItems(tableName) async {
    if (db == null) {
      debugPrint('Database is not open. Open the database first.');
      return null;
    }
    return await db?.query(tableName);
  }

  Future<Map<String, dynamic>?> getItemsById(tableName, {id}) async {
    if (db == null) {
      debugPrint('Database is not open. Open the database first.');
      return null;
    }
    List<Map<String, dynamic>>?item= await db?.query(
      tableName,
      where: '${DatabaseValues.columnId} = ?',
      whereArgs: [id],
    );
    return item?.first;
  }
  Future<List<Map<String, dynamic>>?> getItemsByQuery(tableName, {required String? where,required    List<Object?>?whereArgs}) async {
    if (db == null) {
      debugPrint('Database is not open. Open the database first.');
      return null;
    }
    List<Map<String, dynamic>>?item= await db?.query(
      tableName,
      where:where,
      whereArgs: whereArgs,
    );
    return item;
  }

  Future<int?> delete(tableName, {int? id}) async {
    debugPrint('Item Deleted Successfully');
    return await db?.delete(DatabaseValues.tableItem,
        where: '${DatabaseValues.columnId} = ?', whereArgs: [id]);
  }

  Future<void> updateItem(String tableName, {dynamic model, id}) async {
    if (id != null) {
      int? rowsAffected = await db?.update(
        tableName,
        model.toMap(),
        where: '${DatabaseValues.columnId} = ?',
        whereArgs: [id],
      );

      if (rowsAffected! > 0) {
        debugPrint("Data Updated Successfully ");
      } else {
        debugPrint("Data Update Failed ");
      }
    } else {
      debugPrint("Cannot update item with null ID");
    }
  }

  Future<void> deleteTable(Database database, {tableName}) async {
    try {
      database.execute("DROP TABLE IF EXISTS ${tableName}");
      debugPrint('Table Deleted Successfully');
    } catch (e) {
      debugPrint('Error Deleting Table $e');
    }
  }
}
