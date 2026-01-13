//网络获得数据解析为BannerItem模型
// class BannerItem {
//   final String imageUrl;
//   final String id;

//   BannerItem(this.imageUrl, this.id);
//   factory BannerItem.fromJson(Map<String, dynamic> json) {
//     return BannerItem(json['imageUrl'] ?? '', json['id'] ?? '');
//   }
// }
class BannerItem {
  final String imageUrl;
  final String id;

  BannerItem(this.imageUrl, this.id);

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(json['imgUrl'] ?? '', json['id'] ?? '');
  }
}
