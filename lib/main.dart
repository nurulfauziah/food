import 'package:food/state_util.dart';
import 'package:food/core.dart';
import 'package:flutter/material.dart';
import 'package:food/app/app.bottomsheets.dart';
import 'package:food/app/app.dialogs.dart';
import 'package:food/app/app.locator.dart';
import 'package:food/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.onboardingView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      )),
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
