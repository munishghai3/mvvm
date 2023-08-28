import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/auth/bindings/auth_bindings.dart';
import 'package:structure_mvvm/app/modules/auth/views/login/login_view.dart';
import 'package:structure_mvvm/app/modules/auth/views/register/register_view.dart';
import 'package:structure_mvvm/app/modules/home/bindings/home_binding.dart';
import 'package:structure_mvvm/app/modules/home/views/home_view.dart';
import 'package:structure_mvvm/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.loginScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}