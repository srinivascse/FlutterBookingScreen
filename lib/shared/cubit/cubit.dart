import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  static List<String> BookedSeats=List.filled(0,"",growable: true);

  Database? database;



  void deleteFromDatabase(int id) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataBase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                //id integer
                //title string
                //data string
                //time string
                //status string
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, seatid TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) => print('Table Created'))
            .catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataBase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void  getDataBase(database) async {

    BookedSeats.clear();

    database!.rawQuery('SELECT * FROM tasks').then((value) {
      //print(value);
      value.forEach((element) {
        print(element['seatid']);
        BookedSeats.add(element['seatid'].toString());


      });
      emit(AppGetDatabaseState());
    });
  }

  inserToDatabase(
      {required String seatid,
      required String time,
      required String date}) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (seatid, date, time, status) VALUES ("$seatid","$date","$time","New")')
          .then((value) {
        getDataBase(database);
        emit(AppInsertDatabaseState());
      }).catchError((error) {
        print('Error When inserting Table ${error.toString()}');
      });
    });
  }


}
