/*
Mini Challenge: 
  1- Console Todo List
  2- Add 3 tasks to a list
  3- Display all tasks
  4- Mark one as completed
*/

/*

Sample Output:

--- Todo List ---
Enter options to do:
1. Add Task
2. Remove Task
3. Mark Task as Completed
4. List Tasks
5. Quit
Choose an option (1-5): 

*/


import 'dart:io';

void addTask(String task, List<String> tasks) {
  if (task.isNotEmpty) {
    tasks.add(task);
    print('\n');
  } else {
    print("Enter the valid task.");
  }
}

void removeTask(int index, List<String> tasks) {
  if (index >= 0 && index < tasks.length) {
    print("Removed task: ${index + 1} : ${tasks[index]}");
    tasks.removeAt(index);
    print('\n');
  } else {
    print("Invalid task number.");
  }
}

void completedTask(int index, List<String> tasks) {
  if (index >= 0 && index < tasks.length) {
    print("Marked task ${index + 1} as completed.");
    tasks[index] += ' (Completed)';
    print('\n');
  } else {
    print("Invalid task number.");
  }
}

void main() {
  List<String> tasks = [];

  while (true) {
    stdout.writeln('--- Todo List ---');
    stdout.write(
      "Enter options to do:\n1. Add Task\n2. Remove Task\n3. Mark Task as Completed\n4. List Tasks\n5. Quit\nChoose an option (1-5): ",
    );
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1' || 'add' || 'Add' || 'ADD':
        stdout.write('\nEnter a task: ');
        String? task = stdin.readLineSync();
        if (task != null) {
          addTask(task, tasks);
        }
        break;
      case '2' || 'remove' || 'Remove' || 'REMOVE':
        if (tasks.isEmpty) {
          print('No tasks to remove.');
        } else {
          stdout.write('Enter the number of the task to remove: ');
          int? index = int.tryParse(stdin.readLineSync() ?? '');
          if (index != null) {
            removeTask(index - 1, tasks);
          } else {
            print('Invalid input.');
          }
        }
        break;
      case '3':
        if (tasks.isEmpty) {
          print('No tasks to mark as completed.');
        } else {
          stdout.write('\nEnter the number of the task to mark as completed: ');
          int? index = int.tryParse(stdin.readLineSync() ?? '');
          if (index != null) {
            completedTask(index - 1, tasks);
          } else {
            print('Invalid input.');
          }
        }
        break;
      case '4' || 'list' || 'List' || 'LIST':
        if (tasks.isEmpty) {
          print('No tasks added.');
        } else {
          print('\nYour Tasks: ');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}- ${tasks[i]}');
          }
          print('\n');
        }
        break;
      case '5' || 'q' || 'Q' || 'quit' || 'QUIT':
        print('Exiting Todo List. Goodbye!');
        return;
      default:
        print('Invalid option. Please choose a number between 1 and 5.');
    }
  }
}
