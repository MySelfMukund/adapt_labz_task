import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import '../models/profile_model.dart';
import '../providers/home_page_provider.dart';

class HomePageController extends GetxController {
  HomePageProvider provider = Get.isRegistered<HomePageProvider>()
      ? Get.find<HomePageProvider>()
      : Get.put(HomePageProvider());

  final _value = ''.obs;
  get value => _value.value;
  set value(val) => _value.value = val;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final Rx<ProfileModel> _profileData = ProfileModel().obs;
  ProfileModel get profileData => _profileData.value;
  set profileData(ProfileModel val) => _profileData.value = val;

  final RxString _imageFilePath = ''.obs;
  String get imageFilePath => _imageFilePath.value;
  set imageFilePath(String val) => _imageFilePath.value = val;

  final Rx<LocationData> _locationData =
      LocationData.fromMap({"latitude": 0.0, "longitude": 0.0}).obs;
  LocationData get locationData => _locationData.value;
  set locationData(LocationData val) => _locationData.value = val;

  @override
  Future<void> onInit() async {
    await getProfileDetails();
    locationData = await getLocationPermissionRequestPermission();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future imageSelector() async {
    XFile? file;
    file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 60);

    if (file!.path != null) {
      imageFilePath = file.path;
      cropImage();
    } else {
      print("You have not taken image");
    }
  }

  Future cropImage() async {
    if (imageFilePath != null) {
      CroppedFile? cropped = await ImageCropper()
          .cropImage(sourcePath: imageFilePath, aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop',
            cropGridColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(title: 'Crop')
      ]);

      if (cropped != null) {
        imageFilePath = cropped.path;
      }
    }
  }

  Future<void> getProfileDetails() async {
    try {
      isLoading = true;
      var result = await provider.getProfileData();
      if (result != null) {
        profileData = result;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Profile details catch error ${e.toString()}");
      }
    } finally {
      isLoading = false;
    }
  }

  Future<LocationData> getLocationPermissionRequestPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    locationData = await location.getLocation();
    if (kDebugMode) {
      print(locationData.toString());
    }
    return locationData;
  }
}
