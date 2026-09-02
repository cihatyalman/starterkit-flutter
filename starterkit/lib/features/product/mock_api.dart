import '../../shared/constants/text_constant.dart';
import '../../shared/models/api_response.dart';

class MockApi {
  Map<String, dynamic> getProductList({int limit = 8, String? after}) {
    final newData = List.generate(limit, (index) {
      final newIndex = (index + 1 + (int.tryParse(after ?? "0") ?? 0));
      final id = newIndex.toString();
      return {
        "id": id,
        "title": "Ürün $id",
        "description": "Ürün açıklaması $id",
        "imageUrl": TextConstants.getRandomImageUrl("toy"),
        "price": (newIndex * 10).toDouble(),
      };
    });

    return ApiResponse(data: newData).toMap();
  }
}
