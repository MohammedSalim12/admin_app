import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imagesUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  if (file != null) {
    return (file.path); 
  } else {
    return null;
  }
}

fileuploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["svg", "SVG"]
        : ["svg", "SVG", "png", "PNG", "jpg", "jpeg", "gif"],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
