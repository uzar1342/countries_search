import 'package:countries_search/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/countries_search_controller.dart';

class CountriesSearchPage extends GetView<CountriesSearchController> {
  const CountriesSearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controler = Get.find<CountriesSearchController>();

    return Scaffold(
      
      body: GetBuilder<CountriesSearchController>(
        builder: (_) {
          return CountrieCard(controler.sc);
        },
      ),
    );
  }
}
