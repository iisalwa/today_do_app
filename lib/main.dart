import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_do_app/tasks_page.dart';
import 'package:today_do_app/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksPage(),
      ),
    );
  }
}
