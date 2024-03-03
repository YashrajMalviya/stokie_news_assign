import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// This class can have variables which you need in UI
// Write business logic here
class DashboardController extends GetxController {
  bool isLoading = false;
  int currentCarouselIndex = 0;
  PageController pageController = PageController();

  changeCurrentCarouselIndex(int index, CarouselPageChangedReason reason) {
    currentCarouselIndex = index;
    update();
  }
}
