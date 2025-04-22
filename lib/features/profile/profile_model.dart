class Profil {
  int? id;
  String? name;
  int? price;
  String? notes;
  Null? image;
  int? categoryId;
  Null? category;

  Profil(
      {this.id,
        this.name,
        this.price,
        this.notes,
        this.image,
        this.categoryId,
        this.category});

  Profil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    notes = json['notes'];
    image = json['image'];
    categoryId = json['categoryId'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['notes'] = this.notes;
    data['image'] = this.image;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    return data;
  }
}