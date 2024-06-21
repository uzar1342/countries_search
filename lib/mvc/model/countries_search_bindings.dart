import 'package:get/get.dart';
import '../controller/countries_search_controller.dart';

class CountriesSearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CountriesSearchController());
  }
}
