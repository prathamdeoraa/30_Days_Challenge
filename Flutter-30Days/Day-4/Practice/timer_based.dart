import "dart:io";

Future<void> main() async {
  // Future.delayed(Duration(seconds: 5), () => print("Time's up!"));

  stdout.write("What is your favorite color?\n");
  stdout.write("Answer: ");
  String? answer = stdin.readLineSync();

  if (answer == null || answer.isEmpty) {
    print("No answer provided.");
  } else {
    print("your answer is processing...");
    await Future.delayed(Duration(seconds: 3));
    print("Time's up! You answered: $answer");
  }
}
