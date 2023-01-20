import 'package:flutter/material.dart';
import 'package:my_app/Modal/Services/states_services.dart';
import 'package:shimmer/shimmer.dart';

import 'CountriesDetailScreen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: ((value) {
                  setState(() {});
                }),
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: " Search Countries",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: stateServices.CountriesApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String countriesname =
                                snapshot.data![index]['country'];
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Countriesdetails(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayRecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text("Effected: " +
                                          snapshot.data![index]['cases']
                                              .toString()),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            } else if (countriesname.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Countriesdetails(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayRecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]["country"]),
                                      subtitle: Text(snapshot.data![index]
                                              ["cases"]
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ["countryInfo"]["flag"])),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      }
                    }))
          ],
        )));
  }
}
