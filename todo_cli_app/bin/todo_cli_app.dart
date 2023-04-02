// Todo class with a title, description, and isDone property
import 'dart:io';

class Todo {
  String title;
  String description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}

// todoList variable as a List of Todo objects
List<Todo> todoList = [];

// Function to add a new Todo object to the todoList
void addTodo(String title, String description) {
  todoList.add(Todo(title, description, false));
}

// showTodoList function that loop through the todoList and print the title, 
//description and status of each Todo object
void showTodoList() {
  for (var todo in todoList) {
    print('Title: ${todo.title}');
    print('Description: ${todo.description}');
    print('Status: ${todo.isDone ? 'Done' : 'Not Done'}');
    print('-------------------');
  }
}

// markTodoAsDone function that mark a todo as done
void markTodoAsDone(String title) {
  for (var todo in todoList) {
    if (todo.title == title) {
      todo.isDone = true;
    }
  }
}

// keep getting the user input until the user choose to exit the app
bool isRunning = true;

// main 

void main(List<String> args) {
  // welcome message
  print('Welcome to the Todo CLI App');

  while (isRunning) {
  // show the menu
  print('1. Add Todo');
  print('2. Show Todo List');
  print('3. Mark Todo as Done');
  print('4. Exit');
  // ask the user to choose an option
  print('Choose an option: ');
  // read the user input
  var input = stdin.readLineSync();
  // check the user input
  if (input == '1') {
    // ask the user to enter the title
    print('Enter the title: ');
    // read the user input
    var title = stdin.readLineSync();
    // ask the user to enter the description
    print('Enter the description: ');
    // read the user input
    var description = stdin.readLineSync();
    // add the todo
    addTodo(title!, description!);
    // show the todo list
    showTodoList();
  } else if (input == '2') {
    // show the todo list
    showTodoList();
  } else if (input == '3') {
    // ask the user to enter the title
    print('Enter the title: ');
    // read the user input
    var title = stdin.readLineSync();
    // mark the todo as done
    markTodoAsDone(title!);
    // show the todo list
    showTodoList();
  } else if (input == '4') {
    // set isRunning to false to exit the loop
    isRunning = false;
    // exit the app
    exit(0);
  }
  }
}