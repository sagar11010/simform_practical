import 'package:flutter/material.dart';
import 'package:interview_task/di/injector_provider.dart';
import 'package:interview_task/feature/user_list/view/user_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}
