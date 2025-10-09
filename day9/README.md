## 🎯 **Goal**

Learn how to take user input, validate it, and trigger actions (like login) when input is valid.

---

## 🧱 **Core Widgets to Practice**

Let’s break them down simply with short examples 👇

---

### 🧩 1. **TextField**

Used to get raw input from the user.

```
TextField(
  decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder(),
  ),
)

```

- `decoration:` adds label, hint, and border.
- Not ideal for validation — better use `TextFormField` for that.

---

### 🧩 2. **TextFormField**

Used **inside a Form** for easy validation.

```
Form(
  key: _formKey,
  child: TextFormField(
    decoration: InputDecoration(labelText: 'Email'),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
      return null;
    },
  ),
)

```

- **validator()** returns a string if invalid (shows error below input).
- `_formKey.currentState!.validate()` runs all validators.

---

### 🧩 3. **DropdownButton**

```
String? selectedCity;

DropdownButton<String>(
  value: selectedCity,
  hint: Text('Select City'),
  items: ['Mumbai', 'Delhi', 'Pune'].map((city) {
    return DropdownMenuItem(value: city, child: Text(city));
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedCity = value!;
    });
  },
)

```

---

### 🧩 4. **Checkbox**

```
bool isChecked = false;

CheckboxListTile(
  title: Text("Remember Me"),
  value: isChecked,
  onChanged: (newValue) {
    setState(() {
      isChecked = newValue!;
    });
  },
)

```

---

### 🧩 5. **Radio Button**

```
String gender = 'male';

Column(
  children: [
    RadioListTile(
      title: Text('Male'),
      value: 'male',
      groupValue: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    ),
    RadioListTile(
      title: Text('Female'),
      value: 'female',
      groupValue: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    ),
  ],
)

```

---

## 🧮 **6. Button Validation Example**

```
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      print("Form is valid!");
    }
  },
  child: Text('Login'),
)

```

---

## 🚀 **Mini Project: Simple Login Form**

Here’s a complete example 👇  
Copy–paste this into your Flutter app (main.dart).

