// models.dart
class Category {
  int? id;
  String name;

  Category({this.id, required this.name});

  // Method to convert map to Category object
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }

  // Method to convert Category object to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name.toLowerCase(), // Store as lowercase in the database
    };
  }

  // Method to convert category name to lowercase for database storage
  String toLowerCase() {
    return name.toLowerCase();
  }

  // Method to convert category name to camel case
  String toCamelCase() {
    if (name.isEmpty) return '';
    return name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
  }
}

class MenuItem {
  int? id;
  int categoryId;
  String title;
  int quantity;
  double price;

  MenuItem({
    this.id,
    required this.categoryId,
    required this.title,
    this.quantity = 0,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'quantity': quantity,
      'price': price,
    };
  }
}
