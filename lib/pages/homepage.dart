import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mvc/controller/countries_search_controller.dart';
import '../mvc/model/cd.dart';
import '../mvc/view/countries_search_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controler = Get.find<CountriesSearchController>();
    final _searchController = TextEditingController();
    var search = false.obs;
    var list = ["Africa", "Asia", "Europe", 
"America", "Oceania"];
    return Obx(
      () => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: ()=>{
            controler.onInit()
          },child: Icon(Icons.refresh),),
          appBar: AppBar(
            title: !search.value ? Text("Countries by Continents") : Container(),
            flexibleSpace: search.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Add padding around the search bar
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // Use a Material design s)earch bar
                      child: TextField(
                        onChanged: (value) => {
                          controler.sc = controler.li
                              .where((e) =>
                                  e.name!.official.toLowerCase().contains(value))
                              .toList(),
                          controler.update()
                        },
                        controller: _searchController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => search.value = !search.value,
                          ),
                          // Add a search icon or button to the search bar
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            elevation: 5,
            actions: [
              !search.value
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () => {search.value = true},
                          child: Icon(Icons.search)),
                    )
                  : Container()
            ],
          ),
          body: !search.value
              ? controler.check.value
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ContinentCard(
                                    index,
                                    getlist(controler.li, list[index]),
                                    list[index]),
                              ],
                            );
                          }),
                    )
                  : Center(child: CircularProgressIndicator())
              : Container(
                  child: CountriesSearchPage(),
                ),
        ),
      ),
    );
  }
}

Widget ContinentCard(int index, List<Cd> list, String name) {
  var card = false.obs;
  return Obx(() => Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () => card.value = !card.value,
                      child: card.value
                          ? Icon(Icons.arrow_downward)
                          : Icon(Icons.arrow_right))
                ],
              ),
            ),
          ),
          card.value ? CountrieCard(list) : Container(),
        ],
      ));
}

ListView CountrieCard(List<Cd> list) {
  return ListView.builder(
      itemCount: list.length,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.network(
                      list[index].flags!.png,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ${list[index].name!.official.length  > 15 ? list[index].name!.official.substring(0, 15)+'...' : list[index].name!.official }",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Capital : ${list[index].capital}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Population : ${list[index].population} ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                ),
                InkWell( onTap: () {
                  Get.toNamed('/countriedetail',arguments: list[index]);
                },  child: Icon(Icons.arrow_right))
              ],
            ),
          ),
        );
      });
}

List<Cd> getlist(List<Cd> value, continents) {
  List<Cd> countrie =
      value.where((c) => c.continents.toString().toLowerCase().contains(continents.toString().toLowerCase())).toList();

  return countrie;
}
