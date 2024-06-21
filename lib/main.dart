import 'package:countries_search/pages/homepage.dart';
import 'package:countries_search/route/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mvc/model/countries_search_bindings.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    initialBinding: CountriesSearchBindings(),
    home:  const Homepage(),
  ));
}
