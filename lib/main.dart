import 'package:flutter/material.dart';

class Task {
  const Task({required this.name});

  final String name;
}

typedef TaskChangedCallback = Function(Task task, bool finished);

class CollegeTaskITem extends StatelessWidget {
  CollegeTaskITem({
    required this.task,
    required this.finished,
    required this.onTaskChanged,
  }) : super(key: ObjectKey(task));

  final Task task;
  final bool finished;
  final TaskChangedCallback onTaskChanged;

  Color _getColor(BuildContext context) {

    return finished //
        ? Colors.black54
        : Theme.of(context).secondaryHeaderColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!finished) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTaskChanged(task, finished);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(task.name[0]),
      ),
      title: Text(
        task.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class CollegeTask extends StatefulWidget {
  const CollegeTask({required this.tasks, Key? key}) : super(key: key);

  final List<Task> tasks;

  @override
  _CollegeTaskState createState() => _CollegeTaskState();
}

class _CollegeTaskState extends State<CollegeTask> {
  final _collegeTask = <Task>{};

  void _handleCartChanged(Task task, bool finished) {
    setState(() {
      if (!finished) {
        _collegeTask.add(task);
      } else {
        _collegeTask.remove(task);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Kuliah',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.tasks.map((Task task) {
          return CollegeTaskITem(
            task: task,
            finished: _collegeTask.contains(task),
            onTaskChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Tugas Kuliah',
    home: CollegeTask(
      tasks: [
        Task(name: 'Pemrograman Web Enterprise'),
        Task(name: 'Pemrograman Mobile'),
        Task(name: 'Sistem Basis Data'),
        Task(name: 'Bahasa Indonesia'),
        Task(name: 'Sistem Informasi Manajemen'),
      ],
    ),
  ));
}
