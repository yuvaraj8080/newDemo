import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


Widget AppDownloadSection(BuildContext context) {
  final _emailController = TextEditingController();

  void _launchStore(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  return Column(
    children: [
      // Notification Section
      Container(
        padding: EdgeInsets.all(20),
        color: Colors.amber,
        child: Column(
          children: [
            Text(
              'Get Notified About Our',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Latest Offers and Price Drops',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email here',
                        hintStyle:TextStyle(fontSize:12),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width:60,
                            decoration:BoxDecoration(borderRadius:BorderRadius.circular(25),
                              color:TColors.black ,
                            ),
                            child:Center(child: Text("Send",style:Theme.of(context).textTheme.bodyMedium!.copyWith(color:Colors.white))),
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Download App Section
      Container(
        padding: EdgeInsets.all(30),
        color: Colors.grey[850],
        child: Column(
          children: [
            Text(
              'Download App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QR Code for Play Store
                QrImageView(
                  data: 'your_playstore_link_here',
                  size: 130,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20),
                // QR Code for App Store
                QrImageView(
                  data: 'your_appstore_link_here',
                  size: 130,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height:70),
            // Invite a Friend Section
            Text(
              'Invite a Friend',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),

              child: Column(
                children: [
                    Text(
                    'Invite a friend to OEliphones application.',
                    textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Tap to copy the respective download link',
                    textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  // Store Buttons
                  GestureDetector(
                    onTap: () => _launchStore('https://play.google.com/store/apps/details?id=com.oruphones.oru&hl=en_IN'),
                    child: Image.asset(
                      'assets/icons/payment_methods/img.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: () => _launchStore('https://play.google.com/store/apps/details?id=com.oruphones.oru&hl=en_IN'),
                    child: Image.asset(
                      'assets/icons/payment_methods/img_1.png',
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            // Social Media Icon
          ],
        ),
      ),
    ],
  );
}

