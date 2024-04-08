import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

class CustomImageDisplay {
  CustomImageDisplay._();

  static Widget customCachedImage(
      {required String imageUrl,
      double? size,
      Widget? placeholder,
      BoxFit? fit}) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 400),
      height: size,
      width: size,
      fit: fit,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) {
        return const Icon(IconlyBroken.info_circle);
      },
      placeholder: (context, url) => placeholder ?? Container(),
    );
  }

  static Widget customSvgImage(
      {required String imageUrl, Widget? placeholder}) {
    return SvgPicture.network(
      imageUrl,
      placeholderBuilder: (context) => placeholder ?? Container(),
    );
  }
}
