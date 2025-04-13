import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class ImageValidator {
  /// Returns true if the image from [imageUrl] is 1x1 pixels.
  static Future<bool> isImageTooSmall(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        // Decode the image and get its dimensions.
        final ui.Codec codec = await ui.instantiateImageCodec(bytes);
        final ui.FrameInfo frameInfo = await codec.getNextFrame();
        final image = frameInfo.image;

        // Check if the image dimensions are 1x1.
        return image.width == 1 && image.height == 1;
      } else {
        // If status code is not 200, treat it as an error.
        return true;
      }
    } catch (e) {
      // On any error, consider the image unavailable/too small.
      return true;
    }
  }
}
