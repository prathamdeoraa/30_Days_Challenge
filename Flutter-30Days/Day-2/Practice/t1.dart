import 'dart:io';

/* Loops Practice:

    1- For loop: print 1–10 numbers

    2- While loop: sum of first N numbers

    3- Do-while loop: repeatedly ask for user input until correct

*/
void main() {
  //1 For Loop, for-in(used ike "var in list")
  for (var i = 1; i < 11; i++) {
    stdout.write("$i ");
  }

  //2 While Loop
  stdout.write("\n\nEnter a number: ");
  var n = int.parse(stdin.readLineSync()!);
  int an = n;
  int sum = 0;
  while (n > 0) {
    sum += n;
    n--;
  }

  print("\nSum of first $an numbers is: $sum");

  //3 Do-While Loop
  int number;
  do {
    stdout.write("Enter a positive number to check for prime: ");
    number = int.parse(stdin.readLineSync()!);

    if (number <= 0) {
      print("Invalid input. Number must be positive.");
    }
  } while (number <= 0);

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (var i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  if (isPrime(number)) {
    print("$number is a prime number.");
  } else {
    print("$number is not a prime number.");
  }
}
