import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage getCachedNetworkImage({
  required BuildContext context,
  required String imageUrl,
  double? borderRadius,
  required double width,
  required double height,
  EdgeInsetsGeometry? margin,
}) {
  final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return CachedNetworkImage(
    placeholder: (context, url) => Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: NetworkImage('https://via.placeholder.com/${width.round()}'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    imageBuilder: (context, imageProvider) => Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    imageUrl: imageUrl,
    width: width,
    height: height,
    maxHeightDiskCache: (height * devicePixelRatio).round(),
    maxWidthDiskCache: (width * devicePixelRatio).round(),
    memCacheHeight: (height * devicePixelRatio).round(),
    memCacheWidth: (width * devicePixelRatio).round(),
    fit: BoxFit.cover,
  );
}