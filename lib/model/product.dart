import 'package:shop_store/utils/constants.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] ?? '00',
        title: json["title"] ?? 'No title',
        price: json["price"].toDouble() ?? '00',
        description: json["description"] ?? 'No description',
        category: json["category"] ?? 'No category',
        image: json["image"] ?? emptyImage,
        rating: Rating.fromMap(json["rating"]),
      );
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble() ?? '00',
        count: json["count"] ?? '0',
      );
}
