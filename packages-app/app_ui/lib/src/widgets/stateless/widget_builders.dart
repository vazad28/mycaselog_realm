import 'package:flutter/material.dart';

Widget buildErrorWidget(Object? error, StackTrace? stackTrace) =>
    ErrorWidget(error ?? 'Unknown Error');

Widget buildLoadingWidget() =>
    const Center(child: CircularProgressIndicator.adaptive());

/// Slivers
Widget buildErrorSliver(Object? error, StackTrace? stackTrace) =>
    SliverToBoxAdapter(child: ErrorWidget('Unknown Error'));

Widget buildLoadingSliver() => const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
