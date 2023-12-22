import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:list_it/model/todo_model.dart';
import 'package:list_it/provider/service_provider.dart';

class ToDoCardWidget extends ConsumerWidget {
  const ToDoCardWidget({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: (c) => ref.read(serviceProvider).deleteTodo(todo),
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Container(
        width: double.infinity,
        height: todo.description.length > 80 ? 200 : 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: todo.isDone ? Colors.green : Colors.red,
                  borderRadius: const BorderRadius.only(
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
                          title: Text(
                            todo.titleTask,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(todo.description),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              activeColor: Colors.green,
                              value: todo.isDone,
                              onChanged: (value) => ref
                                  .read(serviceProvider)
                                  .updateTodo(todo.copyWith(isDone: value)),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey.shade300,
                        ),
                        Text(
                          todo.category,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(todo.dateTask), Text(todo.timeTask)],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
