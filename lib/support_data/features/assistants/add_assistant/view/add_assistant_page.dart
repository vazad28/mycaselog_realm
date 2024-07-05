import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:state_of/state_of.dart';

import '../add_assistant.dart';

/// AddAssistantPage ROOT Widget
class AddAssistantPage extends ConsumerStatefulWidget {
  const AddAssistantPage({
    required this.assistantModel,
    super.key,
    this.newRecord = false,
  });

  final bool newRecord;
  final AssistantModel assistantModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAssistantPageController();
}

/// AddAssistantPage CONTROLLER Widget
class _AddAssistantPageController extends ConsumerState<AddAssistantPage>
    with LoggerMixin, AddAssistantStateMixin {
  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<AssistantModel>>(addAssistantNotifierProvider,
        (_, state) {
      if (state.isSuccess) {
        // all good so we get out
        Navigator.of(context).pop();
        return;
      }

      if (state.isFailure) {
        context.showInfoDialog(state.failure.toString());
        return;
      }
    });

    final scaffold = Scaffold(
      body: Center(
        child: _AddAssistantPageView(this),
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
      seedFormProvider(ref, widget.assistantModel);
    });

    super.initState();
  }

  bool get _isFormSeeded => isFormSeeded(ref);
}

/// AddAssistantPage VIEW Widget
class _AddAssistantPageView
    extends WidgetView<AddAssistantPage, _AddAssistantPageController> {
  const _AddAssistantPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return !state._isFormSeeded
        ? const Loading()
        : AddAssistantForm(
            title: state.widget.newRecord ? 'Add Assistant' : 'Edit Assistant',
            submitButton: const _SubmitButton(),
          );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget
    with AddAssistantStateMixin, AddAssistantEventMixin {
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
