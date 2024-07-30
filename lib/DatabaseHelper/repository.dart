
import 'package:mytime/DatabaseHelper/connection.dart';
import 'package:mytime/DatabaseHelper/tables.dart';

import '../Models/users.dart';

class Repository{
  final DatabaseHelper databaseHelper = DatabaseHelper();

  //Authentication
   Future<bool> authenticate(Users users)async{
   final db = await databaseHelper.initDB();
   final authenticated = await db.query(Tables.userTableName, where: "username = ? AND password = ? ",whereArgs: [users.username, users.password]);
   if(authenticated.isNotEmpty){
     return true;
   }else{
     return false;
   }
   }

   //Sign up new account
   Future<int> registerUser(Users users)async{
     final db = await databaseHelper.initDB();
     final res = await db.query(Tables.userTableName,where: "username = ?",whereArgs: [users.username]);
     if(res.isNotEmpty){
       return 0;
     }else{
       return db.insert(Tables.userTableName, users.toMap());
     }

   }

   //Get logged in user
   Future<Users> getLoggedIn(String username)async{
     final db = await databaseHelper.initDB();
     final result = await db.query(Tables.userTableName,where: "username = ?",whereArgs: [username]);
     if(result.isNotEmpty){
       return Users.fromMap(result.first);
     }else{
       throw Exception("User $username not found");
     }
   }



 }