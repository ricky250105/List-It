import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:list_it/Components/to_do_card_widget.dart';
import 'package:list_it/pages/about_page.dart';
import 'package:list_it/pages/add_task.dart';
import 'package:list_it/pages/terms_and_condition.dart';
import 'package:list_it/provider/service_provider.dart';

class HomePage extends ConsumerWidget {
   HomePage ({super.key});


final user = FirebaseAuth.instance.currentUser!;

//sign user out method
void signUserOut() {
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3E8),
      appBar: AppBar(
        title:  Text("Welcome, ${user.email!}!", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        backgroundColor:  const Color(0xFFd3dad0),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)), 
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active)),
          ]
      ),
      drawer: Drawer(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
            const SizedBox(height: 70),
            const Icon(Icons.check_box, size: 64),
            const Center(child: Text("username")),
            

            // user settings
            const SizedBox(height: 70),
            GestureDetector( onTap:  () {},
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 15),
                  Text("Account Settings")
                ],
              ),
            ),

            // terms and condition
            const SizedBox(height: 50),
            GestureDetector( onTap:() {
              Navigator.push(context, 
                 MaterialPageRoute(builder: (context) {
                    return const TermsAndConditionPage();
                  }));
            },
              child: const Row(
                children: [
                  Icon(Icons.assignment),
                  SizedBox(width: 15),
                  Text("Terms and conditions")
                ],
              ),
            ),

            const SizedBox(height: 15),
            GestureDetector( onTap:() {
              Navigator.push(context, 
                 MaterialPageRoute(builder: (context) {
                    return const AboutPage();
                  }));
            },
              child: const Row(
                children: [
                  Icon(Icons.explore),
                  SizedBox(width: 15),
                  Text("About Us")
                ],
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector( onTap:() {},
              child: const Row(
                children: [
                  Icon(Icons.question_mark),
                  SizedBox(width: 15),
                  Text("FAQ")
                ],
              ),
            ),

            const SizedBox(height: 15),
            GestureDetector( onTap:() {},
              child: const Row(
                children: [
                  Icon(Icons.question_mark),
                  SizedBox(width: 15),
                  Text("Help")
                ],
              ),
            ),

            const SizedBox(height: 50),
            GestureDetector( onTap:() {signUserOut();},
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 15),
                  Text("Sign Out")
                ],
              ),
            ),
            ],
          ),
        )
      ),


      body: 
       SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(235, 243, 232, 1),
            ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today, ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          Text ('14th December, 2023', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                        ],
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) {
                            return AddTask();
                      }));
                      }, 
                      
                      style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromRGBO(178, 200, 186, 1),    
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),),
                      fixedSize: const Size.fromHeight(50),  
                      ),

                      child: const Center(child: Text(' + add task', 
                      style: TextStyle(color: Color(0xff000000), fontSize: 16, )))),
                    ],
                  ),
                  const Gap(20),
                  ListView.builder(
                    itemCount: todoData.value!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ToDoCardWidget(getIndex: index,),
                  )


                ],
              ),
            ),
        ),
      )
        );
  }
}