import 'package:flutter/material.dart';
import 'package:lessoncredit/screens/cart_screen.dart';
import 'package:lessoncredit/screens/lesson_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       routes: {"/":(BuildContext context) => LessonListScreen(),
         "/cart":(BuildContext context) => CartScreen(),
         },
       initialRoute: "/",

     );
  }
}
