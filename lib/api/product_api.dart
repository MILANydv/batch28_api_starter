import 'dart:io';

import 'package:batch28_api_starter/api/http_services.dart';
import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ProductApi {
  Future<bool> addProduct(File? file) async {
    try {
      var url = baseUrl + getProductsUrl;
      var dio = HttpServices().getDioInstance();

      MultipartFile? image;

      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType('image', mimeType!.split('/')[1]),
        );
      }

      var formData = FormData.fromMap({
        "image": image,
        "price": 15000,
        "rating": 123,
        "numReviews": 0,
        "isFeatured": false,
        "name": "HP",
        "description": "Description",
        "category": "62a047d3151ffc3d4f909887",
        "countInStock": 23,
      });

      var response = await dio.post(url, data: formData);
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
