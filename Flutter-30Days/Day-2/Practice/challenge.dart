// Create a multiplication table program

import 'dart:io';

void main() {
  stdout.write("Enter a number to generate its multiplication table: ");
  var n = int.parse(stdin.readLineSync()!);

  print("\nMultiplication Table of $n:");

  for (int i = 1; i <= 10; i++) {
    int result = n * i;
    print("$n x $i = $result");
  }
}
