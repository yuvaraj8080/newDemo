// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerceapp/data/repositories/authentication/authentication-repository.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../../features/shop/models/order_model.dart';
// import '../../../utils/exceptions/firebase_exceptions.dart';
// import '../../../utils/exceptions/platform_exceptions.dart';
//
// class OrdersRepository extends GetxController{
//   static OrdersRepository get instance => Get.find();
//
//   /// VARIABLES
//  final _db = FirebaseFirestore.instance;
//
//  /*------------------------------FUNCTION------------------------*/
//
// ///  GET ALL ODER RELATED TO CURRENT USER
//   Future<List<OrderModel>> fetchUserOrders() async{
//     try{
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       if(userId.isEmpty) throw "Unable to find user information. Try in few minute";
//       final result = await _db.collection("Orders").where("userId",isEqualTo:userId).get();
//
//       return result.docs.map((documentSnapshot)=> OrderModel.fromSnapshot(documentSnapshot)).toList();
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
//   /// STORE NEW USER ORDER
//   Future<void> saveOrder(OrderModel order,String userId) async {
//     try{
//       await _db.collection("Orders").add(order.toJson());
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