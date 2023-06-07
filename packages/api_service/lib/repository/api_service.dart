import 'package:api_service/api_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  const ApiService();

  Future<PhotosModel?> getPhotos() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.photosEndpoint),
      );
      if (response.statusCode == 200) {
        final photos = photosModelFromJson(response.body);
        return photos;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
