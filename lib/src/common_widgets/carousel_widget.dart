import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';

class SCarouselSliderWidget extends StatefulWidget {
  const SCarouselSliderWidget({
    super.key,
    required this.screenWidth,
    required this.stats,
  });

  final double screenWidth;
  final List<Widget> stats;

  @override
  State<SCarouselSliderWidget> createState() => _SCarouselSliderWidgetState();
}

class _SCarouselSliderWidgetState extends State<SCarouselSliderWidget> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 90,
            width: widget.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: sDefaultSize),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.stats,
            )),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.stats.length,
          effect: const WormEffect(activeDotColor: Color(0xff272727), dotHeight: 5.0),
        )
      ],
    );
  }
}
