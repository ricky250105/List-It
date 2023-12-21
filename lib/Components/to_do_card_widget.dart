import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:list_it/provider/service_provider.dart';

class ToDoCardWidget extends ConsumerWidget {
  const ToDoCardWidget({
    super.key,
    required this.getIndex
  });

final int getIndex;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);

    return todoData.when(
      data: (todoData) => 
      Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)
            )
          ),
          width: 20,
        ),
    
        Expanded(child: 
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title:  Text(todoData[getIndex].titleTask),
              subtitle:  Text(todoData[getIndex].description),
              trailing: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  activeColor: Colors.blue,
                  value: todoData[getIndex].isDone, 
                  onChanged: (value) => print(value),),
              ),
            ),
          
          Expanded(child: Column(
            children: [
              Divider(
                thickness: 1.5, color: Colors.grey.shade300,
              ),
              Row(
                children: [
                  Text('something'),
                  Gap(12),
                  Text (todoData[getIndex].timeTask)
                ],
              )
            ],
          ))
          ],
        ),))
      ],),
      
    ), 
      error: (error,stackTrace) => Center(child: Text(stackTrace.toString())), 
      loading: () => const Center(child: CircularProgressIndicator(),)
      );
  }
}
