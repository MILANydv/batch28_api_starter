import 'dart:io';

import '../api/product_api.dart';

class ProductRepository {
  Future<bool> addProduct(File? file) async {
    return await ProductApi().addProduct(file);
  }
}
