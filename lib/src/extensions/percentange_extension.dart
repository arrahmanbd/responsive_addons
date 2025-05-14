part of 'package:responsive_addons/responsive_addons.dart';

enum Mode { percent, absolute, design }

class AdaptiveConfig {
  static Mode mode = Mode.percent;
}

/// Extension for converting units and handling responsive sizing based on device dimensions.
extension ResponsiveSpacing on num {
  /// Converts the value to centimeters (cm).
  double get cm => this * 37.8;

  /// Converts the value to millimeters (mm).
  double get mm => this * 3.78;

  /// Converts the value to quarter-millimeters (Q).
  double get Q => this * 0.945;

  /// Converts the value to inches (in).
  double get inches => this * 96;

  /// Converts the value to picas (pc), where 1 pica = 1/6 inch.
  double get pc => this * 16;

  /// Converts the value to points (pt), where 1 pt = 1/72 inch.
  double get pt => this * inches / 72;

  /// Converts the value to pixels (px). Default unit.
  double get px => toDouble();

  /// Converts the value to a percentage of the device's screen height.
  double get ph => this * DeviceUtilityPack.height / 100;

  /// Converts the value to a percentage of the device's screen width.
  /// To convert Px like  16.px width ➝ (16 / 360) * 100 = 4.44.w
  double get pw => this * DeviceUtilityPack.width / 100;

  /// Converts the value to a percentage of the available height after `SafeArea`.
  double get sh => this * DeviceUtilityPack.safeHeight / 100;

  /// Converts the value to a percentage of the available width after `SafeArea`.
  double get sw => this * DeviceUtilityPack.safeWidth / 100;

  /// Converts the value to scalable pixels (sp), adjusting for pixel density and aspect ratio.
  double get sp =>
      this *
      (((ph + pw) +
              (DeviceUtilityPack.pixelRatio * DeviceUtilityPack.aspectRatio)) /
          2.08) /
      100;

  /// Converts the value to scalable pixels (spa) with an alternate formula.
  double get spa =>
      this * (((ph + pw) + (240 * DeviceUtilityPack.aspectRatio)) / 2.08) / 100;

  /// Converts the value to density-independent pixels (dp) for consistent sizing across devices.
  double get dp => this * (pw * 160) / DeviceUtilityPack.pixelRatio;

  /// Converts the value to a percentage of the viewport's smaller dimension (height/width).
  double get vmin =>
      this * min(DeviceUtilityPack.height, DeviceUtilityPack.width) / 100;

  /// Converts the value to a percentage of the viewport's larger dimension (height/width).
  double get vmax =>
      this * max(DeviceUtilityPack.height, DeviceUtilityPack.width) / 100;

  /// Converts the value to a responsive radius (r), based on screen width.
  double get r => this * DeviceUtilityPack.width / 100;
}
