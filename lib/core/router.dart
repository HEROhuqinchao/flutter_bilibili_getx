import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/main/main_binding.dart';
import '../ui/main/main_view.dart';

class AsRouter {
  static const String initialRoute = MainScreen.routeName;
  static List<GetPage> getPages = [
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),

  ];
}