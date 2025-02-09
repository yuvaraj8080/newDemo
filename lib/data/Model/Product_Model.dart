

class Brand {
  final String make;
  final String imagePath;

  Brand({required this.make, required this.imagePath});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      make: json['make'],
      imagePath: json['imagePath'],
    );
  }
}


class ProductModel {
  final String id;
  final String title;
  final String thumbnail;
  final double price;
  final double salePrice;
  final String productType;
  final Brand? brand;

  ProductModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.salePrice,
    required this.productType,
    this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      salePrice: json['salePrice'].toDouble(),
      productType: json['productType'],
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
    );
  }
}

