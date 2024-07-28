import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:state_of/state_of.dart';

import '../add_case.dart';

/// AddCasePage ROOT Widget
class AddCasePage extends ConsumerStatefulWidget {
  const AddCasePage({
    //required this.caseModel,
    //required this.newRecord,
    required this.caseID,
    super.key,
    this.tabIndex = 0,
  });

  final int tabIndex;
  final String caseID;
  // final bool newRecord;
  // final CaseModel caseModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCasePageController();
}

/// AddCasePage CONTROLLER Widget
class _AddCasePageController extends ConsumerState<AddCasePage>
    with SingleTickerProviderStateMixin, LoggerMixin, AddCaseMixin {
  /// late variable
  late TabController _tabController;

  @override
  void initState() {
    /// set controller for tabs
    _tabController = TabController(vsync: this, length: 2);

    /// Seed the case provider
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.watch(addCaseSeederProvider.notifier).seed(widget.caseID);

      Future<void>.delayed(const Duration(milliseconds: 300)).then((value) {
        if (widget.tabIndex > 0) _tabController.animateTo(widget.tabIndex);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<CaseModel>>(addCaseNotifierProvider, (prev, next) {
      if (next.isSuccess) {
        logger.info('AddCaseForm submit success');

        /// we send the caseModel caseID to reload the caseModel on caseDetails
        /// screeen on pop and update the view with new values
        Navigator.of(context).pop();
        return;
      }

      if (next.isFailure) {
        switch (next.failure) {
          case BasicTabFormValidationError():
            return _tabController.animateTo(0);
          case TemplateTabFormValidationError():
            return _tabController.animateTo(1);
          default:
            logger.severe(next.failure);
            context.showSnackBar(next.failure.toString());
        }
      }
    });

    final scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primaryContainer,
        foregroundColor: context.colorScheme.onPrimaryContainer,
        title: Text(
          widget.caseID == 'new' ? 'Add Case' : 'Edit Case',
        ),
        actions: const [
          _SubmitButton(),
        ],
        bottom: AddCaseTabBar(tabController: _tabController),
      ),
      body: _AddCasePageView(this),
    );

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        switchNavBarVisibility(ref, visibility: visibility);
      },
      routeObserver: pageRouteObserver(ref),
      child: scaffold,
    );

    //return scaffold;
  }

  /// controller methods
  bool get _isFormSeeded => isFormSeeded(ref);
}

/// AddCasePage VIEW Widget
class _AddCasePageView extends WidgetView<AddCasePage, _AddCasePageController> {
  const _AddCasePageView(super.state);

  @override
  Widget build(BuildContext context) {
    return !state._isFormSeeded
        ? const Loading()
        : SafeArea(
            top: false, //critical
            child: TabBarView(
              controller: state._tabController,
              children: const [
                KeepAliveWrapper(
                  key: Key('__basic_case_data_add_case_tab__'),
                  child: BasicDataTabView(),
                ),
                KeepAliveWrapper(
                  key: Key('__template_case_data_add_case_tab__'),
                  child: TemplateDataTabView(),
                ),
              ],
            ),
          );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Local class
/// ////////////////////////////////////////////////////////////////////

class _SubmitButton extends ConsumerWidget with AddCaseMixin {
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
        onPressed: () => onSubmit(ref),
      ),
    );
  }
}
