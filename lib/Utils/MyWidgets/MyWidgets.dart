import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Screens/News/NewsViewScreen.dart';

class MyWidgets {
  getListItem(Map item) {
    return InkWell(
      onTap: () => Get.to(() => NewsViewScreen(link: item['link'])),
      child: SizedBox(
        height: 23.h,
        width: 90.w,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
                width: 90.w,
                child: CachedNetworkImage(
                  width: 90.w,
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWtIUrmBCSWTspIkNd9nSyxQYP09e3X5MDCipwkiu_KnJadYXuxZrOE3TArWT8F4EWTsY&usqp=CAU",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                '${item['source']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${item['title']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20.sp),
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(item['pubDate'])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
