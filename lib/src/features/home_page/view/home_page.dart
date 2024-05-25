import 'package:bdt_hakaton/src/common/mock_data/home_categories.dart';
import 'package:bdt_hakaton/src/features/home_page/view/components/category_chip.dart';
import 'package:bdt_hakaton/src/features/home_page/view/components/category_header.dart';
import 'package:bdt_hakaton/src/features/home_page/view/components/choosen_fragment.dart';
import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final Map<String, GlobalKey> _categoryKeys = {
    for (var category in categories) category: GlobalKey()
  };
  final ItemScrollController _menuController = ItemScrollController();
  final ItemPositionsListener _itemListener = ItemPositionsListener.create();

  int current = 0;
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    _itemListener.itemPositions.addListener(() {
      final lastVisibleIndex = _itemListener.itemPositions.value.isNotEmpty
          ? _itemListener.itemPositions.value.last.index
          : current;

      if (lastVisibleIndex != current && !inProgress) {
        setCurrent(lastVisibleIndex);
      }
    });
  }

  void setCurrent(int newCurrent) {
    setState(() {
      current = newCurrent;
    });
  }

  void menuScrollToCategory(int ind) async {
    inProgress = true;
    _menuController.scrollTo(
        index: ind, duration: const Duration(microseconds: 400));
    await Future.delayed(const Duration(milliseconds: 400));
    inProgress = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ColoredBox(
              color: AppColors.lightGrey,
              child: SizedBox(
                width: double.infinity,
                child: ScrollablePositionedList.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  initialAlignment: 0,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final itemWidth =
                        MediaQuery.of(context).size.width / categories.length;
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == categories.length - 1 ? 0 : 16),
                      child: SizedBox(
                        width: itemWidth,
                        child: CategoryChip(
                          text: category,
                          isSelected: index == current,
                          onSelected: () {
                            setCurrent(index);
                            menuScrollToCategory(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          body: ScrollablePositionedList.builder(
            itemScrollController: _menuController,
            itemPositionsListener: _itemListener,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryHeader(
                    key: _categoryKeys[category],
                    categoryName: category,
                  ),
                  ChoosenFragment(
                    index: index,
                  ),
                  const SizedBox(height: 50.0),
                  const Divider(
                    indent: 32.0,
                    endIndent: 32.0,
                    color: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 50.0)
                ],
              );
            },
            itemCount: categories.length,
          )),
    );
  }
}
