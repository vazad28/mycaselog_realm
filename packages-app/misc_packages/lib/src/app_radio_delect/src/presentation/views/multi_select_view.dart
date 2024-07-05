import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';

import '../../radio_select.dart';
import '../widgets/input_field.dart';
import '../widgets/modal_buttons.dart';
import '../widgets/multi_select_option_tile.dart';

class MultiSelectView<T> extends StatefulWidget {
  const MultiSelectView({
    required this.controller,
    required this.items,
    super.key,
    this.subTitle,
  });

  final Widget? subTitle;
  final ScrollController controller;
  final List<RadioSelectOption<T>> items;

  @override
  State<MultiSelectView<T>> createState() => _MultiSelectViewState<T>();
}

class _MultiSelectViewState<T> extends State<MultiSelectView<T>> {
  late List<RadioSelectOption<T>> items;

  @override
  void initState() {
    items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: kMinInteractiveDimension),
        if (widget.subTitle != null)
          SizedBox(
            height: kToolbarHeight,
            child: widget.subTitle,
          ),
        Flexible(
          child: items.isEmpty
              ? Text(S.of(context).noOptions)
              : SingleChildScrollView(
                  controller: widget.controller,
                  padding: kTabLabelPadding,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: _MultiSelectBody<T>(
                    items: items,
                    onChanged: (index, item) {
                      if (item == null) {
                        setState(() => items.removeAt(index));
                        return;
                      }

                      final idx = items
                          .indexWhere((element) => element.value == item.value);
                      if (idx != -1) setState(() => items[idx] = item);
                    },
                  ),
                ),
        ),
        const SizedBox(height: kMinInteractiveDimension * 0.5),
        const Divider(thickness: 0.5),
        const SizedBox(height: kMinInteractiveDimension * 0.5),
        SizedBox(
          height: kToolbarHeight,
          child: OverflowBar(
            children: [
              ModalCancelButton(
                onPressed: () => Navigator.of(context).pop<List<T>?>(),
              ),
              const SizedBox(width: 24),
              ModalDoneButton(
                onPressed: items.isEmpty
                    ? null
                    : () {
                        try {
                          Future<void>.delayed(Duration.zero, () {
                            final selectedItems =
                                items.where((e) => e.selected);
                            final selectedValues =
                                selectedItems.map((e) => e.value).toList();
                            Navigator.pop(context, selectedValues);
                          });
                        } catch (err) {
                          debugPrint(err.toString());
                        }
                      },
              ),
            ],
          ),
        ),
        //const SizedBox(height: kMinInteractiveDimension)
      ],
    );
  }
}

class _MultiSelectBody<T> extends StatelessWidget {
  const _MultiSelectBody({
    required this.items,
    required this.onChanged,
    super.key,
  });
  final List<RadioSelectOption<T>> items;
  final void Function(int index, RadioSelectOption<T>?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          items.length < 9 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: items.asMap().entries.map((item) {
        return MultiSelectOptionTile<T>(
          item: item.value,
          onChanged: (checked) {
            final newItemValue = item.value.copyWith(selected: checked);
            onChanged(item.key, newItemValue);
          },
          trailing: !item.value.editable
              ? null
              : GestureDetector(
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  onTap: () {
                    editOption(context, item.value).then((option) {
                      if (option == null) return;
                      if (option.value.toString().isEmpty) {
                        onChanged(item.key, null);
                        return;
                      }
                      onChanged(item.key, option);
                    });
                  },
                ),
        );
      }).toList(),
    );
  }

  ///  Open input alert for adding new item
  Future<RadioSelectOption<T>?> editOption(
    BuildContext context,
    RadioSelectOption<T> item,
  ) {
    //if (item.value != null) assert(item.value is String);
    return showModalBottomSheet<RadioSelectOption<T>?>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return RadioSelectInputField(
          labelText: 'Edit select option',
          initialValue: item.value?.toString(),
          onSubmitted: (option) {
            final newItem = item.copyWith(value: option as T);
            Navigator.of(ctx).pop(newItem);
          },
        );
      },
    );
  }
}
