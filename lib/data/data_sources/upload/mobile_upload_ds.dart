// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tasklet/data/data_sources/auth/local_auth_ds.dart';

class MobileUploadDataSource {
  Future<String?> createContent({
    required String path,
    required String fileName,
  }) async {
    final token = LocalAuthDataSource.session?.token;
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "https://sbeusilent.space/Media/upload",
      ),
    );
    // request.fields['type'] = type;
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    });
    final uploadedFile = await http.MultipartFile.fromPath(
      'file',
      path,
      filename: path,
    );
    request.files.add(uploadedFile);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final String data =
          (jsonDecode(response.body) as Map<String, dynamic>)['id'];
      return data;
    } catch (e) {
      return null;
    }
  }
}
