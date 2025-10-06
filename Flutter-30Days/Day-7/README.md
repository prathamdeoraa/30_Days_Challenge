## 🎯 **Goal for the Day**

![alt](/day7/flutter_01.png)

By the end of today, you’ll:

- Understand how to position widgets neatly
- Add spacing, margins, padding, colors, and alignment
- Build a **Profile Card App** that looks clean and professional

---

## 🧠 **Concepts to Learn**

1. **Padding & Margin**

   ```
    Padding(
       padding: EdgeInsets.all(16),
       child: Text('Hello World'),
    );

    Container(
       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
       child: Text('With Margin'),
    );

   ```

2. **SizedBox**

   - Add space between widgets

   `SizedBox(height: 20);`

3. **Alignment & Center**

   ```
     Align(
       alignment: Alignment.centerRight,
       child: Text('Right Aligned'),
       );

   ```

4. **BoxDecoration (for Containers)**

   ```
         Container(
           decoration: BoxDecoration(
             color: Colors.blue[100],
             borderRadius: BorderRadius.circular(15),
             boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   blurRadius: 5,
                   offset: Offset(0, 3),
                 ),
             ],
           ),
         );
   ```

---

## 💻 **Practice Tasks**

**Task 1: Simple Box Layout**

- Create 3 colored containers stacked vertically
- Each with different padding, margin, and size
- Add rounded corners and shadow

**Task 2: Row & Column Alignment**

- Create a row with 3 icons spaced evenly (`MainAxisAlignment.spaceEvenly`)
- Create a column of text aligned to the left (`CrossAxisAlignment.start`)

**Task 3: Nested Layout**

- Column → Container → Row inside
- Practice combining layout widgets

---

## 🚀 **Mini Project: Profile Card App**

### **Objective**

Create a beautiful profile card UI with:

- Profile picture
- Name & description
- Social icons or buttons
- Proper spacing, colors, and alignment

### **Steps**

1. **Setup Basic Structure**
   ```
   code in main.dart file
   ```
2. **Create the ProfileCard Widget**

```
  CODE IN main.dart file
```

3. **Run and Customize**

   - Change background colors
   - Replace image with your own asset
   - Add button at the bottom: “Contact Me”

---

## 🧩 **Bonus Challenges**

- Add a **Card widget** instead of Container for elevation.
- Add an **AppBar** with title “My Profile”.
- Make it **responsive** with `MediaQuery` (adjust width on different screens).
- Add **InkWell** on icons → show snackbar (“Email tapped”).

---

## ✅ **End-of-Day Checklist**

✔️ Understands difference between Padding, Margin, and SizedBox  
✔️ Can align widgets horizontally & vertically  
✔️ Built one polished layout-based project  
✔️ Pushed project to GitHub
