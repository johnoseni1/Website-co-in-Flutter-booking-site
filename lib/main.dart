import 'package:book_now/screens/login_screen.dart';
import 'package:flutter/material.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book domains',
      theme: ThemeData(
        primarySwatch: Colors.green ,
      ),
      home: LoginScreen(),

    );
  }
}
