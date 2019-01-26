import 'package:flutter/widgets.dart';

abstract class StateChangeHandler {
  void didChangeAppLifecycleState(AppLifecycleState state);
}

class AppLifecycleHelper<T extends StateChangeHandler> extends StatefulWidget {
  final T vm;

  final Widget child;

  const AppLifecycleHelper({
    Key key,
    @required this.vm,
    @required this.child
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppLifecycleHelperState();
  }
}

class AppLifecycleHelperState extends State<AppLifecycleHelper> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.vm.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}