import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamma_test/config/theme.dart';
import 'package:gamma_test/logic/movies_cubit.dart';
import 'package:gamma_test/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //locking the orientation to portrait as there is currently no design for landscape mode.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Gamma Test',
        theme: appTheme,
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
