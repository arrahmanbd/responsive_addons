part of 'package:responsive_addons/responsive_addons.dart';

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final double gutter;

  const ResponsiveRow({required this.children, this.gutter = 16, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: gutter,
      runSpacing: gutter,
      children: children,
    );
  }
}
