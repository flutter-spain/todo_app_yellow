import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_yellow/components/dialog_box.dart';
import 'package:todo_app_yellow/components/todo_tile.dart';
import 'package:todo_app_yellow/data/database.dart';


class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // reference the hive box
  final _myBox = Hive.box('mybox');

  // Create a database
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    // Inicializar la base de datos
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // Load data from database
      db.loadData();
    }
  }



  // text controller
  final _controller = TextEditingController();


  // list of tasks
  // List todoDoList = [
  //     ["Task 1", false],
  //     ["Task 2", true],
  // ];

  // Chekbox changed
  void checkBoxChanged(bool? value, int index){
      setState(() {
        db.todoDoList[index][1] = !db.todoDoList[index][1];
      });
      db.updateDataBase();
  } 


  // Save new task
  void saveNewTask(){
    setState(() {
      db.todoDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // delete task
  void deleteTask(int index){
    setState(() {
      db.todoDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void createNewTask(){
        showDialog(
          context: context,
          builder: (context) {
             return DialogBox(
                controller: _controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(),
             );
          }, 
        );  
    }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),

      body: ListView.builder(
        itemCount: db.todoDoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskName: db.todoDoList[index][0],
            taskCompleted: db.todoDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

    );
  }
}