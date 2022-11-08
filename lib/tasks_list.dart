import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_do_app/task_data.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return taskData.tasks.isEmpty
            ? const Center(
                child: Text("No Tasks", style: TextStyle(fontSize: 20)))
            : ListView.builder(
                itemCount: taskData.tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      background: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.redAccent,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            taskData.tasks[index].title,
                            style: TextStyle(
                                decoration: taskData.tasks[index].isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ),
                        trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          activeColor: Color.fromARGB(245, 94, 65, 112),
                          value: taskData.tasks[index].isDone,
                          onChanged: (newValue) {
                            taskData.updateTask(taskData.tasks[index]);
                          },
                        ),
                      ),
                      onDismissed: (direction) {
                        taskData.deleteTask(taskData.tasks[index]);
                      });
                },
              );
      },
    );
  }
}
