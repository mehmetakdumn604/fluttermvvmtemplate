import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/caching/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_route.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/provider_setup_consts.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/view/test/controller/test_controller.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleDbManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstans.LANG_ASSET_PATH,
      child: MultiProvider(
        providers: ProviderSetupConsts.instance.singleItems,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final TestController data = context.watch();
    return MaterialApp(
      title: AppConstans.APP_NAME,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      key: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      builder: NavigationRoute.instance.rootBuilder(data.isLoading),
    );
  }
}

