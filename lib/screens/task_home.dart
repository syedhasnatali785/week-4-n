import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TaskScreen());
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("To-Do App")),
      body: Column(
        children: [
          TextField(controller: controller),
          ElevatedButton(
            onPressed: () {
              provider.addTask(controller.text);
              controller.clear();
            },
            child: const Text("Add Task"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.deleteTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
