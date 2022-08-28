import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/category_utils.dart';
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
    final size = MediaQuery.of(context).size;
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
            final categories = data.keys.toList();
            return GridView.count(
              crossAxisCount: 3,
              children: [
                ...categories.map(
                  (category) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: size.height * 0.04,
                          backgroundColor: categoryColors(category),
                          child: categoryIcon(category),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          category,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
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
