import 'dart:developer';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
}
