import 'package:flutter/material.dart';

import '../../domain/radio_select_option.dart';
import '../widgets/input_field.dart';
import '../widgets/modal_buttons.dart';
import '../widgets/radio_select_option_tile.dart';

class RadioSelectView<T> extends StatelessWidget {
  const RadioSelectView({
    required this.controller,
    required this.items,
    super.key,
    this.subTitle,
  });

  final Widget? subTitle;
  final ScrollController controller;
  final List<RadioSelectOption<T>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: kToolbarHeight),
        if (subTitle != null)
          SizedBox(
            height: kToolbarHeight,
            child: subTitle,
          ),
        Flexible(
          child: SingleChildScrollView(
            controller: controller,
            padding: kTabLabelPadding,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),),
            child: _RadioSelectBody<T>(items: items),
          ),
        ),
        const SizedBox(height: kMinInteractiveDimension * 0.5),
        const Divider(thickness: 0.5),
        const SizedBox(height: kMinInteractiveDimension * 0.5),
        SizedBox(
          height: kToolbarHeight,
          child: ModalDoneButton(
            icon: Icons.close,
            onPressed: () {
              try {
                Navigator.of(context).pop<T?>();
              } catch (err) {
                debugPrint(err.toString());
              }
            },
          ),
        ),
        //const SizedBox(height: kMinInteractiveDimension)
      ],
    );
  }
}

class _RadioSelectBody<T> extends StatelessWidget {
  const _RadioSelectBody({required this.items, super.key});
  final List<RadioSelectOption<T>> items;

  @override
  Widget build(BuildContext context) {
    final tiles = items.map<Widget>((item) {
      return RadioSelectOptionTile<T>(
        item: item,
        onTap: () {
          Navigator.pop(context, item.value);
        },
        trailing: !item.editable
            ? null
            : GestureDetector(
                child: const Icon(
                  Icons.edit,
                  size: 20,
                ),
                onTap: () {
                  editOption(context, item).then((value) {
                    if (value == null) return;
                    Navigator.pop(context, value.value);
                  });
                },
              ),
      );
    }).toList();

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: items.length < 9
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: tiles,);
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
          labelText: 'Edit option',
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
