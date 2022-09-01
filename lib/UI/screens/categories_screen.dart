import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/widgets/category_item.dart';
import 'package:quizz/UI/widgets/error_view.dart';
import 'package:quizz/core/controllers/category_controller.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(categoryNotifierProvider.notifier).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ref.watch(categoryNotifierProvider).maybeMap(
          orElse: () {
            return const SizedBox();
          },
          loading: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (e) {
            return ErrorView(
              errorText: e.failure.reason,
              onPressed: () => ref
                  .read(categoryNotifierProvider.notifier)
                  .getAllCategories(),
            );
          },
          success: (s) {
            final data = s.data as Map<String, List<dynamic>>;
            final categories = data.entries.toList();
            // final categories = data.keys.toList();
            // final categoryTags = List<List<String>>.from(data.values);
            return GridView.count(
              crossAxisCount: 3,
              children: [
                ...categories.map(
                  (category) {
                    return CategoryItem(category: category);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
