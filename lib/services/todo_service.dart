import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:list_it/model/todo_model.dart';

class TodoService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final todoCollection = FirebaseFirestore.instance.collection('TodoApp');

  //create
  void addNewTask(TodoModel model) {
    todoCollection
        .doc(_auth.currentUser!.uid)
        .collection('MyTodo')
        .doc(model.docID)
        .set(model.toMap());
  }

  void updateTodo(TodoModel model)async =>  await todoCollection
      .doc(_auth.currentUser!.uid)
      .collection('MyTodo')
      .doc(model.docID)
      .update(model.toMap());

  void deleteTodo(TodoModel model) async =>  await todoCollection
      .doc(_auth.currentUser!.uid)
      .collection('MyTodo')
      .doc(model.docID)
      .delete();
}
