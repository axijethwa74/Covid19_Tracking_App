import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_app/Constraint.dart';
import 'package:my_app/Modal/Services/world_states_modal.dart';
import 'package:pie_chart/pie_chart.dart';

import 'Modal/Services/states_services.dart';
import 'ReuseableRow.dart';

class StatesDashboard extends StatefulWidget {
  const StatesDashboard({super.key});

  @override
  State<StatesDashboard> createState() => _StatesDashboardState();
}

class _StatesDashboardState extends State<StatesDashboard>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              FutureBuilder(
                future: stateServices.fetchWorldApi(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases!.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered!.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths!.toString()),
                          },
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: ColorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                    title: "Total Cases",
                                    values: snapshot.data!.cases.toString()),
                                ReuseableRow(
                                    title: "Deaths",
                                    values: snapshot.data!.cases.toString()),
                                ReuseableRow(
                                    title: "Recovered",
                                    values:
                                        snapshot.data!.recovered.toString()),
                                ReuseableRow(
                                    title: "Active",
                                    values: snapshot.data!.active.toString()),
                                ReuseableRow(
                                    title: "Critical",
                                    values: snapshot.data!.critical.toString()),
                                ReuseableRow(
                                    title: "Today Deaths",
                                    values:
                                        snapshot.data!.todayDeaths.toString()),
                                ReuseableRow(
                                    title: "Today Recovered",
                                    values:
                                        snapshot.data!.todayDeaths.toString()),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff1aa260),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Track Countries")),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
