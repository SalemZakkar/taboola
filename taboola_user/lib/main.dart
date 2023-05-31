import 'package:flutter/material.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/localization/language.dart';
import 'package:taboola_user/managment/main_provider.dart';
import '/routes.dart';
import 'constants/app_theme.dart';
import 'local_storage/shared_prefernce_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Language language = Language();
String activeLanguage = language.getLanguage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.getInstance();
  activeTheme = themes.getActiveTheme();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataBaseProvider()),
    ],
    child: const MainApp(),
  ));
}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    themes.activeTheme.listen((event) {
      setState(() {
        activeTheme = event;
      });
      debugPrint(
          "Switch Dark Mode to $event --------------------------------------------------------------------------\n\n\n");
    });
    language.lang.listen((event) {
      setState(() {
        activeLanguage = event;
      });
      debugPrint("set language to $activeLanguage"
          "--------------------------------------------------------------------\n\n\n");
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: activeTheme,
        onGenerateRoute: Routes.getRoutes,
        navigatorKey: navigatorKey,
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale.fromSubtags(languageCode: activeLanguage),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        initialRoute: Routes.splashScreen,
        builder: (context, child) => child!);
  }
}
