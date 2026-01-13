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
