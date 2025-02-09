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
  final String deviceCondition;
  final String listedBy;
  final String deviceStorage;
  final List<ImageModel> images;
  final DefaultImageModel defaultImage;
  final String listingState;
  final String listingLocation;
  final String listingLocality;
  final String listingPrice;
  final String make;
  final String marketingName;
  final bool openForNegotiation;
  final double discountPercentage;
  final bool verified;
  final String listingId;
  final String status;
  final String verifiedDate;
  final String listingDate;
  final String deviceRam;
  final String warranty;
  final String imagePath;
  final String createdAt;
  final String updatedAt;
  final LocationModel location;
  final int originalPrice;
  final int discountedPrice;

  ProductModel({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingState,
    required this.listingLocation,
    required this.listingLocality,
    required this.listingPrice,
    required this.make,
    required this.marketingName,
    required this.openForNegotiation,
    required this.discountPercentage,
    required this.verified,
    required this.listingId,
    required this.status,
    required this.verifiedDate,
    required this.listingDate,
    required this.deviceRam,
    required this.warranty,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
    required this.originalPrice,
    required this.discountedPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      deviceCondition: json['deviceCondition'],
      listedBy: json['listedBy'],
      deviceStorage: json['deviceStorage'],
      images: (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList(),
      defaultImage: DefaultImageModel.fromJson(json['defaultImage']),
      listingState: json['listingState'],
      listingLocation: json['listingLocation'],
      listingLocality: json['listingLocality'],
      listingPrice: json['listingPrice'],
      make: json['make'],
      marketingName: json['marketingName'],
      openForNegotiation: json['openForNegotiation'] ?? false, // Default to false if null
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(), // Default to 0.0 if null
      verified: json['verified'] ?? false, // Default to false if null
      listingId: json['listingId'],
      status: json['status'],
      verifiedDate: json['verifiedDate'],
      listingDate: json['listingDate'],
      deviceRam: json['deviceRam'],
      warranty: json['warranty'],
      imagePath: json['imagePath'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      location: LocationModel.fromJson(json['location']),
      originalPrice: json['originalPrice'] ?? 0, // Default to 0 if null
      discountedPrice: json['discountedPrice'] ?? 0, // Default to 0 if null
    );
  }

}

class ImageModel {
  final String thumbImage;
  final String fullImage;
  final String isVarified;
  final String option;
  final String id;

  ImageModel({
    required this.thumbImage,
    required this.fullImage,
    required this.isVarified,
    required this.option,
    required this.id,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      thumbImage: json['thumbImage'],
      fullImage: json['fullImage'],
      isVarified: json['isVarified'],
      option: json['option'],
      id: json['_id'],
    );
  }
}

class DefaultImageModel {
  final String fullImage;
  final String id;

  DefaultImageModel({
    required this.fullImage,
    required this.id,
  });

  factory DefaultImageModel.fromJson(Map<String, dynamic> json) {
    return DefaultImageModel(
      fullImage: json['fullImage'],
      id: json['_id'],
    );
  }
}

class LocationModel {
  final String type;
  final List<double>? coordinates;
  final String id;

  LocationModel({
    required this.type,
    required this.coordinates,
    required this.id,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'],
      coordinates: json['coordinates'] != null
          ? List<double>.from(json['coordinates'])
          : [], // Default to an empty list if null
      id: json['_id'],
    );
  }
}