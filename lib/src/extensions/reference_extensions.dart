part of 'package:responsive_addons/responsive_addons.dart';

/// Provides `.w`, `.h`, `.ts` (text scale), and layout helpers on `num`.
extension ResponsiveScale on num {
  /// Responsive width (based on screen width or design frame)
  double get dw => _safe(() => _DesignScale.instance.setWidth(this));

  /// Responsive height (based on screen height or design frame)
  double get dh => _safe(() => _DesignScale.instance.setHeight(this));

  /// Responsive text size (uses min of width/height scaling)
  double get dt => _safe(() => _DesignScale.instance.setFont(this));

  /// Responsive scale (min of w and h)
  double get rs => min(dw, dh);

  /// Horizontal spacing using SizedBox
  SizedBox get hspace => SizedBox(width: dw);

  /// Vertical spacing using SizedBox
  SizedBox get vspace => SizedBox(height: dh);

  // square box
  SizedBox get s => SizedBox(width: dw, height: dh);

  T _safe<T>(T Function() compute) {
    try {
      return compute();
    } catch (e) {
      debugPrint('ResponsiveScale error: $e');
      rethrow;
    }
  }
}
