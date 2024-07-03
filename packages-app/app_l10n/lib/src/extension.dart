import 'package:flutter/widgets.dart';

import '../app_l10n.dart';

extension AppLocalizationsX on BuildContext {
  S get l10n => S.of(this);
}
