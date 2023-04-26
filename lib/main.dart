import 'package:cashless/provider/register_form_provider.dart';
import 'package:cashless/routes/router.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:cashless/services/dial_service.dart';
import 'package:cashless/services/local_storage.dart';
import 'package:cashless/services/navigator.dart';
import 'package:cashless/views/layout/auth_layout.dart';
import 'package:cashless/views/layout/sistema_layout.dart';
import 'package:cashless/views/layout/splash_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          lazy: false, create: (_) => RegisterFromProvider()),
      ChangeNotifierProvider(lazy: false, create: (_) => AuthService()),
      ChangeNotifierProvider(lazy: false, create: (_) => Dial()),
    ], child: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: navigationService.navigatorKey,
      initialRoute: Flurorouter.rootRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('es')],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Flurorouter.router.generator,
      builder: ((_, child) {
        final authProvider = Provider.of<AuthService>(context);
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) {
              return authProvider.estadoSistemaStatus ==
                                EstadoSistema.isClosed ||
                            authProvider.estadoSistemaStatus ==
                                EstadoSistema.isMaintenance ||
                            authProvider.estadoSistemaStatus ==
                                EstadoSistema.noUpdate ||
                            authProvider.estadoSistemaStatus ==
                                EstadoSistema.restringido
                        ? const SistemaEstadoLayout()
                        :  authProvider.authStatus == AuthStatus.checking
                  ? SplashLayout(
                      child: child!,
                    )
                  : AuthLayout(child: child!);
            })
          ],
        );
      }),
    );
  }
}
