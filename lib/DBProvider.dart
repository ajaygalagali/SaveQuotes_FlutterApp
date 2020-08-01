import 'package:flutter/cupertino.dart';
import 'package:quotes/QuoteList.dart';
import 'package:quotes/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;
  static final _version =1;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'quotes.db'),
        onCreate: (db,version) async {
          await db.execute('''
          CREATE TABLE tQuotes(
          text TEXT,author TEXT
          )
        ''');
        },
      version: 1,
    );
  }

  Future<void> insertQuote(QuoteList quote) async {
    final Database db = await database;
    await db.insert(
        'tQuotes', quote.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<QuoteList>> reQuotes() async {
    final Database db = await database;

    final List<Map<String,dynamic>> maps = await db.query('tQuotes');

    return List.generate(maps.length, (i){
      return QuoteList(
        text: maps[i]['text'],
        author: maps[i]['author']
      );
    });


  }



  Future<void> deleteQuote(String quotetoDel) async{
    final Database db = await database;
    await db.delete('tQuotes',where: "text = ?",whereArgs:[quotetoDel]);
  }

  newUser(QuoteList newUser) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO tQuotes(
      text,author
      )VALUES(?,?)
    ''', [newUser.text, newUser.author]);

    return res;
  }

}


