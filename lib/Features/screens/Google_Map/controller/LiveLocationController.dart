import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:oru_ecommerce_app/data/Model/Product_Model.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../common/widgets.Login_Signup/loaders/snackbar_loader.dart';
import '../../../controllers/homeController/ProdcutController.dart';

class LiveLocationController extends GetxController {
  static LiveLocationController get instance => Get.find();


  //// STORE ALL THE PRODUCT DATA HARE ////
  var products = <ProductModel>[].obs;
  //// STORE ALL THE MARKES DATA IN THE VARIABLE ////
  var markers = <Marker>[].obs;

  Rx<LatLng> initialLatLng = LatLng(28.6472799, 76.8130638).obs;
  Rx<GoogleMapController?> googleMapController = Rx<GoogleMapController?>(null);
  // Timer? _timer;
  int shakeCount = 0;

  @override
  void onInit() {
    super.onInit();
    _getPermission();
    getCurrentLocation();
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    await ProductController.instance.fetchProducts();
    products.assignAll(ProductController.instance.products);
    createMarkers();
  }

  //// FUNCTION FOR THE SHOW MARKERS ON THIS SCREEN ///
  void createMarkers() {
    for (var product in products) {
      final location = product.location.coordinates;
      final marker = Marker(
        icon:BitmapDescriptor.defaultMarker,
        markerId: MarkerId(product.id),
        position: LatLng(location![1], location[0]), // Ensure correct order: LatLng(latitude, longitude)
        infoWindow: InfoWindow(
          title: product.marketingName,
          snippet: 'Price: ₹${product.discountedPrice} (Original: ₹${product.originalPrice})',
        ),
      );
      markers.add(marker);
    }
  }



  Future<void> _getPermission() async {
    await Permission.location.request();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    while (!serviceEnabled) {
      TLoaders.warningSnackBar(title: 'Location services are disabled. Please Enable Location');
      await Geolocator.openLocationSettings();
      await Future.delayed(Duration(seconds: 2)); // wait for 2 seconds
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        TLoaders.warningSnackBar(title: 'Location Permissions are Denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      TLoaders.warningSnackBar(
          title:'Location permissions are permanently Denied, we cannot request Permissions.');
      return false;
    }
    return true;
  }


  Future<LocationData?> getCurrentLocation() async {
    bool locationPermissionGranted = await _handleLocationPermission();
    if (!locationPermissionGranted) {
      return null;
    }

    Location location = Location();
    LocationData? _locationData;

    _locationData = await location.getLocation();
    initialLatLng.value = LatLng(_locationData.latitude!, _locationData.longitude!);
    final GoogleMapController? controller = googleMapController.value;
    controller?.animateCamera(
      CameraUpdate.newLatLngZoom(initialLatLng.value, 14.0),
    );
    return _locationData;
  }
}
