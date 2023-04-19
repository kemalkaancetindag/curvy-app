
import 'package:camera/camera.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class ConfirmMeController extends GetxController {
  List<CameraDescription> cameras;
  late CameraController cameraController;
  bool isCameraInitialized = false;

  ConfirmMeController({
    required this.cameras
  });

  @override
  Future<void> onInit() async {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium, imageFormatGroup: ImageFormatGroup.yuv420);    
    await cameraController.initialize();
    isCameraInitialized = true;
    update();
  }

  Future<void> createConfirmRequest() async {
    XFile cImage =  await cameraController.takePicture();
    var uploadableImage = await cImage.readAsBytes();
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var storageRef = FirebaseStorage.instance.ref();
    
    
    var ref = storageRef.child("confirmation_images/${userID}.${cImage.path.split(".").last}");
    await ref.putData(uploadableImage);
    
  }

}