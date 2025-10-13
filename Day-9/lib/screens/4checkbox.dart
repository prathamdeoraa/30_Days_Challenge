import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool selectAll = false;
  var isChecked = true;
  Map<String, bool> hobbies = {
    'Coding': false,
    'Music': false,
    'Gaming': false,
    'Reading': false,
    'Traveling': false,
  };

  // Step 2️⃣ This will store selected hobbies to display
  List<String> selectedHobbies = [];

  // Step 3️⃣ Function to collect selected hobbies
  void _showSelected() {
    setState(() {
      selectedHobbies = hobbies.entries
          .where((entry) => entry.value) // keep checked ones
          .map((entry) => entry.key) // extract their names
          .toList();
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check Box Example")),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Remember me'),
            subtitle: Text('Keep me signed in'),
            value: isChecked,
            onChanged: (val) => setState(() => isChecked = val!),
            controlAffinity:
                ListTileControlAffinity.leading, // checkbox at left
          ),

          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked =
                    newValue!; // value can't be null unless tristate:true
              });
            },
          ),

          Checkbox(
            value: isChecked,
            onChanged: (v) => setState(() => isChecked = v!),
            checkColor: Colors.white,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) return Colors.green;
              return Colors.grey;
            }),
          ),

          Column(
            children: hobbies.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: hobbies[key],
                onChanged: (val) => setState(() {
                  hobbies[key] = val!;
                }),
              );
            }).toList(),
          ),

          CheckboxListTile(
            title: Text('Select all'),
            value: selectAll,
            onChanged: (val) => setState(() {
              selectAll = val!;
              hobbies.updateAll((k, v) => val);
            }),
          ),

          ElevatedButton(
            onPressed: _showSelected,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
            ),
            child: Text("Show Selected", style: TextStyle(color: Colors.black,fontSize: 16)),
          ),

          SizedBox(height: 20),

          // Step 6️⃣ Display selected hobbies
          if (selectedHobbies.isNotEmpty)
            Text(
              "Your selected hobbies:\n${selectedHobbies.join(', ')}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          else
            Text(
              "No hobbies selected yet.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

          Form(
            key: _formKey,
            child: Column(
              children: [
                CheckboxFormField(
                  title: Text('Accept Terms'),
                  validator: (val) =>
                      val == true ? null : 'You must accept terms',
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("submitted");
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget title,
    bool super.initialValue = false,
    super.onSaved,
    super.validator,
    super.key,
  }) : super(
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CheckboxListTile(
                 title: title,
                 value: state.value,
                 onChanged: state.didChange,
                 controlAffinity: ListTileControlAffinity.leading,
               ),
               if (state.hasError)
                 Padding(
                   padding: EdgeInsets.only(left: 16),
                   child: Text(
                     state.errorText!,
                     style: TextStyle(color: Colors.red),
                   ),
                 ),
             ],
           );
         },
       );
}
