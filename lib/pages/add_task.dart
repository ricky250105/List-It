import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:list_it/Components/radio_widget.dart';
import 'package:list_it/Components/date_time_widget.dart';
import 'package:list_it/provider/date_time_provider.dart';
import 'package:list_it/provider/radio_provider.dart';


class AddTask extends ConsumerWidget {
  const AddTask ({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 167, 137, 1),
        elevation: 0,
        title: const Text('Add New Task'),
      ),
      body: (
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(235, 243, 232, 1),
          ),

          child: SingleChildScrollView(

            //Add new task text
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  label('Task name'),
                  const SizedBox(height: 12),
                  taskname(),

                  const SizedBox(height: 25),
                  label('Task Description'),
                  const SizedBox(height: 12),
                  description(),

                  const SizedBox(height: 25),
                  label ('Category'),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // Add outline color
                      borderRadius: BorderRadius.circular(0),),

                    child: Row(
                      children: [
                        Expanded(
                          child: RadioWidget(
                            categColor: Colors.blue,
                            titleRadio: ("PRSNL"), 
                            valueInput: 1, 
                            onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 1),
                          ),
                        ),
                        Expanded(
                          child: RadioWidget(
                            categColor: Colors.green,
                            titleRadio: ("WRK"), 
                            valueInput: 2, 
                            onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 2),
                          ),
                        ),
                        Expanded(
                          child: RadioWidget(
                            categColor: const Color.fromARGB(255, 255, 234, 48),
                            titleRadio: ("OTHRS"), valueInput: 3,
                            onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateTimeWidget(
                        titleText: "Date",
                        valueText: dateProv,
                        icon: CupertinoIcons.calendar,
                        onTapPicker: () async {
                          final getValue = await showDatePicker(
                            context: context, 
                            initialDate: DateTime.now(), 
                            firstDate: DateTime(2020), 
                            lastDate: DateTime(2025),);
                          if(getValue != null) {
                            final format = DateFormat.yMd();
                            ref
                            .read(dateProvider.notifier)
                            .update((state) => format.format(getValue));
                          } 
                            },
                      ),
                      const Gap(12),

                      DateTimeWidget(
                        titleText: "Time",
                        valueText: ref.watch(timeProvider),
                        icon: CupertinoIcons.clock,
                        onTapPicker: () async {
                          final getTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (getTime != null) {
                            ref
                            .read(timeProvider.notifier)
                            .update((state) => getTime.format(context));
                          }
                        },
                      ),
                    ],
                  ),
                  
                  const Gap(225),
                  //buttons
                  Row(
                    children: [
                      Expanded(child: 
                        ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          fixedSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12)),
                          side: const BorderSide(color: Color.fromRGBO(178, 200, 186, 1), width: 3)
                        ),
                        child: const Text("Cancel"),)),
                      const Gap(20),
                      Expanded(child: 
                        ElevatedButton(onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(178, 200, 186, 1),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          fixedSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text ('Add'),)
                      )
                    ],
                  ),
                ],
              ),
            )
          ),
        )
      )
    );
  }

  Widget description() {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        maxLines: 5,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText:'Task description',
          hintStyle: TextStyle(color: Colors.grey[500]),
          )));
  }

  Widget taskname() {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
          decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText:'Task name',
            hintStyle: TextStyle(color: Colors.grey[500]),
            )),
      );
  }

  Widget label(String label) {
    return Text(label,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }
}
