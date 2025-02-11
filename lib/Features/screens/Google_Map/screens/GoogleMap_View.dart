import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../common/SortAndFilterArrayList/sortAndFilterArrayList.dart';
import '../../../../common/widgets.Login_Signup/Choice/sortFilterList.dart';
import '../../../../common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../../common/widgets.Login_Signup/layout/searchTextFormField.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/validators/validator.dart';
import '../controller/LiveLocationController.dart';

class GoogleMap_View_Screen extends StatelessWidget {
  final locationController = Get.put(LiveLocationController());
  final PhoneMarketplace marketplace = PhoneMarketplace();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Row(
          children: [
            Expanded(child:TextFormField(
              validator: (value) => TValidator.validateEmptyText("Name", value),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: TColors.homeButtonColor,
                hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                hintText: 'Search phone ...',
                suffixIcon: Icon(Icons.mic_none_outlined),
              ),
            )),
            SizedBox(width:10),
            Row(
              children: [
                Text("India ", style: Theme.of(context).textTheme.titleMedium),
                Icon(Icons.location_on_outlined,size:25)
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:10),
            // Add the SortFilterList widget here
            SortFilterList(
              sortFilterList: marketplace.sortFilterList,
              onSortFilterTap: marketplace.sortFilterActions(context), // This now returns a single function
            ),
            SizedBox(height:10),
            Expanded(
              child: Obx(() => GoogleMap(
                buildingsEnabled: true,
                trafficEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: locationController.initialLatLng.value,
                  zoom: 14.0,
                ),
                markers: Set<Marker>.of(locationController.markers), // Display markers
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  locationController.googleMapController.value = controller;
                },
              )),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {},
        label: Text("All Listing in India", style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}