import 'package:flutter/material.dart';
import 'package:news_app/src/news_list/news.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key, required this.news});

  static const routeName = '/sample_item';
  static const Widget verticalSpacer = SizedBox(height: 24);
  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: String.fromEnvironment("Sans Serif")
                    ),
                  )
                ],
              ),
              verticalSpacer,
              Row(
                children: [
                  Expanded(
                      child: Text(
                    news.content,
                    softWrap: true,
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
