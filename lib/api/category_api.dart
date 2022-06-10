import 'package:batch28_api_starter/api/http_services.dart';
import 'package:batch28_api_starter/model/dropdown_category.dart';
import 'package:batch28_api_starter/response/category_response.dart';
import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryAPI {
  Future<List<DropdownCategory?>> loadCategory() async {
    List<DropdownCategory?> dropdownCategoryList = [];
    Response response;
    var url = baseUrl + categoriesUrl;
    var dio = HttpServices().getDioInstance();


    try {
      response = await dio.get(url);

      if (response.statusCode == 201) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);
        for (var category in categoryResponse.data!) {
          dropdownCategoryList.add(DropdownCategory(
            id: category.id,
            name: category.name,
          ));
        }
      } 


  }catch  (e) {
    debugPrint('failed to load category $e');
  }
  return dropdownCategoryList;
}
}
