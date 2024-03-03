import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

import '../screens/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.altitude,
            event.position.longitude
        );
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }

    });
  }
}