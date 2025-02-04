import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigationWidget extends StatefulWidget {
  final PageController pageController;

  const BottomNavigationWidget({
    super.key,
    required this.pageController,
  });

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          border: Border.all(
            color:
                Theme.of(context).inputDecorationTheme.border!.borderSide.color,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: GNav(
            haptic: true,
            rippleColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
            tabBorderRadius: 100,
            curve: Curves.easeInOutCubic,
            gap: 5,
            color: Theme.of(context)
                .bottomNavigationBarTheme
                .unselectedIconTheme!
                .color!,
            activeColor: Theme.of(context)
                .bottomNavigationBarTheme
                .selectedIconTheme!
                .color!,
            iconSize: 25,
            textStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
            tabBackgroundColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            duration: Duration(milliseconds: 250),
            tabs: [
              GButton(
                onPressed: () {
                  widget.pageController.jumpToPage(0);
                },
                icon: LineIcons.lineChart,
                text: 'Market',
              ),
              GButton(
                onPressed: () {
                  widget.pageController.jumpToPage(1);
                },
                icon: LineIcons.newspaper,
                text: 'News',
              ),
              GButton(
                onPressed: () {
                  widget.pageController.jumpToPage(2);
                },
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                onPressed: () {
                  widget.pageController.jumpToPage(3);
                },
                icon: LineIcons.user,
                text: 'Profile',
              )
            ]),
      ),
    )
        .slideY(
          duration: 500.ms,
          begin: 1,
          curve: Curves.easeInOutCubic,
        )
        .fadeIn(
          duration: 400.ms,
        );
  }
}
