import 'package:food/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:food/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:food/ui/views/home/home_view.dart';
import 'package:food/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food/ui/views/login/login_view.dart';
import 'package:food/ui/views/onboarding/onboarding_view.dart';
import 'package:food/ui/views/home/home_view.dart';
import 'package:food/ui/views/bottom_nav/bottom_nav_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: BottomNavView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
