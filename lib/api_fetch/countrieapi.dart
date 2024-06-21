import 'dart:convert';
import 'dart:developer';
import 'package:countries_search/mvc/model/cd.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Countrieapi {

  Future<List<Cd>> getcountridata() async {
     List<Cd> list=[];
    try {
      final dio = Dio();
      final response = await dio.get('https://restcountries.com/v3.1/all');
    // log("🚀 ~ Countrieapi ~ getcountridata ~ re̥sponse:${response.data[0]}");
      
      for (final element in response.data) {
      var a= Cd.fromJson(element);
        list.add(a);
      }
    return list;
    } on DioException catch (e, s) {
       Get.showSnackbar(
      GetSnackBar(
        title: "Error",
        message: e.message,
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 3),
      ),
    );
      log('', error: e, stackTrace: s);
      rethrow;
    }
  }
}
