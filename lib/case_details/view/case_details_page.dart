import 'dart:async';

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../core/core.dart';
import '../../router/router.dart';
import '../../settings/settings.dart';
import '../case_details.dart';

class CaseDetailsPage extends ConsumerStatefulWidget {
  const CaseDetailsPage({
    required this.caseID,
    this.activeTab,
    super.key,
  });

  final String caseID;
  final int? activeTab;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseDetailsPageState();
}

class _CaseDetailsPageState extends ConsumerState<CaseDetailsPage>
    with CaseDetailsMixin, TickerProviderStateMixin, LoggerMixin {
  /// Late insstance variales
  late int _activeTab;
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    /// active tab based on router or settings
    _activeTab =
        widget.activeTab ?? ref.read(settingsNotifierProvider).caseTileNavigate;

    if (_activeTab > 2) _activeTab = 0;

    /// set active tab
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: _activeTab)

          /// set listener for the tab change to update the bottom nav bar
          ..addListener(() {
            ref
                .watch(bottomNavVisibilityProvider.notifier)
                .update(value: _tabController.index != 2);
          });

    /// Seed the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(caseIDProvider.notifier).update((_) => widget.caseID);
    });

    if (_activeTab == 2) {
      Future<void>.delayed(Duration.zero).then((value) {
        ref.watch(bottomNavVisibilityProvider.notifier).update(value: false);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: CaseDetailsAppBar(
              tabController: _tabController,
              innerBoxIsScrolled: innerBoxIsScrolled,
              onMoreMenuTap: _onCaseDetailsMoreMenuTap,
            ),
          ),
        ];
      },
      body: AsyncValueWidget<CaseModel>(
        value: ref.watch(caseDetailsNotifierProvider),
        data: (data) {
          return CaseDetailsView(
            tabController: _tabController,
            onTap: _openAddCase,
          );
        },
      ),
    ));

    return PopScope(
      child: scaffold,
      onPopInvokedWithResult: (didPop, _) {
        if (!ref.read(bottomNavVisibilityProvider)) {
          ref.watch(bottomNavVisibilityProvider.notifier).update(
                value: true,
              );
        }
      },
    );
  }

  Future<void> _openAddCase(int index) {
    final currentCaseModel = watchCaseDetailsModel(ref).requireValue;
    return AddCaseRoute(caseID: currentCaseModel.caseID, tabIndex: index)
        .push<String?>(context);
  }

  Future<void> _onCaseDetailsMoreMenuTap() {
    return context
        .openActionsBottomSheet(caseDetailsActions.values.toList())
        .then((selected) {
      if (!mounted || selected == null) return null;

      if (selected.action == CaseDetailsActionEnum.generateCasePdf) {
        // ignore: use_build_context_synchronously
        // AppVars.rootContext.openModalScreen<CaseModel?>(
        //   CasePdfPage(
        //     caseModel: watchCaseDetailsModel(ref).requireValue,
        //   ),
        // );
      } else if (selected.action == CaseDetailsActionEnum.duplicateCase) {
        context.showSnackBar('Not implemented yet');
        // return AddCaseRoute(getDuplicateCase(ref))
        //     .push<String?>(context)
        //     .then((caseID) async {
        //   if (caseID != null) reSeedCaseDetailsPage(ref, caseID);
        // });
      } else if (selected.action == CaseDetailsActionEnum.deleteCase) {
        context.showSnackBar('Not implemented yet');
      }
    });
  }
}
