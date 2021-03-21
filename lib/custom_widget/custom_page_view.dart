import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class CustomPageView extends StatefulWidget {
  final Color dotColor;
  final Color selectedDotColor;
  final Color borderColor;
  final List<Widget> pages;
  final Duration autoPlayShowDuration;

  CustomPageView({
    @required this.dotColor,
    @required this.selectedDotColor,
    @required this.borderColor,
    @required this.pages,
    this.autoPlayShowDuration,
  });

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    if (widget.autoPlayShowDuration != null && widget.autoPlayShowDuration.inMilliseconds > 0) {
      Timer.periodic(widget.autoPlayShowDuration, (Timer timer) {
        if (_currentPage < widget.pages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: widget.pages,
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            },
          ),
        ),
        widget.pages.length > 1
            ? CirclePageIndicator(
                dotColor: widget.dotColor,
                selectedDotColor: widget.selectedDotColor,
                borderColor: widget.borderColor,
                borderWidth: 2,
                itemCount: widget.pages.length,
                currentPageNotifier: _currentPageNotifier,
              )
            : Container(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _currentPageNotifier.dispose();
    _pageController.dispose();
  }
}
