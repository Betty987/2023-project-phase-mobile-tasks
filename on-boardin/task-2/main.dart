import 'dart:io';

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task(this.title, this.description, this.dueDate, [this.isCompleted = false]);

  void markAsCompleted() {
    isCompleted = true;
  }

  void editTask(String newTitle, String newDescription, DateTime newDueDate) {
    title = newTitle;
    description = newDescription;
    dueDate = newDueDate;
  }

  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: $dueDate\nCompleted: $isCompleted';
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void viewTasks() {
    for (var i = 0; i < tasks.length; i++) {
      print('Task #$i\n${tasks[i]}\n');
    }
  }

  void editTask(int index, String newTitle, String newDescription, DateTime newDueDate) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].editTask(newTitle, newDescription, newDueDate);
    } else {
      print('Invalid task index.');
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      print('Task deleted.');
    } else {
      print('Invalid task index.');
    }
  }

  void markTaskAsCompleted(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].markAsCompleted();
      print('Task marked as completed.');
    } else {
      print('Invalid task index.');
    }
  }
}

void main() {
  final taskManager = TaskManager();

  while (true) {
    print('Task Manager Menu:');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Edit Task');
    print('4. Delete Task');
    print('5. Mark Task as Completed');
    print('6. Quit');

    stdout.write('Enter your choice (1-6): ');
    final choice = int.tryParse(stdin.readLineSync());

    if (choice == null || choice < 1 || choice > 6) {
      print('Invalid choice. Please try again.');
      continue;
    }

    switch (choice) {
      case 1:
        stdout.write('Enter task title: ');
        final title = stdin.readLineSync();
        stdout.write('Enter task description: ');
        final description = stdin.readLineSync();
        stdout.write('Enter due date (yyyy-mm-dd): ');
        final dueDateStr = stdin.readLineSync();
        final dueDate = DateTime.tryParse(dueDateStr);
        if (dueDate == null) {
          print('Invalid date format.');
          continue;
        }
        final task = Task(title!, description!, dueDate);
        taskManager.addTask(task);
        print('Task added successfully.');
        break;

      case 2:
        taskManager.viewTasks();
        break;

      case 3:
        stdout.write('Enter the task index to edit: ');
        final index = int.tryParse(stdin.readLineSync());
        if (index == null) {
          print('Invalid index.');
          continue;
        }
        stdout.write('Enter new task title: ');
        final newTitle = stdin.readLineSync();
        stdout.write('Enter new task description: ');
        final newDescription = stdin.readLineSync();
        stdout.write('Enter new due date (yyyy-mm-dd): ');
        final newDueDateStr = stdin.readLineSync();
        final newDueDate = DateTime.tryParse(newDueDateStr);
        if (newDueDate == null) {
          print('Invalid date format.');
          continue;
        }
        taskManager.editTask(index, newTitle!, newDescription!, newDueDate);
        break;

      case 4:
        stdout.write('Enter the task index to delete: ');
        final index = int.tryParse(stdin.readLineSync());
        if (index == null) {
          print('Invalid index.');
          continue;
        }
        taskManager.deleteTask(index);
        break;

      case 5:
        stdout.write('Enter the task index to mark as completed: ');
        final index = int.tryParse(stdin.readLineSync());
        if (index == null) {
          print('Invalid index.');
          continue;
        }
        taskManager.markTaskAsCompleted(index);
        break;

      case 6:
        print('Goodbye!');
        return;
    }
  }
}

