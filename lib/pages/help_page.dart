import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage ({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 167, 137, 1),
        elevation: 0,
        title: const Text('Help')
      ),
      body: 
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  buildTextField(title: 'to', controller: controllerTo),
                  buildTextField(title: 'Subject', controller: controllerSubject),
                  buildTextField(title: 'Message', controller: controllerMessage, maxLines: 8),

                  const SizedBox(height: 32),
                  ElevatedButton(onPressed: () => launchEmail(
                    toEmail: controllerTo.text,
                    subject: controllerSubject.text,
                    message: controllerMessage.text
                  ), child: const Text('send', style: TextStyle(color: Color.fromRGBO(178, 200, 186, 1)),))
                ],
              )
            ),
          ),
        ));
  }
}

Future launchEmail ({
  required String toEmail,
  required String subject,
  required String message,
}) async {
  final url = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}';
}

Column buildTextField({
  required String title,
  required TextEditingController controller,
  int maxLines = 1,
}) => 
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      SizedBox(height: 8),
      TextField(controller: controller, maxLines: maxLines, decoration: InputDecoration(border: OutlineInputBorder()),)
    ],
  );