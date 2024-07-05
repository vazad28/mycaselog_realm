// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../radio_select.dart';
import 'views/multi_select_view.dart';
import 'widgets/input_field.dart';
import 'widgets/modal_buttons.dart';
import 'widgets/select_dialog_bottom_bar.dart';

class MultiSelectModal<T> extends StatefulWidget {
  const MultiSelectModal({
    required this.items,
    required this.title,
    super.key,
    this.selectedValues,
    this.subTitle,
    this.allowAdd = false,
    this.onTitleTap,
  });

  /// List of items to select from.
  final List<RadioSelectOption<T>> items;

  /// The selected value before interaction.
  final List<T>? selectedValues;

  /// The text at the top of the BottomSheet.
  final String title;

  /// The text at the top of the BottomSheet.
  final Widget? subTitle;

  /// allow add  new option
  final bool allowAdd;

  /// on titleTap
  final VoidCallback? onTitleTap;

  @override
  State<StatefulWidget> createState() => _MultiSelectModalState<T>();
}

class _MultiSelectModalState<T> extends State<MultiSelectModal<T>> {
  /// controller to allow scroll to the selected item if the list is long
  late ScrollController _controller;

  /// List of items to select from.
  late List<RadioSelectOption<T>> _items;

  static int itemExtent = 48;

  @override
  void initState() {
    _items = List<RadioSelectOption<T>>.from(widget.items);

    /// we wanna make sure items have all with selected = false
    _items.map((e) => e.copyWith(selected: false));

    /// find existing item per link criteria
    if (widget.selectedValues != null) {
      for (final item in widget.selectedValues!) {
        /// check if initial value exist
        final idx = _items.indexWhere(
          (e) =>
              e.value.toString().toLowerCase() == item.toString().toLowerCase(),
        );
        if (idx == -1) {
          _items.insert(
            0,
            RadioSelectOption<T>(
              value: item,
              selected: true,
              editable: true,
            ),
          );
        } else {
          _items[idx] = _items[idx].copyWith(selected: true);
        }
      }
    }

    //set the offset on scroll controller
    var offset = 0;
    if (widget.selectedValues != null) {
      final idx = widget.items.indexWhere((e) => e.selected);
      if (idx >= 0) offset = idx * itemExtent;
    }

    _controller = ScrollController(initialScrollOffset: offset.toDouble());

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: SafeArea(
          // child: GestureDetector(
          //   behavior: HitTestBehavior.opaque,
          //   onTap: () => Navigator.of(context).pop<List<T>?>(),
          child: Center(
            child: MultiSelectView(
              subTitle: widget.subTitle,
              controller: _controller,
              items: _items,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SelectDialogBottomBar(
        title: widget.title.titleCase,
        onTitleTap: widget.onTitleTap,
        onPop: () => Navigator.of(context).pop(),
        trailing: widget.allowAdd
            ? ModalAddOptionButton(
                onPressed: addEditOption,
              )
            : null,
      ),
    );
  }

  ///  Open input alert for adding new item
  Future<void> addEditOption() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return RadioSelectInputField(
          labelText: 'Add select option',
          onSubmitted: (option) {
            Navigator.of(ctx).pop();
            if (option == null) return;

            setState(() {
              _items.add(
                RadioSelectOption(
                  value: option.trim() as T,
                  editable: true,
                  selected: true,
                ),
              );
            });
          },
        );
      },
    );
  }
}
