import 'package:batch28_api_starter/api/category_api.dart';
import 'package:batch28_api_starter/model/dropdown_category.dart';

class CategoryRepository {
  Future<List<DropdownCategory?>> loadCategory() {
    return CategoryAPI().loadCategory();
  }
}
