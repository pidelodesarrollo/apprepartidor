import 'package:negocioapp/src/blocs2/login2_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:clienteapp/src/blocs/login_bloc.dart';
export 'package:negocioapp/src/blocs2/login2_bloc.dart';

class ProviderBloc2 extends InheritedWidget {
  static ProviderBloc2 _instancia;

  factory ProviderBloc2({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderBloc2._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderBloc2._internal({Key key, Widget child})
      : super(key: key, child: child);

  final loginBloc = LoginBloc2();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc2 of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderBloc2>()
        .loginBloc;
  }
}
