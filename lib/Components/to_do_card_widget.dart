import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:list_it/model/todo_model.dart';

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget({super.key, required this.todo});

  final TodoModel todo;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            width: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(todo.titleTask),
                  subtitle: Text(todo.description),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor:Colors.blue ,
                      value: todo.isDone,
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(todo.dateTask),
                        Text(todo.timeTask)
                      ],
                    )
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
