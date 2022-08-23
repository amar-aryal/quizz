import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

Icon categoryIcon(String category) {
  if (category == 'Arts & Literature') {
    return const Icon(Icons.draw_outlined, color: Colors.white);
  } else if (category == 'Film & TV') {
    return const Icon(Icons.movie_creation, color: Colors.white);
  } else if (category == 'Food & Drink') {
    return const Icon(Icons.fastfood, color: Colors.white);
  } else if (category == 'General Knowledge') {
    return const Icon(Icons.book, color: Colors.white);
  } else if (category == 'Geography') {
    return const Icon(CupertinoIcons.globe, color: Colors.white);
  } else if (category == 'History') {
    return const Icon(Icons.punch_clock, color: Colors.white);
  } else if (category == 'Music') {
    return const Icon(Icons.music_note, color: Colors.white);
  } else if (category == 'Science') {
    return const Icon(Icons.science, color: Colors.white);
  } else if (category == 'Society & Culture') {
    return const Icon(CupertinoIcons.group_solid, color: Colors.white);
  } else {
    return const Icon(Icons.sports_handball_rounded, color: Colors.white);
  }
}

Color? categoryColors(String category) {
  if (category == 'Arts & Literature') {
    return Colors.blue[400];
  } else if (category == 'Film & TV') {
    return Colors.green[400];
  } else if (category == 'Food & Drink') {
    return Colors.purple[400];
  } else if (category == 'General Knowledge') {
    return Colors.yellow[700];
  } else if (category == 'Geography') {
    return Colors.red[400];
  } else if (category == 'History') {
    return Colors.cyan[400];
  } else if (category == 'Music') {
    return Colors.pink[300];
  } else if (category == 'Science') {
    return Colors.indigo[400];
  } else if (category == 'Society & Culture') {
    return Colors.greenAccent[400];
  } else {
    return Colors.blue[800];
  }
}
