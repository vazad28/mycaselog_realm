import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auto_complete/auto_complete.dart';
import '../../../core/app_mixins.dart';
import '../../../core/core.dart';
import '../../../settings/settings.dart';
import '../../add_case.dart';

part '../../../generated/add_case/view/forms/forms.g.dart';

/// basic data form
part './basic_data/basic_data_fields.dart';
part './basic_data/basic_data_form.dart';
part './basic_data/basic_data_form_group.dart';

/// patient data
part './patient_data/add_patient_modal.dart';
part './patient_data/patient_data_fields.dart';
part './patient_data/patient_data_form.dart';
part './patient_data/patient_data_form_group.dart';

/// template data
part './templated_data/templated_data_form.dart';
part './templated_data/templated_data_form_group.dart';
