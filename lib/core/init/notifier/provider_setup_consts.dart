import 'package:fluttermvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/view/test/controller/test_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderSetupConsts {
  static ProviderSetupConsts? _instance;

  static ProviderSetupConsts get instance {
    _instance ??= ProviderSetupConsts._init();
    return _instance!;
  }

  ProviderSetupConsts._init();

  List<SingleChildWidget> singleItems = [
   ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
   ChangeNotifierProvider<TestController>(create: (_) => TestController()),
   Provider.value(value: NavigationService.instance),
  ];
}
