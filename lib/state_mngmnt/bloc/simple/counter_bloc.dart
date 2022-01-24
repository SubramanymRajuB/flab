import 'package:bloc/bloc.dart';

abstract class CounterEvents {}

class Increment extends CounterEvents {}

class Decrement extends CounterEvents {}

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }

/* --Old way--*/
//@override
//   Stream<int> mapEventToState(CounterEvents event) async*{
//     switch(event){
//       case CounterEvents.increment:
//         yield state + 1;
//         break;
//       case CounterEvents.decrement:
//         yield state - 1;
//         break;
//     }
//   }
}
