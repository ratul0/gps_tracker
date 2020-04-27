import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object> get props => [];
}

class LocationEmpty extends LocationState {}

class LocationTrackingInProgress extends LocationState {
  final List<Position> positions;

  const LocationTrackingInProgress({this.positions});

  @override
  List<Object> get props => [positions];
}

class LocationTrackingStopped extends LocationState {
  final List<Position> positions;

  const LocationTrackingStopped({this.positions});

  @override
  List<Object> get props => [positions];
}
