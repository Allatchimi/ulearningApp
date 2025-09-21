import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/search/provider/search_controller.dart';
import 'package:ulearning_app/common/models/course_entities.dart';

/// ------------------
///   COURSE LIST
/// ------------------
class CourseItemList extends ConsumerStatefulWidget {
  final String keyword;
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final int? duration;

  const CourseItemList({
    super.key,
    required this.keyword,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.duration,
  });

  @override
  ConsumerState<CourseItemList> createState() => _CourseItemListState();
}

class _CourseItemListState extends ConsumerState<CourseItemList> {
  @override
  Widget build(BuildContext context) {
    // Liste des cours filtrée par mot-clé
    final courseState = ref.watch(searchCourseListProvider(widget.keyword));

    return courseState.when(
      data: (courses) {
        // Appliquer le filtre choisi par l'utilisateur
        final filtered = courses.where((c) {
          final matchCategory = widget.category == null ||
              (c.categoryName ?? "")
                  .toLowerCase()
                  .contains(widget.category!.toLowerCase());

          final matchMinPrice =
              widget.minPrice == null || (c.price ?? 0) >= widget.minPrice!;
          final matchMaxPrice =
              widget.maxPrice == null || (c.price ?? 0) <= widget.maxPrice!;
          final matchDuration =
              widget.duration == null || (c.lessonNum ?? 0) >= widget.duration!;

          return matchCategory && matchMinPrice && matchMaxPrice && matchDuration;
        }).toList();

        if (filtered.isEmpty) {
          return const Center(child: Text("Aucun cours trouvé"));
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (_, index) {
            final course = filtered[index];
            return Container(
              margin: EdgeInsets.only(top: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              width: 325.w,
              height: 80.h,
              decoration: appBoxShadow(
                radius: 30,
                sR: 2,
                bR: 3,
                color: AppColors.primarySecondaryBackground,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    "/course_detail",
                    arguments: {"id": course.id!},
                  );
                },
                child: Row(
                  children: [
                    AppBoxDecoratioonImage(
                      width: 60.w,
                      height: 60.w,
                      imagePath:
                          "${AppConstants.SERVER_API_URL}${course.thumbnail!}",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text13Normal(text: course.name ?? "Sans titre"),
                        Text10Normal(
                          text: course.description ?? "Pas de description",
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Erreur: $error")),
    );
  }
}

/// ------------------
///   FILTER SHEET DYNAMIQUE
/// ------------------

class FilterBottomSheet extends StatefulWidget {
  final List<String> categories;
  final double minPrice;
  final double maxPrice;
  final List<int> durations;
  final void Function({
    String? category,
    double? minPrice,
    double? maxPrice,
    int? duration,
  }) onApply;

  const FilterBottomSheet({
    super.key,
    required this.categories,
    required this.minPrice,
    required this.maxPrice,
    required this.durations,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedCategory;
  RangeValues? selectedPrice;
  int? selectedDuration;

  @override
  void initState() {
    super.initState();
    selectedPrice = RangeValues(widget.minPrice, widget.maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Search Filter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),

          const SizedBox(height: 12),
          const Text("Categories", style: TextStyle(fontWeight: FontWeight.w600)),

          Wrap(
            spacing: 8,
            children: widget.categories.map((cat) {
              final cleanCat = cat.trim(); // Nettoyage des espaces
              final isSelected = selectedCategory == cleanCat;
              return ChoiceChip(
                label: Text(cleanCat),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedCategory = isSelected ? null : cleanCat;
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
          const Text("Price", style: TextStyle(fontWeight: FontWeight.w600)),

          RangeSlider(
            values: selectedPrice!,
            min: widget.minPrice,
            max: widget.maxPrice,
            divisions: 10,
            labels: RangeLabels(
              "\$${selectedPrice!.start.toInt()}",
              "\$${selectedPrice!.end.toInt()}",
            ),
            onChanged: (values) {
              setState(() => selectedPrice = values);
            },
          ),

          const SizedBox(height: 16),
          const Text("Duration", style: TextStyle(fontWeight: FontWeight.w600)),

          Wrap(
            spacing: 8,
            children: widget.durations.map((d) {
              final isSelected = selectedDuration == d;
              return ChoiceChip(
                label: Text("$d Lessons"),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedDuration = isSelected ? null : d;
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              widget.onApply(
                category: selectedCategory,
                minPrice: selectedPrice?.start,
                maxPrice: selectedPrice?.end,
                duration: selectedDuration,
              );
              Navigator.pop(context);
            },
            child: const Text("Apply Filter"),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedCategory = null;
                selectedPrice = RangeValues(widget.minPrice, widget.maxPrice);
                selectedDuration = null;
              });
            },
            child: const Text("Clear All"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
