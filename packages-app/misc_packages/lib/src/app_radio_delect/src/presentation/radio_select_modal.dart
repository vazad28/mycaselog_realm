// ignore: prefer_relative_imports
import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../app_radio_select.dart';
import 'views/radio_select_view.dart';
import 'widgets/input_field.dart';
import 'widgets/select_dialog_bottom_bar.dart';

class RadioSelectModal<T> extends StatefulWidget {
  const RadioSelectModal({
    required this.items,
    required this.title,
    super.key,
    this.selectedValue,
    this.subTitle,
    this.allowAdd = false,
    this.onTitleTap,
  });

  /// List of items to select from.
  final List<RadioSelectOption<T>> items;

  /// The selected value before interaction.
  final T? selectedValue;

  /// The text at the top of the BottomSheet.
  final String title;

  /// The text at the top of the BottomSheet.
  final Widget? subTitle;

  /// allow add  new option
  final bool allowAdd;

  /// on titleTap
  final VoidCallback? onTitleTap;

  @override
  State<StatefulWidget> createState() => _RadioSelectModalState<T>();
}

class _RadioSelectModalState<T> extends State<RadioSelectModal<T>> {
  /// controller to allow scroll to the selected item if the list is long
  late ScrollController _controller;

  /// List of items to select from.
  List<RadioSelectOption<T>> _items = [];

  static double itemExtent = 48;

  @override
  void initState() {
    if (widget.items.isEmpty) {
      _controller = ScrollController();
      return;
    }

    _items = List<RadioSelectOption<T>>.from(widget.items);

    /// we wanna make sure items have all with selected = false
    // for (final RadioSelectOption item in _items) {
    //   item.selected = false;
    // }

    /// we wanna make sure items have all with selected = false
    _items.map((e) => e.copyWith(selected: false));

    /// find existing item per link criteria
    if (widget.selectedValue != null) {
      /// check if initial value exist
      final idx = _items.indexWhere(
        (e) =>
            e.value.toString().toLowerCase() ==
            widget.selectedValue.toString().toLowerCase(),
      );

      if (idx == -1) {
        _items.insert(
          0,
          RadioSelectOption<T>(
            value: widget.selectedValue as T,
            selected: true,
            editable: true,
          ),
        );
      } else {
        _items[idx] = _items[idx].copyWith(selected: true);
      }
    }

    //set the offset on scroll controller
    var offset = 0.0;
    if (widget.selectedValue != null) {
      final idx = widget.items.indexWhere((e) => e.selected);
      if (idx >= 0) offset = idx * itemExtent;
    }

    _controller = ScrollController(initialScrollOffset: offset);

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
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop<T?>(),
            child: Center(
              child: _items.isNotEmpty
                  ? RadioSelectView(
                      subTitle: widget.subTitle,
                      controller: _controller,
                      items: _items,
                    )
                  : Text(S.of(context).noOptions),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SelectDialogBottomBar(
          title: widget.title.titleCase,
          onTitleTap: widget.onTitleTap,
          onPop: () => Navigator.of(context).pop(),
          trailing: widget.allowAdd
              ? RawMaterialButton(
                  onPressed: addEditOption,
                  padding: const EdgeInsets.all(kFloatingActionButtonMargin),
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  elevation: 6,
                  constraints:
                      const BoxConstraints(minWidth: 36, minHeight: 36),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(kFloatingActionButtonMargin),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
              : null,
        ),
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
          labelText: S.current.addOption,
          onSubmitted: (option) {
            Navigator.of(ctx).pop();
            if (option == null) return;
            Navigator.of(context).pop(option.trim() as T);
          },
        );
      },
    );
  }
}
