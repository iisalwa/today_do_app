import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_do_app/add_task_page.dart';
import 'package:today_do_app/task_data.dart';
import 'package:today_do_app/tasks_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'TodayDo',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskPage((newTaskTitle) {}),
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 94, 65, 112),
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 196, 217, 196),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<TaskData>(builder: (context, taskData, child) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  '${Provider.of<TaskData>(context).doneTasks} / ${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              );
            }),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
