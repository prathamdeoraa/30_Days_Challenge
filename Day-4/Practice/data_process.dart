
Future<void> main() async {
  print("Program started...");

  // Example 1: Simulate downloading data
  String data = await fetchData();
  print("Data received: $data");

  // Example 2: Do something else while waiting
  print("Now processing data...");
  await Future.delayed(Duration(seconds: 2));
  print("Processing finished!");
}

// A function that simulates fetching data from the internet
Future<String> fetchData() async {
  print("Fetching data...");
  // Wait for 3 seconds (simulate network delay)
  await Future.delayed(Duration(seconds: 3));
  return "Server Response: Hello from API!";

}