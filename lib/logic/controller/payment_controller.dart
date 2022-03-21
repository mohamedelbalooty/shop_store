import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Rx<Position> currentPosition = Position(
    latitude: 0,
    altitude: 0,
    accuracy: 0,
    heading: 0,
    longitude: 0,
    speed: 0,
    speedAccuracy: 0,
    timestamp: DateTime.now(),
  ).obs;
  RxString currentAddress = ''.obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  Future<void> determineCurrentAddress() async {
    await _determineCurrentPosition().then((value) async {
      try {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
            currentPosition.value.latitude, currentPosition.value.longitude);
        currentAddress.value = placeMarks[0].street.toString();
      } catch (addressException) {
        isError(true);
      }
    });
  }

  Future<void> _determineCurrentPosition() async {
    isLoading(true);
    isError(false);
    late bool serviceEnabled;
    late LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLoading(false);
      isError(true);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLoading(false);
        isError(true);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      isLoading(false);
      isError(true);
    }
    try {
      isLoading(true);
      currentPosition.value = await Geolocator.getCurrentPosition();
      isLoading(false);
    } catch (positionException) {
      isLoading(false);
      isError(true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    determineCurrentAddress();
  }
}
