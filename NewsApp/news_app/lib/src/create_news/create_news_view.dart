import 'package:flutter/material.dart';
import 'package:news_app/src/news_list/news.dart';

import 'create_news_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';
  static const Widget verticalSpacer = SizedBox(height: 24);
  static const Widget verticalSpacerWide = SizedBox(height: 48);

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final formKey = GlobalKey<FormState>();
    final titleTextController = TextEditingController();
    final contentTextController = TextEditingController();
    final tagsTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('What is new?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                verticalSpacer,
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Title'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  controller: titleTextController,
                ),
                verticalSpacer,
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Content'),
                  validator: (value) {
                    if (value!.length < 30) {
                      return 'Content must at least be 30 characters';
                    }
                    return null;
                  },
                  controller: contentTextController,
                ),
                verticalSpacer,
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Tags'),
                  controller: tagsTextController,
                ),
                verticalSpacerWide,
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.onError,
                    backgroundColor: colorScheme.error,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context, News(titleTextController.text, contentTextController.text));
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save News'),
                ),
                verticalSpacer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
