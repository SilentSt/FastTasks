import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AppMultiFilterWidget<T> extends StatefulWidget {
  const AppMultiFilterWidget({
    Key? key,
    required this.availableValues,
    this.tooltip,
    required this.callback,
    required this.buildName,
    required this.buildTitle,
    required this.selectedItems,
    required this.title,
    required this.clear,
  }) : super(key: key);

  final List<T> selectedItems;
  final List<T> availableValues;
  final String? tooltip;
  final Function(T item) callback;
  final String Function(T? item) buildName;
  final String Function(List<T?> selectedItems) buildTitle;
  final String title;

  final VoidCallback clear;

  @override
  State<AppMultiFilterWidget<T>> createState() => _AppMultiFilterWidgetState<T>();
}

class _AppMultiFilterWidgetState<T> extends State<AppMultiFilterWidget<T>> {
  List<T> searchedItems = [];
  List<T> selectedItems = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchedItems = widget.availableValues;
    super.initState();
  }

  void search(Function update) {
    List<T> filteredItems = [];
    for (final item in widget.availableValues) {
      if (widget.buildName(item).toLowerCase().contains(searchController.text.toLowerCase())) {
        filteredItems.add(item);
      }
    }
    update(() {
      searchedItems = filteredItems;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(
            widget.title,
            style: AppTypography.sf.s14.w600,
          ),
        ),
        SizedBox(
          width: 158,
          child: PopupMenuButton<T>(
            splashRadius: 0,
            constraints: const BoxConstraints(
              minWidth: 158,
            ),
            tooltip: widget.tooltip,
            position: PopupMenuPosition.over,
            color: CupertinoColors.darkBackgroundGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: CupertinoSearchTextField(
                  controller: searchController,
                  style: AppTypography.sf.s14.w400.lightGrey,
                ),
              ),
              PopupMenuItem(
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, update) {
                    searchController.addListener(() => search(update));
                    return Column(
                      children: searchedItems
                          .map(
                            (e) => CupertinoButton(
                              onPressed: () {
                                update(() {
                                  if (selectedItems.contains(e)) {
                                    selectedItems.remove(e);
                                  } else {
                                    selectedItems.add(e);
                                  }
                                });
                                widget.callback(e);
                              },
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              minSize: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.buildName(e),
                                    style: AppTypography.sf.s16.w600,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: selectedItems.contains(e) ? ColorName.purple : ColorName.white,
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                          color: selectedItems.contains(e) ? ColorName.purple : ColorName.grey,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: ColorName.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
            offset: const Offset(0, 10),
            onSelected: (_) {},
            child: SizedBox(
              width: 158,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorName.purple,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        widget.buildTitle(widget.selectedItems),
                        style: AppTypography.sf.s14.w400,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: ColorName.purple,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        CupertinoButton(
          onPressed: () {
            selectedItems.clear();
            widget.clear();
          },
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            Icons.clear,
            color: ColorName.purple,
            size: 32,
          ),
        ),
      ],
    );
  }
}
