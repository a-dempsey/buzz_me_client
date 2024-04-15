import 'package:buzz_me/components/available_routes.dart';
import 'package:buzz_me/components/dropdown_menu.dart';
import 'package:buzz_me/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/selection_modal.dart';
import '../routes/get_routes.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});
  static bool isAvailable = false;
  static bool showRoutes = false;
  static String dest = "";
  static List<String> destinations = [];
  static List<String> times = [];
  static int len = 0;

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  bool noRoutes = false;
  final Map<String, List<dynamic>> routes = {};
  final Map<String, List<dynamic>> times = {};
  String time = "";
  static List<String> test = [];
  static List<String> arrivalTimes = [];


  @override
  void initState(){
    super.initState();
    getRoutes(
      onFailureCallback: () {
        print("ERR: didn'/t get routes");
      },
      onSuccessCallback: (Map<String, List<dynamic>> routesList, timeList) {
        for (var key in routesList.keys) {
            if(!routes.containsKey(key)) {
              routes[key] = [];
            }
            if (routes.containsKey(key)) {
              routes[key]?.add(routesList[key]);
            }
        }
        for (var key in timeList.keys) {
          if(!times.containsKey(key)) {
            times[key] = [];
          }
          if (times.containsKey(key)) {
            times[key]?.add(timeList[key]);
          }
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -6), // negative offset to apply shadow at top
                  ),
                ],
              ),
            ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                    'Access route information',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    'Search by stop name',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 13.5),
                  const SizedBox(
                    height: 50,
                    child: LocationSearchBar()
                  ),
                  const SizedBox(height: 13.5),
                  const SizedBox(
                      height: 50,
                      child: RouteDropdown()
                  ),
                 const SizedBox(height: 13.5),
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: FloatingActionButton(
                      elevation: 1,
                      backgroundColor: Colors.pink[300]!.withOpacity(0.8),
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.pink[100]!.withOpacity(0.7),),borderRadius: BorderRadius.circular(16)),
                      onPressed: () {
                        setState(() {
                          List<String> vals = [];
                          List<String> temp = [];
                          List<String> paths = [];
                          if(routes.containsKey(LocationSearchBar.currentKey)){
                            routes.forEach((key, val){
                                 for(var item in val){
                                    for(var subitem in item){
                                      if(subitem is List){
                                        if(key == LocationSearchBar.currentKey) {
                                          paths = [subitem.last];
                                          temp.add(subitem.last);
                                          TimetableScreen.destinations = temp;
                                          TimetableScreen.len = 2;
                                        }} else {
                                        if(key == LocationSearchBar.currentKey){
                                          paths = val.last.cast<String>();
                                          vals = [val.last.last];
                                          TimetableScreen.destinations = vals;
                                          TimetableScreen.len = vals.length;}
                                      }}
                            if(key == LocationSearchBar.currentKey){
                              for(int i = 0; i <= 1; i++){
                                for(var item in times[LocationSearchBar.currentKey]!){
                                  if(key == LocationSearchBar.currentKey)
                                    {if(item is List){
                                      for(var subitem in item){
                                        print(subitem);
                                        item = subitem;
                                    }
                                  } else {
                                      item = item;
                                    }}
                                List<int> pre = [];
                                if(item is List){
                                  for(i = 0; i < item.length; i ++){
                                     pre += [item[i]];
                                  }
                                }else{ pre = [item];}

                                for(int i = 0; i < pre.length; i ++){
                                  int t = pre[i];
                                  if(key == LocationSearchBar.currentKey){

                              final hours = t ~/ 3600;
                              final r = t % 3600;
                              final mins = r ~/ 60;
                              if(mins >= 0 && mins< 10) {
                                time = "$hours:0$mins";
                              } else if(hours >= 0 && hours < 10) {
                                time = "0$hours:$mins";
                              } else if((hours >= 0 && mins >= 0) && (hours < 10 && mins < 10)) {
                                time = "0$hours:0$mins";
                              }
                              SelectionModal.time = time;
                              TimetableScreen.times.add(time);
                              if(i == 1){
                                arrivalTimes += [time];
                              }else{
                              arrivalTimes = [time];}}
                            }
                            if(!paths.contains(RouteDropdown.selectedValue)){
                              noRoutes = true;
                              TimetableScreen.isAvailable = false;
                              TimetableScreen.showRoutes = false;
                            }
                            if(LocationSearchBar.currentKey.isNotEmpty && RouteDropdown.selectedValue != "" && paths.contains(RouteDropdown.selectedValue)){
                              TimetableScreen.isAvailable = true;
                              TimetableScreen.showRoutes = true;
                              noRoutes = false;
                              TimetableScreen.dest = RouteDropdown.selectedValue;
                              SelectionModal.from = "${LocationSearchBar.currentKey} -> ${RouteDropdown.selectedValue}";
                              test = [RouteDropdown.selectedValue];
                              TimetableScreen.len = 1;
                            }
                            if(LocationSearchBar.currentKey.isNotEmpty && RouteDropdown.selectedValue == "" ||  RouteDropdown.selectedValue == "-- unselect destination --"){
                              TimetableScreen.isAvailable = true;
                              TimetableScreen.showRoutes = true;
                              noRoutes = false;
                              test = TimetableScreen.destinations;
                              SelectionModal.from = "${LocationSearchBar.currentKey} -> ${TimetableScreen.destinations[0]}";
                            }}}}}});
                            print(test);
                            print(arrivalTimes);
                            print("ERR CHECKING");
                          } else {
                            noRoutes = true;
                          }
                      },);},
                      child: const Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  if(TimetableScreen.showRoutes)
                    const Text(
                      'Available routes',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto-Medium',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: 13.5),
                  if(noRoutes)
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'There are no routes available at this time',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto-Medium',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  if(TimetableScreen.isAvailable)
                    Material(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 22,
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.pink[100]?.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.red.shade100,
                        ),
                        borderRadius: const BorderRadius.all(Radius
                            .circular(16)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AvailableRoutes(to: test, time: arrivalTimes),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
