part of 'package:responsive_addons/responsive_addons.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;

  const BaseScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MainLayout(main: child);
  }
}
