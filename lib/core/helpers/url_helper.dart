import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> launchURL(String uri) async {
    final url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
