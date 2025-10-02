// SELF MADE CXALCULATOR


// + - / x
// secomd number is 0 while divide print error
import 'dart:io';

//function to parse input as int or double
num parseInput(String input) {
  return input.contains('.') ? double.parse(input) : int.parse(input); // Fixed
}

String formatResultDisplay(num result) {
  return (result % 1 == 0) ? result.toInt().toString() : result.toStringAsFixed(3);
}

void main() {
  stdout.write("Enter first Digit: ");
  num a = parseInput(stdin.readLineSync()!);

  stdout.write("Enter Second Digit: ");
  num b = parseInput(stdin.readLineSync()!);

stdout.write("Enter operation (+, -, x, /): ");
  switch (stdin.readLineSync()!) {
    case '+':
      print("Sum: ${formatResultDisplay(a + b)}");
      break;
    case '-':
      print("Subtraction: ${formatResultDisplay(a - b)}");
      break;
    case 'x':
      print("Multiplication: ${formatResultDisplay(a * b)}");
      break;
    case '/':
      if (b != 0) {
        print("Division: ${formatResultDisplay(a / b)}");
      } else {
        print("Error: Division by zero is not allowed.");
      }
      break;
    default:
      print("Invalid operation");
  }
}
