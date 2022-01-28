import 'product_data.dart';

class RestroData {
  final String r_name;
  final String r_image;
  final String r_addr;
  double r_rating;
  List<ProductData> non_veg = [];
  List<ProductData> veg = [];
  RestroData(
      {required this.r_name,
      required this.r_image,
      required this.r_addr,
      required this.r_rating});
}
