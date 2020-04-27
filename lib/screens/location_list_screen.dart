import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps/bloc/bloc.dart';
import 'package:gps/widgets/widgets.dart';

class LocationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Your Location'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: BlocBuilder<LocationBloc, LocationState>(
                // ignore: missing_return
                builder: (context, locationState) {
                  if (locationState is LocationEmpty) {
                    return buildCenter();
                  }
                  if (locationState is LocationTrackingInProgress) {
                    return ListView.builder(
                      itemCount: locationState.positions?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LocationListCard(
                          position: locationState.positions[index],
                        );
                      },
                    );
                  }
                  if (locationState is LocationTrackingStopped) {
                    return ListView.builder(
                      itemCount: locationState.positions?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LocationListCard(
                          position: locationState.positions[index],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ActionWidget(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: TypewriterAnimatedTextKit(
        text: ['Press Play Button To Start Tracking..'],
        textStyle: TextStyle(
          fontSize: 18.0,
        ),
        totalRepeatCount: 1000,
        speed: Duration(milliseconds: 150),
      ),
    );
  }
}
