import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StackedView<BottomNavViewModel> {
  final int? initialIndex;

  const BottomNavView({
    super.key,
    this.initialIndex,
  });

  @override
  Widget builder(
    BuildContext context,
    BottomNavViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: ExtendedNavigator(
          // navigatorKey:
          //     StackedService.nestedNavigationKey(viewModel.navigationKey),
          // router: BottomNavViewRouter(),
          // initialRoute: viewModel.views[viewModel.currentIndex].route,
          ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Row(
          children: [
            // BottonNavFloatingBar(),
            // SizedBox(
            //   width: 16,
            // ),
            // BottomNavAddButton()
          ],
        ),
      ),
    );
  }

  @override
  BottomNavViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavViewModel();

  @override
  void onViewModelReady(BottomNavViewModel viewModel) {
    super.onViewModelReady(viewModel);
    // viewModel.init(initialIndex);
  }
}
