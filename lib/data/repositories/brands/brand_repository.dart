// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerceapp/features/shop/models/brand_model.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../../utils/exceptions/platform_exceptions.dart';
//
// class BrandRepository extends GetxController{
//   static BrandRepository get instance => Get.find();
//
//   /// CONSTANT VARIABEL
//   final _db = FirebaseFirestore.instance;
//
//   ///  GET ALL BRAND CATEGORIES
//   Future<List<BrandModel>> getAllBrands() async{
//     try{
//
//       final snapshot = await _db.collection("Brands").get();
//       final result = snapshot.docs.map((e)=> BrandModel.fromSnapshot(e)).toList();
//       return result;
//
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong while fetching brands';
//     }
//   }
//
//
//   ///  GET BRANDS FOR CATEGORY
//   Future<List<BrandModel>> getBrandsFroCategory(String categoryId) async {
//     try {
//       ///    QUERY TO GET ALL DOCUMENT WHERE CATEGORY MATCHES THE PROVIDER CATEGORIES
//       QuerySnapshot brandCategoryQuery = await _db.collection("BrandCategory").where("categoryId", isEqualTo: categoryId).get();
//
//       ///  EXTRACT BRAND IDS FROM THE DOCUMENTS
//       List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
//
//       if (brandIds.isEmpty) {
//         // Return an empty list if no brand IDs are found
//         return [];
//       }
//
//       ///QUERY TO GET ALL DOCUMENT WHERE THE BRAND ID IS THE LIST OF BRAND ID FIELD PATH TO QUERY DOCUMENT IN COLLECTION
//       final brandsQuery = await _db.collection("Brands").where(FieldPath.documentId, whereIn: brandIds).limit(3).get();
//
//       /// EXTRACT BRAND NAMES OR THE RELEVANT DATA FROM THE DOCUMENTS
//       List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
//       return brands;
//     } on FirebaseException catch (e, stacktrace) {
//       printError(info: "FirebaseException: ${e.message}\nStackTrace: $stacktrace");
//       throw TFirebaseException(e.code).message;
//     } on PlatformException catch (e, stacktrace) {
//       printError(info: "PlatformException: ${e.message}\nStackTrace: $stacktrace");
//       throw TPlatformException(e.code).message;
//     } catch (e, stacktrace) {
//       printError(info: "Exception: ${e.toString()}\nStackTrace: $stacktrace");
//       throw 'Something went wrong while fetching brands';
//     }
//   }
// }