import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps/bloc/bloc.dart';
import 'package:gps/services/services.dart';

class ActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final locationBloc = BlocProvider.of<LocationBloc>(context);

    return BlocBuilder<LocationBloc, LocationState>(
      condition: (previousState, state) =>
          state.runtimeType != previousState.runtimeType,
      // ignore: missing_return
      builder: (context, locationState) {
        if (locationState is LocationEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: const CircleBorder(side: BorderSide.none),
                onPressed: () => locationBloc.add(
                  TrackingStarted(),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.green.shade900,
                ),
              ),
            ],
          );
        }
        if (locationState is LocationTrackingInProgress) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: const CircleBorder(side: BorderSide.none),
                onPressed: () => locationBloc.add(
                  Stopped(),
                ),
                child: Icon(
                  Icons.stop,
                  color: Colors.red,
                ),
              ),
              RaisedButton(
                shape: const CircleBorder(side: BorderSide.none),
                onPressed: () => locationBloc.add(
                  Reset(),
                ),
                child: Icon(
                  Icons.restore,
                  color: Colors.purple.shade900,
                ),
              ),
            ],
          );
        }
        if (locationState is LocationTrackingStopped) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: const CircleBorder(side: BorderSide.none),
                onPressed: () => locationBloc.add(
                  Reset(),
                ),
                child: Icon(
                  Icons.restore,
                  color: Colors.purple.shade900,
                ),
              ),
              RaisedButton(
                shape: const CircleBorder(side: BorderSide.none),
                onPressed: () => ShareService.share(
                    ShareService.jsonEncodePosition(locationState.positions)),
                child: Icon(
                  Icons.share,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
