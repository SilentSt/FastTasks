import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';

class AppSingleFilterWidget<T> extends StatefulWidget {
  const AppSingleFilterWidget({
    Key? key,
    required this.availableValues,
    this.value,
    this.tooltip,
    required this.callback,
    required this.buildName,
    required this.title,
    required this.clear,
  }) : super(key: key);

  final List<T> availableValues;
  final T? value;
  final String? tooltip;
  final Function(T? item) callback;
  final String Function(T? item) buildName;
  final String title;

  final VoidCallback clear;

  @override
  State<AppSingleFilterWidget<T>> createState() => _AppSingleFilterWidgetState<T>();
}

class _AppSingleFilterWidgetState<T> extends State<AppSingleFilterWidget<T>> {
  List<T> searchedItems = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchedItems = widget.availableValues.sublist(
      0,
      widget.availableValues.length > 30 ? 30 : widget.availableValues.length,
    );
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
            style: AppTypography.sf.s14.w600.black,
          ),
        ),
        SizedBox(
          width: 158,
          child: PopupMenuButton<T>(
            initialValue: widget.value,
            splashRadius: 0,
            constraints: const BoxConstraints(
              minWidth: 158,
            ),
            tooltip: widget.tooltip,
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: CupertinoSearchTextField(controller: searchController),
              ),
              PopupMenuItem(
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, update) {
                    searchController.addListener(() => search(update));
                    var displayedItems =
                        searchedItems.where((element) => widget.buildName(element).isNotEmpty).toList();
                    displayedItems = displayedItems.sublist(
                      0,
                      displayedItems.length > 30 ? 30 : displayedItems.length,
                    );
                    return SizedBox(
                      width: 300,
                      height: displayedItems.length * 40,
                      child: ListView(
                        children: [
                          for (int i = 0; i < (displayedItems.length > 30 ? 30 : displayedItems.length); i++)
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: CupertinoButton(
                                onPressed: () => widget.callback(displayedItems[i]),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                minSize: 0,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.buildName(displayedItems[i]),
                                    textAlign: TextAlign.start,
                                    style: AppTypography.sf.s16.w600.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
            offset: const Offset(0, 10),
            onSelected: widget.callback,
            child: SizedBox(
              width: 158,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorName.red,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        widget.buildName(widget.value),
                        style: AppTypography.sf.s14.w400.grey,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: ColorName.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        CupertinoButton(
          onPressed: widget.clear,
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            Icons.clear,
            color: ColorName.black,
            size: 32,
          ),
        ),
      ],
    );
  }
}
