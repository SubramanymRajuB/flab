import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class CounterStore  = Counter with _$CounterStore;

abstract class Counter with Store{
  @observable
  int counter = 0;

  @action
  void increment(){
    counter++;
  }
}

class ClassWihtoutStore{
    Observable counter = new Observable(0);
    Action increment;
    ClassWihtoutStore()
    {
      increment = Action((){
        counter.value++;
      });
    }
}