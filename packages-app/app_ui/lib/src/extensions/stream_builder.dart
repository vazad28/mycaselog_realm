import 'package:flutter/material.dart';

import '../../app_ui.dart';

extension StreamBuilderX on Widget {
  StreamBuilder streamBuilder<T>(
          {required Stream<T> stream,
          required Widget Function(T? data) childBuilder}) =>
      StreamBuilder<T>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildLoadingWidget(); // Display a loading indicator while waiting for data
          } else if (snapshot.hasError) {
            return buildErrorWidget(
                snapshot.error, StackTrace.current); // Handle errors
          } else if (!snapshot.hasData) {
            return const SizedBox(child: Text('No data'));
            //return YourNoDataWidget(); // Handle the case when there's no data
          } else {
            // Display your UI with the data
            return childBuilder(snapshot.data);
          }
        },
      );
}
