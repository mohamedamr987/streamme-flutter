import 'package:image_picker/image_picker.dart';

import 'pick_service.dart';



enum PickImageMethod{camera, gallery}
class PickImageService implements PickService{
  ImageSource imageSource;
  int count;

  PickImageService({required this.imageSource, this.count = 1});

  @override
  Future<List<XFile>?> call() async {
    if (count == 1) {
      final result = await ImagePicker().pickImage(source: imageSource);
      if (result != null) return [result];
      return null;
    } else {
      return await ImagePicker().pickMultiImage();
    }
  }
}
