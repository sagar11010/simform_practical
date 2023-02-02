import 'dart:io';

import 'package:drift/drift.dart';
import 'package:interview_task/core/network/model/random_user_response_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get profile => text()();

  TextColumn get email => text()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Result>> getUsers() async {
    List<User> list = await select(users).get();
    List<Result> userList = [];
    list.forEach((element) {
      userList.add(Result(
          email: element.email,
          name: Name(first: element.name, last: ''),
          picture: Picture(thumbnail: element.profile)));
    });
    return userList;
  }

  Future<void> insertItem(List<Result> usersList) async {
    await delete(users).go();

    usersList.forEach((element) async {
      await into(users).insert(UsersCompanion.insert(
          name: element.name!.first! + element.name!.last!,
          profile: element.picture!.thumbnail!,
          email: element.email!));

    });
  }
}
