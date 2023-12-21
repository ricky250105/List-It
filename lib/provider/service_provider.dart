import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_it/model/todo_model.dart';
import 'package:list_it/services/todo_service.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final getData = FirebaseFirestore.instance
      .collection('TodoApp')
      .doc(auth.currentUser!.uid)
      .collection('MyTodo')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModel.fromMap(snapshot.data()))
          .toList()
          .reversed
          .toList());
  yield* getData;
});
