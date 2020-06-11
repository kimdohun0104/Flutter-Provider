import 'package:flutter/material.dart';

class ViewPageIndicator extends AnimatedWidget {
  final PageController pageController;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;

  const ViewPageIndicator({
    this.pageController,
    this.itemCount,
    this.activeColor,
    this.inactiveColor,
  }) : super(listenable: pageController);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Material(
        type: MaterialType.circle,
        color: pageController.page == index ? activeColor : inactiveColor,
        child: Container(
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
