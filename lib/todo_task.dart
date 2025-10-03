import 'package:flutter/material.dart';

/// Section 3 Task
class TodoTask extends StatefulWidget {
  const TodoTask({super.key});

  @override
  State<TodoTask> createState() => _TodoTask();
}

class _TodoTask extends State<TodoTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> todoDatas = [];

  TextEditingController taskEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TodoTask")),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.trim() == "") {
                            return 'Enter Task';
                          }
                          return null;
                        },
                        controller: taskEditor,
                        decoration: InputDecoration(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (taskEditor.text.trim().isEmpty) return;
                          setState(() {
                            Map<String, dynamic> data = {
                              'id': DateTime.now().millisecond,
                              'todo': taskEditor.text,
                              'completion': false,
                            };
                            todoDatas.add(data);
                            taskEditor.clear();
                          });
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: todoDatas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.amber,
                    leading: Text("${index + 1}"),
                    title: Text(
                      "${todoDatas[index]['todo']}",
                      style: TextStyle(
                        color: todoDatas[index]['completion']
                            ? Colors.grey
                            : Colors.black,
                        decoration: todoDatas[index]['completion']
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: todoDatas[index]['completion'],
                      onChanged: (v) {
                        setState(() {
                          todoDatas[index]['completion'] = v;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
