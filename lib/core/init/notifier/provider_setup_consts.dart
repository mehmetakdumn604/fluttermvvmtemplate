import 'package:provider/single_child_widget.dart';

class ProviderSetupConsts {
  static ProviderSetupConsts? _instance;

  static ProviderSetupConsts get instance {
    _instance ??= ProviderSetupConsts._init();
    return _instance!;
  }

  ProviderSetupConsts._init();

  List<SingleChildWidget> singleItems = [
//todo remove this before project run
    // ChangeNotifierProvider<ProviderData>(create: (_) => ProviderData()),
  ];
}
