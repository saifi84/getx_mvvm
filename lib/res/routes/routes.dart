import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_view.dart';
import 'package:getx_mvvm/view/login/login_view.dart';
import 'package:getx_mvvm/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(microseconds: 200),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => LoginView(),
          transitionDuration: Duration(microseconds: 200),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => HomeView(),
          transitionDuration: Duration(microseconds: 200),
          transition: Transition.leftToRight,
        )
      ];
}
