class AllProducts {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;

  AllProducts(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});

  AllProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] is int
        ? (json['price'] as int).toDouble()
        : json['price'];
    category = json['Other'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['Other'] = this.category;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
