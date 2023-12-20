import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_it/model/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('TodoApp');

  //create
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}