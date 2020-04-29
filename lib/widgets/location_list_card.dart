import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:jiffy/jiffy.dart';

class LocationListCard extends StatelessWidget {
  final Position position;
  LocationListCard({this.position});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Latitude: ${position.latitude}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                'Longitude: ${position.longitude}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                '${DateTimeFormat.format(position.timestamp, format: 'D, M j, H:i:s:v:u')}',
//                '${Jiffy(position.timestamp.add(Duration(hours: 2))).Hms}',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ));
  }
}
