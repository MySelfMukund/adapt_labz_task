import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDialog extends StatelessWidget {
  String? imageUrl;

  ImageDialog({super.key, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: 200.w,
        height: 200.h,
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Center(child: SizedBox(width: 50.w, height: 50.h, child: const CircularProgressIndicator())),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
