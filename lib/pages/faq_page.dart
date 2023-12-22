import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage ({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 167, 137, 1),
        elevation: 0,
        title: const Text('FAQ')
      ),
      body: 
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(235, 243, 232, 1)
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('FAQ here'),
                  )
                ],
              ),
                ),
          ),
        ));
  }
}