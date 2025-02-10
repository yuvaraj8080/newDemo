import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/mobileNumber.dart';
import '../../../../common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../../common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import '../../../../common/widgets.Login_Signup/images/t_Rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../controllers/Authentication/login_controller.dart';
import '../../../controllers/homeController/banner_controller.dart';


class SellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final loginController = Get.put(LoginController());
    final homeController = Get.put(HomeController());

    return Scaffold(
      appBar:TAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(TImages.oruApp, width: 50),
            IconButton(
              icon: Icon(Icons.cancel_outlined, size: 30),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TRoundedImage(
                  imageUlr: 'assets/user/UserImge.png',
                  width: 50,
                  backgroundColor: TColors.light,
                  padding: EdgeInsets.all(5),
                ),
                SizedBox(width:20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yuvaraj Dekhane", style: Theme.of(context).textTheme.headlineSmall),
                    Text("joined: Feb 10 2025", style: Theme.of(context).textTheme.bodySmall),
                  ],
                )
              ],
            ),

            SizedBox(height:40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Sell Your Phone"),
              ),
            ),

            SizedBox(height: 20),
            ListTile(
              onTap: () {
                loginController.logout();
                Get.offAll(()=>MobileNumberScreen());
              },
              leading: Icon(Icons.logout, size: 30),
              title: Text('Logout', style: Theme.of(context).textTheme.titleLarge),
            ),

            Spacer(),
            Spacer(),

            Expanded(
              child: Obx(() => SizedBox(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    final drawerImage = homeController.drawerImages[index];
                    return TRoundedContainer(
                      showBorder: true,
                      borderColor: TColors.grey,
                      radius: 10,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              drawerImage.drawerImage,
                              width:30,
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                            SizedBox(height:3),
                            Text(drawerImage.label,style: Theme.of(context).textTheme.labelMedium)
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: homeController.drawerImages.length,
                ),
              )),
            )

          ],
        ),
      ),
    );
  }
}