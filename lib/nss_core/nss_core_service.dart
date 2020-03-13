import 'dart:async';

import 'package:nss_core/nss_core.dart';
import 'package:rxdart/rxdart.dart';

class NssCoreService {
  static final NssCoreService _singleton = new NssCoreService._internal();

  // events
  final List<StreamSubscription> _subscription = List<StreamSubscription>();
  final _asaLoadComplete = new BehaviorSubject<bool>(seedValue: false);

  NssCore _nssCore;

  factory NssCoreService() {
    return _singleton;
  }

  NssCoreService._internal() {
    _nssCore = new NssCore();

    _subscription.add(_nssCore.events.on<UserEvent>().listen((UserEvent event) {
      print('main.UserEvent');
      print(event);
    }));

    _subscription.add(_nssCore.events.on<NssEvent>().listen((NssEvent event) {
      print('main.NssEvent');

      print('Current value' + _asaLoadComplete.value.toString());
      _asaLoadComplete.sink.add(true);
    }));
  }

  NssCore get nssCore {
    return _nssCore;
  }

  ValueObservable<bool> get asaLoadComplete => _asaLoadComplete.stream;

  dispose() {
    _asaLoadComplete.close();
  }
}
