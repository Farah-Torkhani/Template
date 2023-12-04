// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Guide {
  String? id;
  String? fullname;
  String? description;
  String? location;
  String? image;
  String? reviews;
  double? price;
  Guide({
    this.id,
    this.fullname,
    this.description,
    this.location,
    this.image,
    this.reviews,
    this.price,
  });

  Guide copyWith({
    String? id,
    String? fullname,
    String? description,
    String? location,
    String? image,
    String? reviews,
    double? price,
  }) {
    return Guide(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      description: description ?? this.description,
      location: location ?? this.location,
      image: image ?? this.image,
      reviews: reviews ?? this.reviews,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'fullname': fullname,
      'description': description,
      'location': location,
      'image': image,
      'reviews': reviews,
      'price': price,
    };
  }

  factory Guide.fromMap(Map<String, dynamic> map) {
    return Guide(
      id: map['_id'] != null ? map['_id'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      reviews: map['reviews'] != null ? map['reviews'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Guide.fromJson(String source) =>
      Guide.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Guide(_id: $id, fullname: $fullname, description: $description, location: $location, image: $image, reviews: $reviews, price: $price)';
  }

  @override
  bool operator ==(covariant Guide other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullname == fullname &&
        other.description == description &&
        other.location == location &&
        other.image == image &&
        other.reviews == reviews &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        description.hashCode ^
        location.hashCode ^
        image.hashCode ^
        reviews.hashCode ^
        price.hashCode;
  }
}
