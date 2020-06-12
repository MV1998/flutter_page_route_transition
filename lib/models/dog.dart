import 'dart:math';

import 'package:sqflite/sqflite.dart';

import '../database/my_sqflite.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'id : $id, name : $name, age : $age';
  }
}

Future<void> insertDog(Dog dog) async {
  final Database db = await database();

  await db.insert('dogs', dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

putData() async {
  Random random = Random.secure();
  var dog = Dog(
      id: random.nextInt(100),
      name: 'fide${random.nextInt(100)}',
      age: random.nextInt(1009));
  await insertDog(dog);
}

Future<List<Dog>> dogs() async {
  final Database db = await database();
  final List<Map<String, dynamic>> maps = await db.query('dogs');
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}

Future<void> updateDog(Dog dog) async {
  final Database db = await database();
  await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
}

Future<void> deleteDog(int id) async {
  final Database db = await database();
  await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
}

Future<List<Dog>> specialData() async{
  final Database db = await database();
  final List<Map<String, dynamic>> maps = await  db.rawQuery('SELECT * FROM dogs WHERE age <= 500');
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}
