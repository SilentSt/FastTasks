// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tasklet/data/data_sources/auth/local_auth_ds.dart';

class WebUploadDataSource {
  Future<String?> createContent({
    required Uint8List bytes,
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
    final uploadingFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: fileName,
    );
    request.files.add(uploadingFile);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final String data =
          (jsonDecode(response.body) as Map<String, dynamic>)['link'];
      return data;
    } catch (e) {
      return null;
    }
  }
}
