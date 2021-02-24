import 'package:AbdoCare_Web/services/interfaces/storage_service_interface.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class StorageService extends IStorageService {
  // List<int> _selectedFile;
  // Uint8List _bytesData;

  // startWebFilePicker() async {
  //   var uploadInput = html.FileUploadInputElement();
  //   uploadInput.multiple = true;
  //   uploadInput.draggable = true;
  //   uploadInput.click();
  //   uploadInput.onChange.listen((event) {
  //     final files = uploadInput.files;
  //     final file = files[0];
  //     final reader = html.FileReader();
  //     reader.onLoadEnd.listen((e) {
  //       _handleResult(reader.result);
  //     });
  //     reader.readAsDataUrl(file);
  //   });
  // }

  // void _handleResult(Object result) {
  //   _bytesData = Base64Decoder().convert(result.toString().split(',').last);
  //   _selectedFile = _bytesData;
  //   print('Selected Fiel = $_selectedFile');
  // }

  // Future makeRequest() async {
  //   var fireStorageURL = Uri.parse('gs://abdocare-bdab0.appspot.com/training/');
  //   var request = http.MultipartRequest('POST', fireStorageURL);
  //   request.files.add(await http.MultipartFile.fromBytes('file', _selectedFile, contentType: MediaType('application','octet-stream'), filename: )
  // }

  Future<String> uploadTrainingToStorage() {}
}
