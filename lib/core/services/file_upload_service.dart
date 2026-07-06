import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';

//{
//     "file_id": "71b3dbf0-7884-40f4-8f2f-ea7422b1651e",
//     "upload": {
//         "url": "https://sport-app-dev.s3.ir-thr-at1.arvanstorage.ir/sport-app-dev"
//         "fields": {
//             "Content-Type": "image/png",
//             "key": "user/profile/ad15a926045741eca36756fccbfdf259.png",
//             "x-amz-algorithm": "AWS4-HMAC-SHA256",
//             "x-amz-credential": "aad53326-4113-4a7f-9e5f-02a6b3d5a8b6/20260706/us-east-1/s3/aws4_request"
//             "x-amz-date": "20260706T164712Z",
//             "policy": "eyJleHBpcmF0aW9uIjogIjIwMjYtMDctMDZUMTY6NTI6MTJaIiwgImNvbmRpdGlvbnMiOiBbe
//              yJDb250ZW50LVR5cGUiOiAiaW1hZ2UvcG5nIn0sIFsiY29udGVudC1sZW5ndGgtcmFuZ2UiLCA
//              xLCA1MjQyODgwXSwgeyJidWNrZXQiOiAic3BvcnQtYXBwLWRldiJ9LCB7ImtleSI6ICJ1c2VyL
//              3Byb2ZpbGUvYWQxNWE5MjYwNDU3NDFlY2EzNjc1NmZjY2JmZGYyNTkucG5nIn0sIHsieC1hbXo
//              tYWxnb3JpdGhtIjogIkFXUzQtSE1BQy1TSEEyNTYifSwgeyJ4LWFtei1jcmVkZW50aWFsIjogI
//              mFhZDUzMzI2LTQxMTMtNGE3Zi05ZTVmLTAyYTZiM2Q1YThiNi8yMDI2MDcwNi91cy1lYXN0LTE
//              vczMvYXdzNF9yZXF1ZXN0In0sIHsieC1hbXotZGF0ZSI6ICIyMDI2MDcwNlQxNjQ3MTJaIn1df
//              Q=="
//             "x-amz-signature": "5f33ec53ef1147d659b7457115c2f32e352ce4566286ae08d16ab5138965093e"
//        }
//    }
//}

class PresignedUploadInfo {
  final String id;
  final String uploadUrl;
  final String contentType;
  final String key;
  final Map<String, dynamic> fields;

  PresignedUploadInfo({
    required this.id,
    required this.uploadUrl,
    required this.contentType,
    required this.key,
    required this.fields,
  });

  factory PresignedUploadInfo.fromJson(Map<String, dynamic> json) {
    return PresignedUploadInfo(
      id: json['file_id'],
      uploadUrl: json['upload']['url'],
      key: json['upload']['fields']['key'] as String,
      contentType: json['upload']['fields']['Content-Type'] as String,
      fields: Map<String, dynamic>.from(json['upload']['fields']),
    );
  }
}

class FileUploadService {
  final HttpClient _client;
  final Dio _rawDio;

  FileUploadService(this._client, this._rawDio);

  Future<String> uploadFile({
    required File file,
    required String label,
    required void Function(double progress) onProgress,
  }) async {
    final presign = await _requestPresignedUrl(file: file, label: label);
    await _putToS3(file: file, info: presign, onProgress: onProgress);
    return _confirmUpload(id: presign.id);
  }

  Future<PresignedUploadInfo> _requestPresignedUrl({
    required File file,
    required String label,
  }) async {
    final String fileName = file.path.split('/').last;
    final response = await _client.post(
      '/file-storages/presigned-upload/',
      data: {
        'filename': fileName,
        'content_type': _contentTypeFor(fileName),
        'app_label': label,
        'model_name': 'profile',
        // 'field_name': '',
      },
    );
    return PresignedUploadInfo.fromJson(response.data);
  }

  Future<void> _putToS3({
    required File file,
    required PresignedUploadInfo info,
    required void Function(double progress) onProgress,
  }) async {
    print("Key from presign: ${info.key}");
    final formData = FormData();

    info.fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(
          file.path,
          contentType: DioMediaType.parse(info.contentType),
        ),
      ),
    );

    final response = await _rawDio.post(
      info.uploadUrl,
      data: formData,
      onSendProgress: (sent, total) {
        if (total > 0) {
          onProgress(sent / total);
        }
      },
    );

    print(response.statusCode);
    print(response.data);
  }

  Future<String> _confirmUpload({required String id}) async {
    try {
      final response = await _client.post('/file-storages/confirm/$id/');
      return response.data['id'];
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  String _contentTypeFor(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    switch (ext) {
      case 'png':
        return 'image/png';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'webp':
        return 'image/webp';
      default:
        return 'application/octet-stream';
    }
  }
}
