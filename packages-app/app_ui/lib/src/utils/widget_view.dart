// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';

/// Original idea by staff og GSkinner, see this article:
/// https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html
/// Usage for stateless is:
/// '''dart

///@author Fredrick Allan Grott
abstract class WidgetView<T1, T2> extends StatelessWidget {
  const WidgetView(this.state, {super.key});

  final T2 state;

  T1 get widget => (state as State).widget as T1;

  @override
  Widget build(BuildContext context);
}

abstract class StatelessView<T1> extends StatelessWidget {
  const StatelessView(this.widget, {super.key});

  final T1 widget;

  @override
  Widget build(BuildContext context);
}
