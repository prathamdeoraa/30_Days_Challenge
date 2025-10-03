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

void main() {
  stdout.writeln('--- Todo List ---');

  //stdout.write('Add Task');

  List<String> tasks = [];
  while (true) {
    stdout.write('Enter a task (or type "done" or "q" to finish): ');
    String? task = stdin.readLineSync();
    if (task == null ||
        task.toLowerCase() == 'done' ||
        task.toLowerCase() == 'q') {
      break;
    }
    if (task.isNotEmpty) {
      tasks.add(task);
    } else {
      print('Please enter a valid task.');
    }
  }

  if (tasks.isEmpty) {
    print('No tasks added.');
    return;
  } else {
    print('\nYour Tasks:');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}- ${tasks[i]}');
    }

    stdout.write('Enter the number of the task to mark as completed: ');
    String? input = stdin.readLineSync();
    int? taskNumber = int.tryParse(input ?? '');
    if (taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length) {
      tasks[taskNumber - 1] += ' (Completed)';
      print('\nUpdated Task List:');
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}- ${tasks[i]}');
      }
    } else {
      print('Invalid task number.');
    }
  }
}