```
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SimpleLoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SimpleLoginPage extends StatefulWidget {
  @override
  _SimpleLoginPageState createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Print to console
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email cannot be empty';
                  if (!value.contains('@'))
                    return 'Please enter a valid email';
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password cannot be empty';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---

## 🧠 **What You’ll Learn Practically**

- Handle user input
- Validate data before submission
- Show error messages
- Use multiple form fields together
- Display results in console

---

If you want, I can give you a **“Day 9 Practice Challenge”** after this (like signup form or feedback form with dropdowns & checkboxes).  
Would you like me to add that next?

##### You said:

1. TextField in detail step by step to learn

###### ChatGPT said:

Thought for 45s

Great — let’s deep-dive into **TextField** step-by-step so you really understand how it works and can apply it in real apps. I’ll explain concepts, show tiny runnable snippets, and finish with a full example and practice exercises. 🚀

# 1. What is `TextField`?

`TextField` is the basic widget to accept text input from the user. It’s low-level (no built-in form validation). For form validation use `TextFormField` inside a `Form` — I’ll note differences where relevant.

---

# 2. Minimal / Basic `TextField`

```
TextField(
  decoration: InputDecoration(
    labelText: 'Name',
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
)

```

- `decoration` controls label, hint, icons, border.
- Works without controller — returns text via `onChanged`/`onSubmitted`.

---

# 3. Using a `TextEditingController` (recommended)

Controller gives direct programmatic access to the field value and lets you clear or set text.

```
final _controller = TextEditingController();

// in build:
TextField(
  controller: _controller,
  decoration: InputDecoration(labelText: 'Email'),
)

// read value:
print(_controller.text);

// don't forget:
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

```

---

# 4. Respond to input: `onChanged`, `onSubmitted`, listeners`

- `onChanged` fires on every keystroke.
- `onSubmitted` fires when user presses action (e.g., done).
- Controller can also have `addListener`.

```
TextField(
  controller: _controller,
  onChanged: (value) { print('current: $value'); },
  onSubmitted: (value) { print('submitted: $value'); },
)

```

Or:

```
_controller.addListener(() {
  print('controller value: ${_controller.text}');
});

```

---

# 5. Keyboard type & action

Control the keyboard and the action button on keyboard:

```
TextField(
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next, // shows "Next" on the keyboard
  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
)

```

---

# 6. Obscure text (password) + visibility toggle

```
bool _obscure = true;

TextField(
  obscureText: _obscure,
  decoration: InputDecoration(
    labelText: 'Password',
    suffixIcon: IconButton(
      icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      onPressed: () => setState(() => _obscure = !_obscure),
    ),
  ),
)

```

---

# 7. InputFormatters (restrict input)

```
import 'package:flutter/services.dart';

TextField(
  keyboardType: TextInputType.number,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ],
  decoration: InputDecoration(labelText: 'Phone'),
)

```

You can also write a custom formatter (e.g., uppercase):

```
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

```

---

# 8. Multi-line text

```
TextField(
  keyboardType: TextInputType.multiline,
  minLines: 3,
  maxLines: 6, // or null for unlimited
  decoration: InputDecoration(labelText: 'Bio'),
)

```

---

# 9. Decoration details: label, hint, prefix/suffix, counter

- `labelText` floats when focused.
- `hintText` shows placeholder when empty.
- `prefixIcon`, `prefixText`, `suffixIcon`, `suffixText`.
- `maxLength` shows built-in counter (can customize `buildCounter`).

Example with clear button:

```
final _nameController = TextEditingController();

@override
void initState() {
  super.initState();
  _nameController.addListener(() => setState(() {})); // updates UI for clear icon
}

TextField(
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Name',
    suffixIcon: _nameController.text.isNotEmpty
      ? IconButton(onPressed: () => _nameController.clear(), icon: Icon(Icons.clear))
      : null,
  ),
)

```

---

# 10. Focus management (FocusNode)

Use `FocusNode` to move focus between fields or to request/unfocus keyboard.

```
final _emailFocus = FocusNode();
final _passwordFocus = FocusNode();

TextField(
  focusNode: _emailFocus,
  textInputAction: TextInputAction.next,
  onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
);

TextField(
  focusNode: _passwordFocus,
  textInputAction: TextInputAction.done,
  onSubmitted: (_) => FocusScope.of(context).unfocus(), // hide keyboard
);

```

Dispose focus nodes in `dispose()`.

---

# 11. Read-only fields & pickers

Sometimes you want a field to open a date/time picker:

```
TextField(
  controller: _dateController,
  readOnly: true,
  onTap: () async {
    DateTime? picked = await showDatePicker(...);
    if (picked != null) _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
  },
)

```

(You may need `intl` for `DateFormat`.)

---

# 12. Styling text & cursor

```
TextField(
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  cursorWidth: 2,
  cursorRadius: Radius.circular(2),
  cursorColor: Colors.blue,
)

```

---

# 13. Autofill & accessibility

- Use `autofillHints: [AutofillHints.email]` for better autofill on devices.
- For accessibility, add `semanticsLabel` in decoration if needed.

```
TextField(
  autofillHints: [AutofillHints.email],
)

```

---

# 14. TextField vs TextFormField

- `TextField` = general input.
- `TextFormField` = integrates with `Form` and `validator` (preferred for structured form validation).  
   Example validator:

```
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) return 'Required';
    return null;
  },
)

```

---

# 15. Performance & best practices

- Dispose `TextEditingController` and `FocusNode`.
- Avoid many controllers in long lists — consider `onChanged` and only store data when needed.
- Use `SingleChildScrollView`/`ListView` or `resizeToAvoidBottomInset` to avoid keyboard hiding inputs.
- Use `TextInputAction.next` + focus nodes for better UX.
- Prefer `TextFormField` inside `Form` for validation flows.

---

# 16. Common pitfalls & debugging tips

- Forgetting `dispose()` → memory leak.
- Keyboard covering fields → wrap column with `SingleChildScrollView` + `Padding` or use `Scaffold` with `resizeToAvoidBottomInset: true`.
- Not updating UI on controller change → add listener or use `ValueListenableBuilder`.
- Using `obscureText` but forgetting to rebuild state when toggling visibility.

---

# 17. Full demo page (copy-paste runnable)

```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: TextFieldDemo()));

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  bool _obscure = true;
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('Phone: ${_phoneController.text}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check console for values')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
              suffixIcon: _nameController.text.isNotEmpty
                  ? IconButton(onPressed: () => _nameController.clear(), icon: Icon(Icons.clear))
                  : null,
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
            autofillHints: [AutofillHints.email],
          ),
          SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
            obscureText: _obscure,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone',
              prefixText: '+91 ',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
          ),
          SizedBox(height: 18),
          ElevatedButton(onPressed: _submit, child: Text('Submit')),
        ]),
      ),
    );
  }
}

```

---

# 18. Practice tasks (try these)

1. Create a TextField for email with `keyboardType: TextInputType.emailAddress` and show a `SnackBar` on submit.
2. Build a password field with visibility toggle and `minLength` check; show error `SnackBar` if too short.
3. Build a phone input with only digits and limit to 10 digits.
4. Create a multi-line "Bio" TextField with `minLines: 3` and a char count using `maxLength`.
5. Make a read-only field that opens a date picker when tapped and fills the chosen date.
