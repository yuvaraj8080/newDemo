// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerceapp/features/shop/models/category_model.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import '../../../firebase_storage_services.dart';
// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../../utils/exceptions/format_exceptions.dart';
// import '../../../utils/exceptions/platform_exceptions.dart';
//
// class CategoryRepository extends GetxController {
//   static CategoryRepository get instance => Get.find();
//
//   /// VARIABLE
//   final _db = FirebaseFirestore.instance;
//
//   /// GET ALL CATEGORIES
//   Future<List<CategoryModel>> getAllCategories() async {
//
//     try {
//       final snapshot = await _db.collection("Categories").get();
//       final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
//       return list;
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
//       throw 'Something went wrong while fetching brands';
//     }
//   }
//
//   /// GET SUB CATEGORIES
//   Future<List<CategoryModel>> getSubCategories(String categoryId) async {
//     try {
//
//       final snapshot = await _db.collection("Categories").where("ParentId",isEqualTo: categoryId).get();
//       final result = snapshot.docs.map((e)=> CategoryModel.fromSnapshot(e)).toList();
//       return  result;
//
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw "Something went wrong, Please try again";
//     }
//   }
//
//
//
//   ///   UPLOAD CATEGORIES TO HE CLOUD FIREBASE
//   Future<void> uploadDummyData(List<CategoryModel> categories) async {
//     try {
//       // upload all the categories along with their Images
//       final storage = Get.put(TFirebaseStorageService());
//
//       //Loop through each category
//       for (var category in categories) {
//         // UPLOAD ALL THE CATEGORIES ALONG WITH THEIR IMAGES
//         final file = await storage.getImageDataFromAssets(category.image);
//         // GET IMAGE AND ITS URL
//         final url =
//             await storage.uploadImageData("Categories", file, category.name);
//         // ASSIGN URL TO CATEGORY IMAGE ATTRIBUTE
//         category.image = url;
//         // STORE CATEGORY IN FIRESTORE
//         await _db
//             .collection("Categories")
//             .doc(category.id)
//             .set(category.toJson());
//       }
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw "Something went wrong, Please try again";
//     }
//   }
// }
