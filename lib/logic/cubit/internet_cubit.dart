import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_learn_1/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<List<ConnectivityResult>> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        print('Connectivity Result: $connectivityResult'); // Debug print
        if (connectivityResult == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.wifi);
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.mobile);
        } else if (connectivityResult == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      },
    );
  }

  void emitInternetConnected(ConnectionType connectionType) {
    print('Internet Connected: $connectionType'); // Debug print
    emit(InternetConnected(connectionType: connectionType));
  }

  void emitInternetDisconnected() {
    print('Internet Disconnected'); // Debug print
    emit(InternetDisonnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
