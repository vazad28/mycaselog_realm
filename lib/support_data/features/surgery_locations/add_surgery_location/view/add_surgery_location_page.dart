import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:state_of/state_of.dart';

import '../add_surgery_location.dart';

/// AddSurgeryLocationPage ROOT Widget
class AddSurgeryLocationPage extends ConsumerStatefulWidget {
  const AddSurgeryLocationPage({
    required this.surgeryLocationModel,
    super.key,
    this.newRecord = false,
  });

  final bool newRecord;
  final SurgeryLocationModel surgeryLocationModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSurgeryLocationPageController();
}

/// AddSurgeryLocationPage CONTROLLER Widget
class _AddSurgeryLocationPageController
    extends ConsumerState<AddSurgeryLocationPage>
    with LoggerMixin, AddSurgeryLocationStateMixin {
  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<SurgeryLocationModel>>(
        addSurgeryLocationNotifierProvider, (_, state) {
      if (state.isSuccess) {
        // all good so we get out
        Navigator.of(context).pop(state.data);
        return;
      }

      if (state.isFailure) {
        context.showInfoDialog(state.failure.toString());
        return;
      }
    });

    final scaffold = Scaffold(
      body: Center(
        child: _AddSurgeryLocationPageView(this),
      ),
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

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      seedFormProvider(ref, widget.surgeryLocationModel);
    });

    super.initState();
  }

  bool get _isFormSeeded => isFormSeeded(ref);
}

/// AddSurgeryLocationPage VIEW Widget
class _AddSurgeryLocationPageView extends WidgetView<AddSurgeryLocationPage,
    _AddSurgeryLocationPageController> {
  const _AddSurgeryLocationPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return !state._isFormSeeded
        ? const Loading()
        : AddSurgeryLocationForm(
            title: state.widget.newRecord ? 'Add Location' : 'Edit Location',
            submitButton: const _SubmitButton(),
          );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget
    with AddSurgeryLocationStateMixin, AddSurgeryLocationEventMixin {
  const _SubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = formSubmitStatus(ref);

    return status.maybeWhen(
      loading: (_) => IconButton(
        onPressed: () => {},
        icon: const Spinner(),
      ),
      orElse: () => FormSubmitButtonBar(
        onCancel: () => Navigator.of(context).pop(),
        onSubmit: () => submit(ref),
      ),
    );
  }
}
