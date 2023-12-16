import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget { 
  const ToDoCard ({super.key, required this.title, required this.time, required this.check, required this.borderColor});

  final String title; 
  final String time;
  final bool check;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            data: ThemeData(
                primarySwatch: Colors.blue,
                unselectedWidgetColor: const Color(0xffffffff),
            ),
            child: 
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  activeColor: const Color(0xffadbba8),
                  checkColor: const Color(0xff000000),
                  value: check, 
                  onChanged: (bool? value) {},
                ),
              ),
          ),
          Expanded(
            child: Container(
              height: 75,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: borderColor, width: 2),
                ),
                color: const Color(0xffffffff),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
                    Text(time, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    const SizedBox(width: 15),
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
