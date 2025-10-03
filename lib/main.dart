import 'package:flutter/material.dart';
import 'package:flutter_task/todo_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TodoTask(),
    );
  }
}

/// Section 4 Task

// void main() {
//   List<Map<String,dynamic>> users = [
//     {
//       "id": 1,
//      "name": "Rahul"
//      },
//     {
//       "id": 2,
//      "name": "Ankit"
//      },
//     {
//       "id": 3,
//      "name": "Neha"
//      },
//     {
//       "id": 4,
//      "name": "Aditi"
//      }
//   ];
  
//   List<String> names = users.map((item) => item['name'] as String).toList();
  
//   names.sort();
  
//   print(names);
// }
