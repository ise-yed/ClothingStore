import 'package:clothingstore/components/themes.dart';
import 'package:clothingstore/screens/home/bloc/home_bloc.dart';
import 'package:clothingstore/screens/product/bloc/product_bloc.dart';
import 'package:clothingstore/screens/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ValueNotifier<bool> isLogin = ValueNotifier(false);
late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  if (prefs.getString('token') != null) {
    isLogin.value = true;
  }
  runApp(
    
    MultiBlocProvider(
    providers: [
    BlocProvider(
      create: (context) => HomeBloc(),
    ),
    BlocProvider(
      create: (context) => ProductBloc(),
    ),
    ],
    child:
     const MyApp(),
  )
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // English
      ],
      locale: const Locale('fa', 'IR'),
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: const RootScreen(),
    );
  }
}
