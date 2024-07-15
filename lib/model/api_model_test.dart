//
// class Product {
//   final int id;
//   final String title;
//   final String description; // Change the type to dynamic to accommodate both String and double
//   final double price;
//
//   Product({required this.id, required this.title, required this.description, required this.price});
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'] ?? 0,
//       title: json['title'] ?? "",
//       description: json['description'] ?? "",
//       price: json['price'].toDouble() ?? 0.0,
//       // Keep it as it is, since it could be a String or a double
//     );
//   }
// }
//
//
//
// // class GetAllProduct {
// //   List<Product> products;
// //   int total;
// //   int skip;
// //   int limit;
// //
// //   GetAllProduct({
// //     required this.products,
// //     required this.total,
// //     required this.skip,
// //     required this.limit,
// //   });
// //
// // }
// //
// // class Product {
// //   int id;
// //   String title;
// //   String description;
// //   Category category;
// //   double price;
// //   double discountPercentage;
// //   double rating;
// //   int stock;
// //   List<String> tags;
// //   String? brand;
// //   String sku;
// //   int weight;
// //   Dimensions dimensions;
// //   String warrantyInformation;
// //   String shippingInformation;
// //   AvailabilityStatus availabilityStatus;
// //   List<Review> reviews;
// //   ReturnPolicy returnPolicy;
// //   int minimumOrderQuantity;
// //   Meta meta;
// //   List<String> images;
// //   String thumbnail;
// //
// //   Product({
// //     required this.id,
// //     required this.title,
// //     required this.description,
// //     required this.category,
// //     required this.price,
// //     required this.discountPercentage,
// //     required this.rating,
// //     required this.stock,
// //     required this.tags,
// //     this.brand,
// //     required this.sku,
// //     required this.weight,
// //     required this.dimensions,
// //     required this.warrantyInformation,
// //     required this.shippingInformation,
// //     required this.availabilityStatus,
// //     required this.reviews,
// //     required this.returnPolicy,
// //     required this.minimumOrderQuantity,
// //     required this.meta,
// //     required this.images,
// //     required this.thumbnail,
// //   });
// //
// // }
// //
// // enum AvailabilityStatus {
// //   IN_STOCK,
// //   LOW_STOCK
// // }
// //
// // enum Category {
// //   BEAUTY,
// //   FRAGRANCES,
// //   FURNITURE,
// //   GROCERIES
// // }
// //
// // class Dimensions {
// //   double width;
// //   double height;
// //   double depth;
// //
// //   Dimensions({
// //     required this.width,
// //     required this.height,
// //     required this.depth,
// //   });
// //
// // }
// //
// // class Meta {
// //   DateTime createdAt;
// //   DateTime updatedAt;
// //   String barcode;
// //   String qrCode;
// //
// //   Meta({
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.barcode,
// //     required this.qrCode,
// //   });
// //
// // }
// //
// // enum ReturnPolicy {
// //   NO_RETURN_POLICY,
// //   THE_30_DAYS_RETURN_POLICY,
// //   THE_60_DAYS_RETURN_POLICY,
// //   THE_7_DAYS_RETURN_POLICY,
// //   THE_90_DAYS_RETURN_POLICY
// // }
// //
// // class Review {
// //   int rating;
// //   String comment;
// //   DateTime date;
// //   String reviewerName;
// //   String reviewerEmail;
// //
// //   Review({
// //     required this.rating,
// //     required this.comment,
// //     required this.date,
// //     required this.reviewerName,
// //     required this.reviewerEmail,
// //   });
// //
// // }

class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['tags'] = this.tags;
    data['brand'] = this.brand;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['warrantyInformation'] = this.warrantyInformation;
    data['shippingInformation'] = this.shippingInformation;
    data['availabilityStatus'] = this.availabilityStatus;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = this.returnPolicy;
    data['minimumOrderQuantity'] = this.minimumOrderQuantity;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['depth'] = this.depth;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['reviewerName'] = this.reviewerName;
    data['reviewerEmail'] = this.reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['barcode'] = this.barcode;
    data['qrCode'] = this.qrCode;
    return data;
  }
}
