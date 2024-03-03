part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  late final Position position;

  FetchWeather(this.position);

  List<Object> get props => [position];
}