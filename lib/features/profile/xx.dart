class User {
  final int id;
  final String name;
  final int price;
  final String? image;
  final String? notes;
  final int? categoryId;
  final String? category;





  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id :json['id'] ,
      name: json['name'],
      price: json['price'],
      image: json['image'],
      notes: json['notes'],
      categoryId: json['categoryId'],
      category: json['category'],
    );
  }

  User({required this.id, required this.name, required this.price, required this.image, required this.notes, required this.categoryId, required this.category});
}