# **Day 8: Advanced Layouts – Step-by-Step Practical Guide**

**Goal:** Learn how to display lists, grids, and stacked content in Flutter.

**Time Allocation (6–8 hrs)**

- **1 hr:** Learn concepts from docs/tutorial
- **3–4 hrs:** Coding exercises
- **2–3 hrs:** Mini-project: Image Grid App

---

## **Step 1: ListView Practice**

**Concept:** Vertical scrollable list of widgets.

**Code Example:**

```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = ["Apple", "Banana", "Mango", "Orange", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView Example")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.food_bank),
              title: Text(items[index]),
              trailing: Icon(Icons.arrow_forward),
            );
          },
        ),
      ),
    );
  }
}

```

**Practice:**

- Add 5–10 more items
- Change icon, color, font size

---

## **Step 2: GridView Practice**

**Concept:** Display items in a grid layout.

**Code Example:**

```
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
  ),
  itemCount: 6,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          "Item ${index + 1}",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  },
)

```

**Practice:**

- Make grid scrollable
- Add images instead of color boxes

---

## **Step 3: Stack Widget**

**Concept:** Overlay widgets on top of each other.

**Code Example:**

```
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.blue),
    Positioned(
      bottom: 10,
      right: 10,
      child: Text("Hello", style: TextStyle(color: Colors.white, fontSize: 20)),
    ),
  ],
)

```

**Practice:**

- Replace Container with an image
- Add multiple Positioned widgets

---

## **Step 4: Card & ListTile**

**Concept:** Material Design cards for better UI.

**Code Example:**

```
Card(
  elevation: 5,
  margin: EdgeInsets.all(10),
  child: ListTile(
    leading: Icon(Icons.person),
    title: Text("Pratham"),
    subtitle: Text("Flutter Learner"),
    trailing: Icon(Icons.message),
  ),
)

```

**Practice:**

- Add 3–4 cards in a ListView
- Customize color, icons, font

---

## **Step 5: Mini Project – Image Grid App**

**Goal:** Combine ListView/GridView/Stack/Card into one small app.

**Features to Implement:**

1. AppBar: Title "My Image Gallery"
2. GridView of images (2 columns)
3. Each Grid item is a **Card** with:

   - Image
   - Name of the item (Stack Text on Image)

4. Tap an item → show SnackBar with item name

**Tips for Practically Doing It:**

- Use `GridView.builder` inside `Scaffold.body`
- Wrap each Grid item in `Card` + `Stack`
- Use `GestureDetector` to detect taps

---

### **Extra Practice Ideas**

- Make Grid scrollable vertically
- Add shadow and rounded corners to Cards
- Experiment with `mainAxisAlignment` & `crossAxisAlignment` in Row/Column
- Replace icons with network images
