import 'package:flutter_web/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Function(T) onModelReady;

  BaseWidget({Key key, this.model, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
