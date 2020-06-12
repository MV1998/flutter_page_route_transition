import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> database() async {
  return await openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute("CREATE TABLE dogs(id INTEGER, name TEXT, age INTEGER)",);
    },
    version: 1
  );
}