import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stokie/Controllers/DashboardController.dart';
import 'package:stokie/Services/Apis/NewsApi.dart';
import 'package:stokie/main.dart';

// Write UI related code here
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stokine'),
      ),
      // FutureBuilder will run future and get response to show in UI
      body: FutureBuilder(
        // Api call which return future
        future: NewsApi().getNews(),
        builder: (context, snapshot) {
          // This list has all news which is shown in UI / Screen
          List<dynamic> list = [];
          try {
            list = snapshot.data?.body['body'] ?? [];
          } catch (e) {
            debugPrint('Dashboard Catch | $e');
          }
          return Center(
            // AnimatedSwitcher will switch widget by animation
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: snapshot.connectionState == ConnectionState.waiting
                  // Will show loading till future / request is not completed
                  ? const CircularProgressIndicator()
                  : list.isEmpty
                      // If list is empty it will show below text
                      ? const Text('List is empty!')
                      // GetBuilder will re-build UI when controller gets updated
                      : GetBuilder(
                          // init will assign which controller to list to update UI
                          init: DashboardController(),
                          // Below will be updated when controller gets any changes
                          builder: (controller) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 95.w,
                                // CarouselSlider.builder will build items as per requirements for carousel
                                child: CarouselSlider.builder(
                                  itemCount: list.length,
                                  itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) =>
                                      myWidgets.getListItem(list[itemIndex]),
                                  options: CarouselOptions(
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged:
                                        controller.changeCurrentCarouselIndex,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 20.w,
                                  child: SingleChildScrollView(
                                    child: AnimatedSmoothIndicator(
                                      activeIndex:
                                          controller.currentCarouselIndex,
                                      count: list.length,
                                      effect: const ScrollingDotsEffect(),
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded Will use all available space in view
                              Expanded(
                                // ListView.separated will build widgets as per requirements and add common widget for separation between all items
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        myWidgets.getListItem(list[index]),
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: list.length),
                              )
                            ],
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
