import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/src/presentation/blocs/login/login_bloc.dart';
import 'package:taxi_app/src/presentation/views/login/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        title: 'Taxi App',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
