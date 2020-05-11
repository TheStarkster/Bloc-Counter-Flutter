import 'dart:async';
import 'package:bloc_counter_app/bloc/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  //the setup for output...
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inInc => _counterStateController.sink;
  Stream<int> get outInc => _counterStateController.stream;

  //the setup for input...
  final _counterEventSink = StreamController<CounterEvent>();
  Sink<CounterEvent> get inCounter => _counterEventSink.sink;

  // CounterBloc() {
  //   _counterEventSink.stream.listen(_mapEventToState);
  // }
  void mapEventToState(CounterEvent counterEvent) {
    if (counterEvent is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inInc.add(_counter);
  }

  void dispose() {
    _counterEventSink.close();
    _counterStateController.close();
  }
}
