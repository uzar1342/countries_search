import 'dart:developer';

import 'package:countries_search/mvc/model/cd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class CountrieDetail extends StatelessWidget {

  const CountrieDetail({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Cd detail = Get.arguments;
    log(detail.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countrie Details'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            width:   MediaQuery.of(context).size.width
              ,child: Image.network(detail.flags!.png)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(top:  8.0 ,bottom: 8),
                           child: Text(
                                  detail.name!.official,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                         ),

                               Text(
                                "Capital : ${detail.capital}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                               Text(
                                "Population : ${detail.population}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                                 Text(
                                "region : ${detail.region}",
                                style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                               Text(
                                "sub region : ${detail.subregion}",
                                style: TextStyle(
                                   fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
           ,
           Container(
            width: MediaQuery.of(context).size.width*0.4,
            child: Image.network(detail.coatOfArms!.png))
          ],
        ),
      ),
    );
  }
}