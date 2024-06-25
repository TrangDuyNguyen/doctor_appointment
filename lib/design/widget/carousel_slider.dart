import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWidget<Item> extends StatefulWidget {
  final List<Item> items;
  final Widget Function(BuildContext context, Item item) itemBuilder;
  final CarouselController carouselController;

  /// Determines if current page should be larger than the side images,
  /// creating a feeling of depth in the carousel.
  final bool enlargeCenterPage;
  final bool? autoPlay;
  final double viewportFraction;
  final double aspectRatio;
  final int initialPage;

  SliderWidget({
    super.key,
    required this.carouselController,
    required this.itemBuilder,
    required this.items,
    this.enlargeCenterPage = false,
    this.autoPlay,
    this.viewportFraction = 0.9,
    this.aspectRatio = 16 / 9,
    this.initialPage = 0,
  });

  @override
  State<SliderWidget<Item>> createState() => _SliderWidgetState<Item>();
}

class _SliderWidgetState<Item> extends State<SliderWidget<Item>> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.carouselController,
      options: CarouselOptions(
        autoPlay: widget.autoPlay == true,
        enlargeCenterPage: widget.enlargeCenterPage,
        viewportFraction: widget.viewportFraction,
        aspectRatio: widget.aspectRatio,
        initialPage: widget.initialPage,
      ),
      items: widget.items.map((item) {
        return widget.itemBuilder.call(context, item);
      }).toList(),
    );
  }
}
