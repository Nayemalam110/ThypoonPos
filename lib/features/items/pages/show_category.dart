import 'package:flutter/material.dart';
import 'package:typhoon_pos/common/database/dbhelper.dart';
import 'package:typhoon_pos/features/items/model/item_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShowCategoriesPage extends StatefulWidget {
  @override
  _ShowCategoriesPageState createState() => _ShowCategoriesPageState();
}

class _ShowCategoriesPageState extends State<ShowCategoriesPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  late List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    refreshCategories();
  }

  Future<void> refreshCategories() async {
    List<Category> categoriesList = await dbHelper.getCategories();
    setState(() {
      categories = categoriesList;
    });
  }

  Future<void>? _deleteCategory(Category category) async {
    await dbHelper.deleteCategory(category.id!);
    await refreshCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        elevation: .5,
        shadowColor: Colors.black,
        // backgroundColor: Colors.black,
      ),
      body: categories.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category category = categories[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => _deleteCategory(category),
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      )
                    ],
                  ),
                  //actionExtentRatio: 0.25,
                  child: ListTile(
                    title: Text(category.toCamelCase()),
                    // Add any additional UI elements or actions here
                  ),
                );
              },
            ),
    );
  }
}
