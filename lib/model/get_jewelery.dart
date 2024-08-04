class Jewelery_Electronics {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Jewelery_Electronics(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Jewelery_Electronics.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    price = (json['price'] as num?)?.toDouble(); // what the fuck 🤬🤬🤬😡
    description = json['description'] as String?;
    category = json['Anther'] as String?;
    image = json['image'] as String?;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['Anther'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate; // Changed from int to double to match expected API response
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = (json['rate'] as num?)?.toDouble(); // Ensure rate is cast to double
    count = json['count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
