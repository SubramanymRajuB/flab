import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'weather_model.dart';
import 'weather_repo.dart';

class WeatherEvent extends Equatable{

  WeatherEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FetchWeather extends WeatherEvent{
  final _city;

  FetchWeather(this._city);

  @override
  // TODO: implement props
  List<Object> get props => [_city];
}

class ResetWeather extends WeatherEvent{

}

class WeatherState extends Equatable{
  WeatherState();
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WeatherIsNotSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState{

}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{

  WeatherRepo weatherRepo;

  @override
  // TODO: implement initialState
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchWeather){
      yield WeatherIsLoading();

      try{
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
      }catch(_){
        print(_);
        yield WeatherIsNotLoaded();
      }
    }else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }

}