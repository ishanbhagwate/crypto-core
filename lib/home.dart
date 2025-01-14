import 'package:crypto_core/features/market/presentation/pages/market_page.dart';
import 'package:crypto_core/features/market/presentation/widgets/bottom_navigation_widget.dart';
import 'package:crypto_core/features/news/presentation/pages/news_page.dart';
import 'package:crypto_core/features/profile/presentation/pages/profile_page.dart';
import 'package:crypto_core/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final PageController _pageController = PageController();

  final _pages = [
    MarketPage(),
    NewsPage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          BottomNavigationWidget(pageController: _pageController),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
