import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typhoon_pos/features/items/pages/add_category.dart';
import 'package:typhoon_pos/features/items/pages/show_category.dart';
import 'package:typhoon_pos/sumni.dart';

import 'features/Home/pages/home.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {
      '/addCategory': (context) => AddCategoryPage(),
      '/showCategories': (context) => ShowCategoriesPage(),
    },
  ));
}
