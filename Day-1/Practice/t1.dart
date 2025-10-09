// Mini Challenge: Write a program that:

//1.  Takes two numbers as input

//2.  Prints sum, difference, product, and division
import 'dart:io';

// num parseInput(String input) {
//   // If input contains '.', treat as double; else int
//   return input.contains('.') ? double.parse(input) : int.parse(input);
// }

num parseInput(String input) {
  return input.contains('.') ? double.parse(input) : int.parse(input); // Fixed
}

num formatResult(num result) {
  if (result is double && result % 1 != 0) {
    return result; // keep 2 decimals
  } else {
    return result.toInt(); // show as integer
  }
}

String formatResultDisplay(num result) {
  return (result % 1 == 0) ? result.toInt().toString() : result.toStringAsFixed(2);
}

void main() {
  stdout.write("Enter first digit:");
  num  a = parseInput(stdin.readLineSync()!);

  List operand = ['+', '-', '*', '/'];
  print("Available operations:");
  for (int i = 1; i <= operand.length; i++) {
    print("$i: ${operand[i - 1]}");
  }
  stdout.write("Select operation (1-4):");
  int i = int.parse(stdin.readLineSync()!);
  if (i < 1 || i > operand.length) {
    print("Invalid operation selected.");
    return;
  }

  stdout.write("Enter second digit:");
  num b = parseInput(stdin.readLineSync()!);

  // stdout.write("Enter operation (+, -, *, /):");
  // String op = stdin.readLineSync()!;

  num result = 0;
  switch (operand[i - 1]) {
    case '+':
    result = a + b;
      break;
    case '-':
      result = a - b;
      break;
    case '*':
      result = a * b;
      break;
    case '/':
      if (b != 0) {
        result =  a / b;
      } else {
        print("Error: Division by zero is not allowed.");
      }
      break;
    default:
      print("Invalid operation");
  }

  print(  "Result: ${formatResult(result)}");

  // switch(operand){
  //   case ['+','-','*','/']:
  //     print("Sum: ${(a + b).toStringAsFixed(2)}");
  //     print("Difference: ${(a - b).toStringAsFixed(2)}");
  //     print("Product: ${(a * b).toStringAsFixed(2)}");
  //     print("Division: ${(a / b).toStringAsFixed(2)}");
  //     break;
  //   default:
  //     print("Invalid operation");

  // }

  // switch (op) {
  //   case '+':
  //     print("Sum: ${(a + b).toStringAsFixed(2)}");
  //     break;
  //   case '-':
  //     print("Difference: ${(a - b).toStringAsFixed(2)}");
  //     break;
  //   case '*':
  //     print("Product: ${(a * b).toStringAsFixed(2)}");
  //     break;
  //   case '/':
  //     print("Division: ${(a / b).toStringAsFixed(2)}");
  //     break;
  //   default:
  //     print("Invalid operation");
  // }
}
