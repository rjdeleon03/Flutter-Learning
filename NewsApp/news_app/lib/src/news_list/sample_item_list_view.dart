import 'dart:convert';

import 'package:flutter/material.dart';

import '../create_news/create_news_view.dart';
import 'news.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  
  List<News> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What\'s News?'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => navigateToCreate(context),
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              isThreeLine: true,
              title: Text(item.title),
              subtitle: Text(
                item.content,
                maxLines: 2,),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.pushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                  arguments: item
                );
              });
        },
      ),
    );
  }

  Future<void> navigateToCreate(BuildContext buildContext) async {
    final newNews = await Navigator.pushNamed(buildContext, CreateNewsView.routeName);
    if (!context.mounted) return;
    debugPrint("news: ${jsonEncode(newNews)}");
    if(newNews != null) {
      setState(() => items.add(newNews as News));
    }
  }
}
