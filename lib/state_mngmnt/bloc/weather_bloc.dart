import 'package:bloc/bloc.dart';

import 'weather_model.dart';
import 'weather_repo.dart';

//Events
class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final city;

  FetchWeather(this.city);
}

class ResetWeather extends WeatherEvent {}

//States
class WeatherState {}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;
}

class WeatherIsNotLoaded extends WeatherState {}

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   WeatherRepo weatherRepo;

//   @override
//   WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {
//     on<FetchWeather>((event, emit) async {
//       emit(WeatherIsLoading());
//       try {
//         WeatherModel weather = await weatherRepo.getWeather(event._city);
//         emit(WeatherIsLoaded(weather));
//       } catch (_) {
//         print(_);
//         emit(WeatherIsNotLoaded());
//       }
//     });
//     on<ResetWeather>((event, emit) => emit(WeatherIsNotSearched()));
//   }

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepo weatherRepo;

  @override
  WeatherCubit(this.weatherRepo) : super(WeatherIsNotSearched());

  void fetchWeather(String city) async {
    emit(WeatherIsLoading());
    try {
      WeatherModel weather = await weatherRepo.getWeather(city);
      emit(WeatherIsLoaded(weather));
    } catch (_) {
      print(_);
      emit(WeatherIsNotLoaded());
    }
  }

  void resetWeather() async {
    emit(WeatherIsNotSearched());
  }

//OLD WAY
  // @override
  // Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
  //   if (event is FetchWeather) {
  //     yield WeatherIsLoading();

  //     try {
  //       WeatherModel weather = await weatherRepo.getWeather(event._city);
  //       yield WeatherIsLoaded(weather);
  //     } catch (_) {
  //       print(_);
  //       yield WeatherIsNotLoaded();
  //     }
  //   } else if (event is ResetWeather) {
  //     yield WeatherIsNotSearched();
  //   }
  // }
}
