// import 'package:ecommerceapp/features/personalization/controllers/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../images/t_circular_image.dart';
//
// class TUserProfileTile extends StatelessWidget {
//   TUserProfileTile({
//     super.key, required this.onPressed,
//   });
//
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final controller =Get.put(UserController());
//       final user = controller.user.value;
//       return ListTile(
//         leading:  TCircularImage(
//           fit:BoxFit.cover,
//           isNetworkImage: user.profilePicture.isNotEmpty ? true : false,
//             image: user.profilePicture.isNotEmpty ? user.profilePicture : "assets/user/UserImge.png"),
//         title: Text(controller.user.value.fullName, style: Theme
//             .of(context)
//             .textTheme
//             .headlineSmall!
//             .apply(color: TColors.white)),
//         subtitle: Text(controller.user.value.email, style: Theme
//             .of(context)
//             .textTheme
//             .labelLarge!
//             .apply(color: TColors.white)),
//         trailing: IconButton(onPressed: onPressed,
//             icon: const Icon(Iconsax.edit, color: Colors.white)),
//       );
//     });
//   }
// }
