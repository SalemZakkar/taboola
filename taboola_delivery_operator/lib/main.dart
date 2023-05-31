import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tabola_capten/main_sdk/utils/localization/localization.dart';
import '/routes.dart';
import 'constants/app_theme.dart';
import '/local_storage/shared_prefernce_services.dart';
import '/managment/main_provider.dart';
import 'generated/l10n.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await LocalStorageService.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataBaseProvider()),
    ],
    child: MainApp() ,
  )
  );
}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeData activeTheme = themes.getActiveTheme();
  @override
  Widget build(BuildContext context) {
    themes.activeTheme.listen((event) {
      setState(() {
        activeTheme = event;
      });
    });
    String activeLanguage = localize.getLanguage();
    localize.lang.listen((value) {
      setState(() {
       activeLanguage = value;
      });
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: activeTheme,
        onGenerateRoute: Routes.getRoutes,
        navigatorKey: navigatorKey,
        initialRoute:(LocalStorageService().isLoggedIn ?? false)? Routes.main:Routes.loginCapten,
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale.fromSubtags(languageCode: activeLanguage),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        builder: (context, child) => child!
    );
  }
}

