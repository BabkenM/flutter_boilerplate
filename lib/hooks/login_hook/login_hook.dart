import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../store/login_state/login_state.dart';

class _LoginStateHookCreator {
  const _LoginStateHookCreator();

  LoginState call({
    List<Object?>? keys,
    required Function(String) callback,
  }) {
    return use(_LoginStateHook(callback, keys));
  }
}

const useLoginState = _LoginStateHookCreator();

class _LoginStateHook extends Hook<LoginState> {
  const _LoginStateHook(
      this.callback, [
        List<Object?>? keys,
      ]) : super(keys: keys);
  final Function(String) callback;
  @override
  _LoginStateHookState createState() {
    return _LoginStateHookState();
  }
}

class _LoginStateHookState
    extends HookState<LoginState, _LoginStateHook> {
  final _loginState = LoginState();

  @override
  void initHook() {
    super.initHook();

  }

  @override
  LoginState build(BuildContext context) => _loginState;

  @override
  String get debugLabel => 'useLoginState';
}