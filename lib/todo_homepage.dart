import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_project/todo_provider.dart';

class todoAPPProject extends StatefulWidget {
  const todoAPPProject({super.key});

  @override
  State<todoAPPProject> createState() => _todoAPPProjectState();
}

class _todoAPPProjectState extends State<todoAPPProject> {
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 68, 169),
        title: Text(
          "Todo App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return todoProvider.taskList.isEmpty
              ? Center(child: Text("No tasks sdded yet"))
              : ListView.builder(
                  itemCount: todoProvider.taskList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: todoProvider.taskList[index]['isDone'],
                        onChanged: (value) {
                          todoProvider.toggleTask(index);
                        },
                      ),
                      title: Text(
                        todoProvider.taskList[index]['task'],
                        style: TextStyle(
                          decoration: todoProvider.taskList[index]['isDone']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(onPressed: (){
                        todoProvider.removeTask(index);
                      }, icon: Icon(Icons.delete)),
                    );
                  },
                );
        },
      ),
         floatingActionButton :FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: taskController,
                          decoration: InputDecoration(
                            hintText: "Enter the task",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (taskController.text.isNotEmpty) {
                                Provider.of<TodoProvider>(
                                  context,
                                  listen: false,
                                ).addTask(taskController.text);
                                taskController.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text("+"),
        ),
      
    );
  }
}
