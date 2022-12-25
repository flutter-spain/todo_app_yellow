import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {

  List todoDoList = [];

  // reference to the database
  final _myBox = Hive.box('mybox');

  // create initial data
  void createInitialData(){
    todoDoList = [
      ["Make Tutorial", false],
    ];
  }

  // Load data from database
  void loadData(){
    todoDoList = _myBox.get("TODOLIST");
  }


  // Save data to database
  void updateDataBase(){
    _myBox.put('TODOLIST', todoDoList);
  }


}