// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../../../features/shop/models/product_model.dart';
// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../../utils/exceptions/platform_exceptions.dart';
//
// class ProductRepository extends GetxController {
//   static ProductRepository get instance => Get.find();
//
//   final _db = FirebaseFirestore.instance;
//
//   /// GET LIMITED FEATURED PRODUCTS
//   Future<List<ProductModel>> getFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection("Products")
//           .where("IsFeatured", isEqualTo: true)
//           .limit(4)
//           .get();
//
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// GET ALL FEATURED PRODUCTS
//   Future<List<ProductModel>> getAllFeaturedProducts() async {
//     try {
//       final snapshot = await _db.collection("Products")
//           .where("IsFeatured", isEqualTo: true)
//           .get();
//
//       return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// GET PRODUCTS BY QUERY
//   Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
//     try {
//       final querySnapshot = await query.get();
//       return querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// GET FAVOURITE PRODUCTS BY IDS
//   Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
//     try {
//       if (productIds.isEmpty) {
//         return [];
//       }
//       final snapshot = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
//       return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// GET PRODUCTS FOR BRAND
//   Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
//     try {
//       final querySnapshot = limit == -1
//           ? await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).get()
//           : await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).limit(limit).get();
//
//       return querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
//
//   /// GET PRODUCTS FOR CATEGORY
//   Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
//     try {
//       final productCategoryQuery = limit == -1
//           ? await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).get()
//           : await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).limit(limit).get();
//
//       List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
//       if (productIds.isEmpty) {
//         return [];
//       }
//       final productsQuery = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
//       return productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
//
//
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong, Please try again';
//     }
//   }
// }
