
import 'package:camera/camera.dart';
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

}