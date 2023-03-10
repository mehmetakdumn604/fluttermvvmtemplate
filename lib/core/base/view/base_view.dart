import 'package:flutter/src/widgets/framework.dart';

class BaseView<T> extends StatefulWidget {
  const BaseView({Key? key, required this.onPageBuilder, required this.viewModel, this.onModelReady, this.onDispose}) : super(key: key);

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
