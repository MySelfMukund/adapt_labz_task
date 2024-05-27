import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:problem_statement/app/data/extensions.dart';
import 'package:problem_statement/app/modules/home_page/models/photos_model.dart';
import 'package:problem_statement/app/widgets/custom_app_bar.dart';
import 'package:problem_statement/app/widgets/image_dialog.dart';

import '../controllers/my_album_controller.dart';
import 'package:problem_statement/app/modules/my_album/models/album_model.dart';

class MyAlbumView extends StatelessWidget {
  //GetView<MyAlbumController> {
  final controller = Get.isRegistered<MyAlbumController>() ? Get.find<MyAlbumController>() : Get.put(MyAlbumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.photosList.isNotEmpty ? 'Photos Grid' : 'Album Grid',
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => LoadingOverlayPro(
            isLoading: controller.isLoading.value,
            child: controller.photosList.value.isNotEmpty
                ? GridView.extent(
                    maxCrossAxisExtent: 200.0, // maximum item width
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                    padding: const EdgeInsets.all(8.0), // padding around the grid
                    children: controller.photosList.value.map((item) {
                      return _buildPhotoGridViewListItemWidget(item);
                    }).toList(),
                  )
                : GridView.extent(
                    maxCrossAxisExtent: 200.0, // maximum item width
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                    padding: const EdgeInsets.all(8.0), // padding around the grid
                    children: controller.albumList.value.map((item) {
                      return _buildAlbumGridViewListItemWidget(item);
                    }).toList(),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumGridViewListItemWidget(
    AlbumModel item,
  ) {
    return InkWell(
      onTap: () => controller.getPhotoListFromAlbumId(item.id!),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
                width: double.maxFinite,
                color: Colors.grey[800], // color of grid items
                child: const Icon(
                  Icons.folder_open_rounded,
                  color: Colors.grey,
                )),
          ),
          SizedBox(
            height: 40.h,
            child: Text(
              item.title!.toTitleCase(),
              maxLines: 3,
              // textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGridViewListItemWidget(
    PhotosModel item,
  ) {
    return InkWell(
      onTap: () async => await showDialog(
          context: Get.context!,
          builder: (_) => ImageDialog(
                imageUrl: item.url,
              )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              color: Colors.grey[800], // color of grid items
              child: CachedNetworkImage(
                imageUrl: item.thumbnailUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
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
          ),
          // SizedBox(
          //   height: 40.h,
          //   child: Text(
          //     item.title.toTitleCase(),
          //     maxLines: 3,
          //     // textAlign: TextAlign.center,
          //     style: const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}
