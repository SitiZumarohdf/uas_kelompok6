import 'package:sqflite/sqflite.dart' as db;
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:uas_kelompok6/models/item.dart';

class DbHelper {
  static DbHelper? _dbHelper;

  DbHelper._createObject();

  static Future<db.Database> initDb() async {
    //untuk menentukan nama database dan lokasi yang dibuat
    // Directory directory = await getApplicationDocumentsDirectory();
    String path = 'item2.db';

    //create, read database
    var itemDatabase = db.openDatabase(path, version: 8,
        onCreate: (db.Database database, int version) async {
      await _createDb(database);
    });

    // Mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  static Future<void> _createDb(db.Database db) async {
    await db.execute('''
      CREATE TABLE item(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nim INTEGER,
        nama TEXT,
        alamat TEXT,
        kelamin TEXT
      )
    ''');
  }

  //select database
  static Future<List<Map<String, dynamic>>> select() async {
    final db = await DbHelper.initDb();
    var mapList = await db.query('item', orderBy: 'nama');

    return mapList;
  }

  //create database
  static Future<int> insert(Item object) async {
    final db = await DbHelper.initDb();
    int count = await db.insert('item', object.toMap());

    return count;
  }

  //update database
  static Future<int> update(Item object) async {
    final db = await DbHelper.initDb();
    int count = await db.update('item', object.toMap(),
        where: 'nim=?', whereArgs: [object.nim]);
    return count;
  }

  //delete database
  static Future<int> delete(int nim) async {
    final db = await DbHelper.initDb();
    int count = await db.delete('item', where: 'nim=?', whereArgs: [nim]);
    return count;
  }

  static Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;

    // ignore: deprecated_member_use, prefer_collection_literals
    List<Item> itemList = <Item>[];
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }

    return itemList;
  }
}
