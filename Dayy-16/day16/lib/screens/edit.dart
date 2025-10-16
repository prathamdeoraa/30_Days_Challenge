import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black38,
        title: Text("Add Todo"),
      ),

      body: SingleChildScrollView(
        child: Form(
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    // labelText: "Title",
                    hintText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    // labelText: 'Description',
                    hintText: "Add Todo Description",
                    border: OutlineInputBorder(),
                  ),
                  minLines: 5,
                  maxLines: 8,
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width * 0.4,
                          0,
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width * 0.4,
                          0,
                        ),
                      ),
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void submit() async {
    //get the data
    final title = titleController.text;
    final description = titleController.text;

    //body and header intialization
    final body = {
      'title': title,
      'description': description,
      'isComplete': false,
    };
    final header = {'Content-Type': 'application/json'};

    //making json body for post
    final json = jsonEncode(body);

    //submit data to server
    final url = "https://api-nodejs-todolist.herokuapp.com/task";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: json, headers: header);

    //show success or fail message based on submission status
    print(response.statusCode);
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
  }
}
