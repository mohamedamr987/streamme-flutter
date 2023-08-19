// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
//
// import 'pick_service.dart';
//
// class PickFileService implements PickService{
//   @override
//     Future<List<File>?> call() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       File file = File(result.files.single.path!);
//       return [file];
//     }
//     else{
//       return null;
//     }
//   }
//
// }