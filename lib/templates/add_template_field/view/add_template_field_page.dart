import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';
import 'package:state_of/state_of.dart';

import '../../../core/failures/app_failures.dart';
import '../../../router/router.dart';
import '../add_template_field.dart';

/// AddTemplateFieldPage ROOT Widget
class AddTemplateFieldPage extends ConsumerStatefulWidget {
  const AddTemplateFieldPage({
    required this.templateFieldModel,
    required this.newRecord,
    super.key,
  });

  final TemplateFieldModel templateFieldModel;
  final bool newRecord;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTemplateFieldPageController();
}

/// AddTemplateFieldPage CONTROLLER Widget
class _AddTemplateFieldPageController
    extends ConsumerState<AddTemplateFieldPage>
    with LoggerMixin, AddTemplateFieldMixin {
  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<TemplateFieldModel>>(addTemplateFieldNotifierProvider,
        (_, state) {
      if (state.isSuccess) {
        // all good so we get out
        //print(state.data?.toJson());
        Navigator.of(context).pop(state.data);
        return;
      }

      if (state.isFailure) {
        context.showInfoDialog(state.failure.toLocalizedString());
        return;
      }
    });

    final scaffold = Scaffold(
      appBar: AppBar(
        title: widget.newRecord
            ? Text(S.of(context).addField.titleCase)
            : Text(S.of(context).editField.titleCase),
        elevation: 1,
        actions: [
          TextButton(
            child: Text(S.of(context).save),
            onPressed: () => submit(ref),
          ),
        ],
      ),
      body: _AddTemplateFieldPageView(this),
    );

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        ref
            .watch(bottomNavVisibilityProvider.notifier)
            .update(value: visibility);
      },
      routeObserver:
          ref.read(shellRoutesObserversProvider).settingsRouteObserver,
      child: scaffold,
    );
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      seedFormProvider(ref, widget.templateFieldModel);
    });

    super.initState();
  }

  bool get _isFormSeeded => isFormSeeded(ref);
}

/// AddTemplateFieldPage VIEW Widget
class _AddTemplateFieldPageView
    extends WidgetView<AddTemplateFieldPage, _AddTemplateFieldPageController> {
  const _AddTemplateFieldPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return !state._isFormSeeded
        ? const Loading()
        : const AddTemplateFieldForm();
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
// class _SubmitButton extends ConsumerWidget
//     with AddTemplateFieldStateMixin, AddTemplateFieldEventMixin {
//   const _SubmitButton();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final status = formSubmitStatus(ref);

//     return status.maybeWhen(
//       loading: (_) => IconButton(
//         onPressed: () => {},
//         icon: const Spinner(),
//       ),
//       orElse: () => TextButton(
//         child: Text(S.of(context).save),
//         onPressed: () => submit(ref),
//       ),
//     );
//   }
// }
