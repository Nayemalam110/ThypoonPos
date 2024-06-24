import 'package:flutter/material.dart';
import 'package:typhoon_pos/common/database/dbhelper.dart';
import 'package:typhoon_pos/features/items/model/item_model.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController _categoryController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String categoryName = _categoryController.text.trim();
                if (categoryName.isNotEmpty) {
                  Category category = Category(name: categoryName);
                  await dbHelper.insertCategory(category);
                  Navigator.pop(
                      context, true); // Return to previous page with result
                }
              },
              child: Text('Add Category'),
            ),
          ],
        ),
      ),
    );
  }
}
