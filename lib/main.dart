import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        //TRADUCAO DO DATE PICKER
        localizationsDelegates: const [
//...app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        //LINGUAS SUPORTADAS
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('pt', 'PT'),
          const Locale('pt', 'BR'),
          const Locale('es', 'ES'),
        ],
        //home: HomePage());
        initialRoute: '/',
        routes: getApplicationRoutes(),
        //Quando nao tem uma pagina
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => AlertPage());
        });
  }
}
