
import 'package:mytime/DatabaseHelper/connection.dart';
import 'package:mytime/DatabaseHelper/tables.dart';
import 'package:mytime/Models/task.dart';

import '../Models/users.dart';

class AuthService{
  final DatabaseHelper databaseHelper = DatabaseHelper();

  //Authentication
   Future<bool> authenticate(Users users)async{
   final db = await databaseHelper.database;
   final authenticated = await db.query(Tables.userTableName, where: "username = ? AND password = ? ",whereArgs: [users.username, users.password]);
   if(authenticated.isNotEmpty){
     return true;
   }else{
     return false;
   }
   }

   //Sign up new account
   Future<int> registerUser(Users users)async{
     final db = await databaseHelper.database;
     final res = await db.query(Tables.userTableName,where: "username = ?",whereArgs: [users.username]);
     if(res.isNotEmpty){
       return 0;
     }else{
       return db.insert(Tables.userTableName, users.toMap());
     }

   }

   //Get logged in user
   Future<Users> getLoggedIn(String username)async{
     final db = await databaseHelper.database;
     final result = await db.query(Tables.userTableName,where: "username = ?",whereArgs: [username]);
     if(result.isNotEmpty){
       return Users.fromMap(result.first);
     }else{
       throw Exception("User $username not found");
     }
   }
 }

 class TaskRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> addTask(Task task) async {
    final db = await _dbHelper.database;
    return await db.insert('tasks', task.toJson());
  }

  Future<List<Task>> getTasks() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task.fromJson(maps[i]);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await _dbHelper.database;
    return await db.update(
      'tasks',
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}