import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart'; // homeCourseListProvider
import 'package:ulearning_app/features/search/view/widgets/search_widgets.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String keyword = "";

  // Filtres sélectionnés
  String? selectedCategory;
  double? minPrice;
  double? maxPrice;
  int? duration;

  @override
  Widget build(BuildContext context) {
    // Récupère tous les cours pour construire les filtres dynamiques
    final homeCoursesState = ref.watch(homeCourseListProvider);

    return homeCoursesState.when(
      data: (homeCourses) {
        // Nettoyage des catégories et suppression des doublons
        final categories = (homeCourses ?? [])
          .map((c) => c.categoryName?.trim())
          .where((name) => name != null && name.isNotEmpty)
          .cast<String>()
          .toSet()
          .toList();

          print("📌 Categories dynamiques: $categories");

        final allPrices = (homeCourses ?? []).map((c) => c.price ?? 0);
        final minPriceAvailable =
            allPrices.isEmpty ? 0.0 : allPrices.reduce((a, b) => a < b ? a : b).toDouble();
        final maxPriceAvailable =
            allPrices.isEmpty ? 1000.0 : allPrices.reduce((a, b) => a > b ? a : b).toDouble();

        final durations = (homeCourses ?? []).map((c) => c.lessonNum ?? 0).toSet().toList();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Search"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 25),
                child: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => FilterBottomSheet(
                        categories: categories,
                        minPrice: minPriceAvailable,
                        maxPrice: maxPriceAvailable,
                        durations: durations,
                        onApply: ({
                          String? category,
                          double? minPrice,
                          double? maxPrice,
                          int? duration,
                        }) {
                          setState(() {
                            selectedCategory = category;
                            this.minPrice = minPrice;
                            this.maxPrice = maxPrice;
                            this.duration = duration;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                const SizedBox(height: 20),
                searchBar(
                  controller: _controller,
                  onSearch: () {
                    setState(() => keyword = _controller.text);
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: CourseItemList(
                    keyword: keyword,
                    category: selectedCategory,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                    duration: duration,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Erreur: $error")),
    );
  }
}
