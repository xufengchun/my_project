import 'package:my_project/contants/index.dart';
import 'package:my_project/utils/DioRequest.dart';
import 'package:my_project/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  final List<BannerItem> banners =
      (await dioRequest.get(HttpConstants.BANNER_LIST) as List).map((item) {
        return BannerItem.fromJson(item as Map<String, dynamic>);
      }).toList();
  return banners;
}

//获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  final List<CategoryItem> categories =
      (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List).map((item) {
        return CategoryItem.fromJson(item as Map<String, dynamic>);
      }).toList();
  return categories;
}
