import 'package:flutter/material.dart';

import 'ReuseableRow.dart';

class Countriesdetails extends StatefulWidget {
  String image, name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  Countriesdetails({
    super.key,
    required this.image,
    required this.name,
    required this.active,
    required this.critical,
    required this.test,
    required this.todayRecovered,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.totalCases,
  });

  @override
  State<Countriesdetails> createState() => _CountriesdetailsState();
}

class _CountriesdetailsState extends State<Countriesdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      ReuseableRow(
                          title: "Total Cases",
                          values: widget.totalCases.toString()),
                      ReuseableRow(
                          title: "Deaths",
                          values: widget.totalDeaths.toString()),
                      ReuseableRow(
                          title: "Total Recovered",
                          values: widget.totalRecovered.toString()),
                      ReuseableRow(
                          title: "Active", values: widget.active.toString()),
                      ReuseableRow(
                          title: "Critical",
                          values: widget.critical.toString()),
                      ReuseableRow(
                          title: "Today Deaths",
                          values: widget.totalDeaths.toString()),
                      ReuseableRow(
                          title: "Today Recovered",
                          values: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}
