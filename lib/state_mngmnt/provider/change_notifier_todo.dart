import 'package:flutter/cupertino.dart';

import 'task_model.dart';

class ChangeNotifierTodo extends ChangeNotifier{
  List<TaskModel> taskList = []; //contians all the task
  addTaskInList(){
    TaskModel taskModel = TaskModel("Title ${taskList.length}", 
    "This is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
    //code to do
  }
}

