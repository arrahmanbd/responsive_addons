part of 'package:responsive_addons/responsive_addons.dart';

enum ScreenSize { xs, sm, md, lg, xl }

ScreenSize getScreenSize(double width) {
  if (width < 576) return ScreenSize.xs;
  if (width < 768) return ScreenSize.sm;
  if (width < 992) return ScreenSize.md;
  if (width < 1200) return ScreenSize.lg;
  return ScreenSize.xl;
}
