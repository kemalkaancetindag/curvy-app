import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  List<String> _images = <String>[];
  List<String> get images => _images;
  

  EditProfileController();
  
  @override
  void onInit() {
    super.onInit();
   
  }

  
  Future pickImage(int imageSource, int? index) async {
    ImagePicker imagePicker = ImagePicker();
    
    switch(imageSource){
      case 0:

          XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
          if(image == null) return;
          _images.add(image.path);

          break;
      case 1:
          XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
          if(image == null) return;
          _images.add(image.path);
          break;

    }
    update();
  }



}