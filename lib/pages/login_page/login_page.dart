import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../store/loading_state/loading_state.dart';

class LoginPage extends HookWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  /*final loginState = LoginState();
  final loadingState = LoadingState();
  final phoneNumberController = TextEditingController();*/

  @override
  Widget build(BuildContext context) {
    final loadingState = useRef(LoadingState()).value;

    return Scaffold(
      body: Column(
        children: [
          Observer(
            builder: (_) => loadingState.isLoading
                ? const CircularProgressIndicator()
                : const SizedBox(),
          ),
          ElevatedButton(
            onPressed: () {
              if (loadingState.isLoading) {
                loadingState.stopLoading();
              } else {
                loadingState.startLoading();
              }
            },
            child: const Text('Action'),
          ),
        ],
      ),
    );
  }
}
