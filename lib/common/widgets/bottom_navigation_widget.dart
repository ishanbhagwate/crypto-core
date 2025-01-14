import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../core/notifiers/theme_notifier.dart';

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
  late ThemeNotifier themeNotifier;

  @override
  void didChangeDependencies() {
    themeNotifier = Provider.of<ThemeNotifier>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          border: Border.all(
            color: themeNotifier.themeMode == ThemeMode.dark
                ? Colors.white10
                : Colors.black.withAlpha(15),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: GNav(
            haptic: true,
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
            ]

            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.max,
            //   spacing: 10,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         print('CLICKED');
            //         themeNotifier.setTheme(
            //             themeNotifier.themeMode == ThemeMode.light
            //                 ? ThemeMode.dark
            //                 : ThemeMode.light);
            //       },
            //       splashColor: Colors.white10,
            //       borderRadius: BorderRadius.circular(100),
            //       child: Material(
            //         color: Colors.transparent,
            //         child: Container(
            //           height: 50,
            //           decoration: BoxDecoration(
            //             color: Color(0xffbf8964).withAlpha(20),
            //             borderRadius: BorderRadius.circular(100),
            //           ),
            //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //           child: Row(
            //             children: [
            //               Icon(
            //                 Icons.line_axis_rounded,
            //                 size: 25,
            //                 color: widget.pageController.page == 0
            //                     ? Theme.of(context)
            //                         .bottomNavigationBarTheme
            //                         .selectedIconTheme!
            //                         .color
            //                     : Theme.of(context)
            //                         .bottomNavigationBarTheme
            //                         .unselectedIconTheme!
            //                         .color,
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               Text('Market',
            //                   style: Theme.of(context)
            //                       .bottomNavigationBarTheme
            //                       .selectedLabelStyle)
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {},
            //       splashColor: Colors.white10,
            //       borderRadius: BorderRadius.circular(100),
            //       child: Material(
            //         color: Colors.transparent,
            //         child: SizedBox(
            //           height: 50,
            //           width: 50,
            //           child: Icon(
            //             Icons.newspaper_outlined,
            //             size: 25,
            //             color: widget.pageController.page == 1
            //                 ? Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .selectedIconTheme!
            //                     .color
            //                 : Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .unselectedIconTheme!
            //                     .color,
            //           ),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {},
            //       splashColor: Colors.white10,
            //       borderRadius: BorderRadius.circular(100),
            //       child: Material(
            //         color: Colors.transparent,
            //         child: SizedBox(
            //           height: 50,
            //           width: 50,
            //           child: Icon(
            //             Icons.search_rounded,
            //             color: widget.pageController.page == 2
            //                 ? Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .selectedIconTheme!
            //                     .color
            //                 : Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .unselectedIconTheme!
            //                     .color,
            //             size: 25,
            //           ),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {},
            //       splashColor: Colors.white10,
            //       borderRadius: BorderRadius.circular(100),
            //       child: Material(
            //         color: Colors.transparent,
            //         child: SizedBox(
            //           height: 50,
            //           width: 50,
            //           child: Icon(
            //             Icons.person_rounded,
            //             size: 25,
            //             color: widget.pageController.page == 3
            //                 ? Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .selectedIconTheme!
            //                     .color
            //                 : Theme.of(context)
            //                     .bottomNavigationBarTheme
            //                     .unselectedIconTheme!
            //                     .color,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            ),
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
