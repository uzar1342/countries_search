import 'dart:developer';
import 'dart:io';

import 'package:countries_search/mvc/model/cd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../api_fetch/countrieapi.dart';

class CountriesSearchController extends GetxController {
   List<Cd> li=[];
   List<Cd> sc=[];
   
  RxBool check=false.obs;
  RxBool internet=false.obs;
  
  String scrch="";
  @override
  Future<void> onInit() async {
     check.value=false;
     internet.value=false;
     bool result = await InternetConnection().hasInternetAccess;
    if(result){
        Countrieapi a=Countrieapi();
        List<Cd> list= await a.getcountridata();
        li=list;
        sc=list;
        check.value=true;
        internet.value=true;
    }
    else{
      internet.value=false;
      Get.showSnackbar(
      GetSnackBar(
        title: "internet connection",
        message: 'NO Internet connection',
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 3),
      ),
    );
    }
  log(check.value.toString());
    super.onInit();
  }


Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
  
}
