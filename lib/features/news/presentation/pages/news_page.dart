import 'package:crypto_core/features/news/presentation/widgets/news_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: Text(
                'News',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            )
              ,
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Animate(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 15),
                  itemBuilder: (context, index) {
                    return NewsCardWidget();
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: 10,
                ),
              ).fadeIn(
                duration: 300.ms,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
