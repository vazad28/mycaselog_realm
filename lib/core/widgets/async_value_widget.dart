// Generic AsyncValueWidget to work with values of type T
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    super.key,
    this.loading,
  });

  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;
  // bool to show loading animation or nothing
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => Center(child: loading ?? const SizedBox.shrink()),
      error: (err, __) => _AsyncErrorWidget(err),
    );
  }
}

class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    required this.value,
    required this.data,
    super.key,
    this.loading,
  });

  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;
  // bool to show loading animation or nothing
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        loading: () => SliverToBoxAdapter(
              child: Center(
                child: loading ?? const SizedBox.shrink(),
              ),
            ),
        error: (err, __) => SliverToBoxAdapter(
              child: _AsyncErrorWidget(err),
            ));
  }
}

class _AsyncErrorWidget extends StatelessWidget {
  const _AsyncErrorWidget(this.err, {super.key});

  final Object err;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        err.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.red),
      ),
    );
  }
}
