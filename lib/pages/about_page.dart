import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage ({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 167, 137, 1),
        elevation: 0,
        title: const Text ('About Us')
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
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('About our app and our company here'),
                  )
                ],
              ),
                ),
          ),
        ));
  }
}