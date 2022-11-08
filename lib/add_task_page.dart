import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_do_app/task_data.dart';

class AddTaskPage extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskPage(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 94, 65, 112),
                fontWeight: FontWeight.bold,
              )),
          TextField(
            cursorColor: Colors.black87,
            decoration: InputDecoration(
              focusedBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, width: 1),
              ),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 94, 65, 112),
              primary: Colors.white,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
