import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps/screens/location_list_screen.dart';
import 'package:gps/services/services.dart';
import 'bloc/bloc.dart';

void main() {
  final LocationService locationService = LocationService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(
            locationService: locationService,
          ),
        ),
      ],
      child: GPSApp(),
    ),
  );
}

class GPSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GPS App",
      home: LocationListScreen(),
    );
  }
}
