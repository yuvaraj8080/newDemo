import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';

import '../../../../common/widgets.Login_Signup/images/t_Rounded_image.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../controllers/Authentication/login_controller.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: TColors.grey,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(TImages.oruApp, width: 50),
                      IconButton(
                        icon: Icon(Icons.cancel_outlined, size: 30),
                        onPressed: () {
                          Get.offAll(() => NavigationMenu());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TRoundedImage(
                        imageUlr: 'assets/user/UserImge.png',
                        width: 50,
                        backgroundColor: TColors.light,
                        padding: EdgeInsets.all(5),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Yuvaraj Dekhane", style: Theme.of(context).textTheme.headlineSmall),
                          Text("joined: Feb 10 2025", style: Theme.of(context).textTheme.bodySmall),
                        ],
                      )
                    ],
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                    Get.back();
                  },
                  tileColor: TColors.grey,
                  leading: Icon(Icons.logout, size: 30),
                  title: Text('Logout', style: Theme.of(context).textTheme.titleLarge),
                ),
                SizedBox(height: 190),
                // Adding the six boxes at the bottom
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                  return TRoundedContainer(
                    showBorder: true,
                    borderColor: TColors.grey,
                    radius:10,
                    child:Center(child: Text("Boxes")));

                  },
                  itemCount: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}