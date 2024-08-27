import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/data/model/home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ImageSlider extends StatefulWidget {
  final List<Slide> slides;
  const ImageSlider({super.key, required this.slides});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int posterState = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
              items: widget.slides.map((e) {
                return CachedNetworkImage(
                  imageUrl: "https://flutter.vesam24.com/${e.image}",
                  fit: BoxFit.fill,
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                height: 180,
                scrollDirection: Axis.horizontal,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    posterState = index;
                  });
                },
              )),
          Positioned(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                duration: const Duration(milliseconds: 100),
                activeIndex: posterState,
                count: 5,
                effect: const ExpandingDotsEffect(
                    radius: 15,
                    spacing: 5,
                    expansionFactor: 2,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: AppColors.kGray100,
                    activeDotColor: AppColors.kPrimary500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
