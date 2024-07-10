import 'dart:async';

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
import '../../../core/providers/providers.dart';
import '../../../router/routes/routes.dart';
import '../add_template.dart';

/// AddTemplatePage ROOT Widget
class AddTemplatePage extends ConsumerStatefulWidget {
  const AddTemplatePage({required this.templateID, super.key});

  final String templateID;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTemplatePageController();
}

/// AddTemplatePage CONTROLLER Widget
class _AddTemplatePageController extends ConsumerState<AddTemplatePage>
    with LoggerMixin, AddTemplateStateMixin {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _seedTemplate();
    });

    super.initState();
  }

  /// Widget builder method
  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<TemplateModel>>(addTemplateNotifierProvider, (_, state) {
      if (state.isSuccess) {
        // all good so we get out
        Navigator.of(context).pop(state.data?.templateID);
        return;
      }

      if (state.isFailure) {
        context.showInfoDialog(state.failure.toLocalizedString());
        return;
      }
    });

    final scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primaryContainer,
        foregroundColor: context.colorScheme.onPrimaryContainer,
        title: widget.templateID == AddTemplateRoute.newItemParam
            ? Text(S.of(context).addTemplate.titleCase)
            : Text(S.of(context).editTemplate.titleCase),
        actions: const [_SubmitButton()],
      ),
      body: _AddTemplatePageView(this),
    );

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        switchNavBarVisibility(ref, visibility: visibility);
      },
      routeObserver: pageRouteObserver(ref),
      child: scaffold,
    );
  }

  /// controller methods
  bool get _isFormSeeded => isFormSeeded(ref);

  Future<void> _needUserSpeciality() async {
    final res = await context.showConfirmDialog(
      'No user speciality in profile. Select user speciality now?',
    );
    if (!mounted) return;

    if (!res) {
      Navigator.of(context).pop();
    } else {
      unawaited(
        const UserProfileRoute().push<void>(context).then((_) {
          _seedTemplate();
        }),
      );
    }
  }

  void _seedTemplate() {
    final userID = ref.read(authenticationUserProvider).id;
    final userModel =
        ref.read(dbProvider).usersCollection.getSingle('userID', userID);

    if (userModel?.speciality?.isEmpty ?? true) {
      _needUserSpeciality();
    } else {
      seedFormProvider(ref, widget.templateID, userModel!.speciality!);
    }
  }
}

/// AddTemplatePage VIEW Widget
class _AddTemplatePageView
    extends WidgetView<AddTemplatePage, _AddTemplatePageController> {
  const _AddTemplatePageView(super.state);

  @override
  Widget build(BuildContext context) {
    return !state._isFormSeeded ? const Loading() : const AddTemplateForm();
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget
    with AddTemplateStateMixin, AddTemplateEventMixin {
  const _SubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = formSubmitStatus(ref);

    return status.maybeWhen(
      loading: (_) => IconButton(
        onPressed: () => {},
        icon: const Spinner(),
      ),
      orElse: () => TextButton(
        child: Text(S.of(context).save),
        onPressed: () => submit(ref),
      ),
    );
  }
}
