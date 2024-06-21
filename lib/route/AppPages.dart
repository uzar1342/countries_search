import 'package:countries_search/pages/homepage.dart';
import 'package:get/get.dart';

import '../pages/CountrieDetail.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Homepage(),
    ),
    GetPage(name: Routes.CountrieDetail, page:()=> CountrieDetail() ),
  ];
}
