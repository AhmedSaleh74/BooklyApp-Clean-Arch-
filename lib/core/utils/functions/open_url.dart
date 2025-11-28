import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String? url) async {
  if (url == null || url.isEmpty) {
    debugPrint("No preview link available: $url");
    return;
  }

  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Could not launch URL: $url");
  }
}
