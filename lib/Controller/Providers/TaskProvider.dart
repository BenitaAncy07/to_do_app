import 'package:flutter/material.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Utilities/Actions.dart';
import 'package:to_do_app/Model/task.dart';
import 'package:to_do_app/View/Typography/Bottomsheet.dart';
import 'package:to_do_app/View/Typography/dialogbox.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> _filteredTasks = [];
  List<Task> get tasks => _filteredTasks.isEmpty ? _tasks : _filteredTasks;

  //=========================Add Task==========================
  void addTask(BuildContext context) {
    bottomSheet1(
      context,
      addtasktext,
      [titletext, descriptiontext],
      [1, 1],
      [1, 3],
      (title, description) {
        _tasks.add(Task(title: title, description: description));
        notifyListeners();
        closeaction(context);
      },
    );
  }

  //==========================Update status of task================
  void updateTaskstatus(int index) {
    _tasks[index].taskCompleted();
    notifyListeners();
  }

  //=========================delete task=========================
  void deleteTask(BuildContext context, int index) {
    FocusScope.of(context).unfocus();
    dialogbox(context, deleteheading, deletecontent, (a) {
      _tasks.removeAt(index);
      notifyListeners();
      Navigator.of(context, rootNavigator: true).pop(true);
    });
  }

  //=========================Search task========================
  void searchTask(String query) {
    if (query.trim().isEmpty) {
      _filteredTasks.clear();
    } else {
      _filteredTasks =
          _tasks.where((task) {
            bool titleMatch = task.title.toLowerCase().contains(
              query.toLowerCase(),
            );
            bool descMatch = task.description.toLowerCase().contains(
              query.toLowerCase(),
            );
            return titleMatch || descMatch;
          }).toList();
    }
    notifyListeners();
  }
}
