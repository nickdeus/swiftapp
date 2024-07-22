import 'package:get/get.dart';
import 'package:swiftapp/app/modules/home/dashboard.dart';
import 'package:swiftapp/app/modules/login/signin_screen.dart';
import 'package:swiftapp/app/modules/onboard/on_board_screen.dart';
import 'package:swiftapp/app/modules/register/signup_screen.dart';
import 'package:swiftapp/app/routes/routes.dart';

class AppPages {
  static const initial = Routes.onboard;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => Dashboard(),
        transition: Transition.rightToLeft,
        // transitionDuration: Duration(milliseconds: 200)
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => SignupScreen(),
        transition: Transition.rightToLeft,
        // transitionDuration: Duration(milliseconds: 200)
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => SigninScreen(),
        transition: Transition.rightToLeft,
       // transitionDuration: Duration(milliseconds: 200)
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => OnBoardScreen(),
        transition: Transition.rightToLeft,
        // transitionDuration: Duration(milliseconds: 200)
      // binding: LoginBinding(),
    ),
  ];
}


