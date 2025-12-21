import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUtils {
  MyUtils._privateConstructor();

  static const String _publicUrl =
      'https://qbtemzrdshumbkbzpdak.supabase.co/storage/v1/object/public/';

  ///Returns random image url
  static String getTempLink({int height = 812, int width = 375}) {
    math.Random rand = math.Random();
    int value = rand.nextInt(height);
    return 'https://picsum.photos/$width/$height?test=$value';
  }

  static ImageProvider buildImageProvider(
    String? imageUrl, [
    String? defaultImage,
  ]) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return AssetImage(defaultImage ?? 'assets/images/profilePH.png');
    }
    try {
      return CachedNetworkImageProvider(
        imageUrl,
        errorListener: (err) {
          log('Error loading image :$err');
        },
      );
    } catch (e) {
      return AssetImage(defaultImage ?? 'assets/images/profilePH.png');
    }
  }

  static String getPublicUrl(String filePath) {
    return _publicUrl + filePath;
  }

  static ImageProvider getDummyImageProvider() {
    return CachedNetworkImageProvider(getTempLink());
  }

  /// Delete a file from permanent storage
  static Future<bool> deletePermanentFile(String filePath) async {
    try {
      final File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error deleting file: $e');
      return false;
    }
  }

  static Future<void> redirectToWhatsapp(String phoneNumber) async {
    final phoneNumberWithoutSpecialChars = phoneNumber.replaceAll(
      RegExp(r'[^\d]'),
      '',
    );
    final Uri iosUrl = Uri.parse(
      "https://wa.me/$phoneNumberWithoutSpecialChars",
    );
    if (Platform.isIOS) {
      if (await canLaunchUrl(iosUrl)) {
        await launchUrl(iosUrl);
      } else {
        throw 'Could not launch $iosUrl';
      }
    } else {
      final Uri androidUrl = Uri.parse("whatsapp://send?phone=$phoneNumber");
      if (await canLaunchUrl(androidUrl)) {
        await launchUrl(androidUrl);
      } else {
        throw 'Could not launch $androidUrl';
      }
    }
    return;
  }

  static Future<void> redirectToWeChat() async {
    final Uri weChatUrl = Uri.parse("weixin://");
    if (await canLaunchUrl(weChatUrl)) {
      await launchUrl(weChatUrl);
    } else {
      throw 'Could not launch $weChatUrl';
    }
    return;
  }
}
