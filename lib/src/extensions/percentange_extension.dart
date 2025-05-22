part of 'package:responsive_addons/responsive_addons.dart';


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
  double get ph {
    final screenHeight = DeviceUtilityPack.height;
    return this * screenHeight / 100;
  }

  /// Converts the value to a percentage of the device's screen width.
  double get pw {
    final screenWidth = DeviceUtilityPack.width;
    return this * screenWidth / 100;
  }

  /// Converts the value to a percentage of the available height after `SafeArea`.
  double get sh {
    final safeHeight = DeviceUtilityPack.safeHeight;
    return this * safeHeight / 100;
  }

  /// Converts the value to a percentage of the available width after `SafeArea`.
  double get sw {
    final safeWidth = DeviceUtilityPack.safeWidth;
    return this * safeWidth / 100;
  }

  /// Converts the value to scalable pixels (sp), adjusting for pixel density and aspect ratio.
  double get sp {
    final screenHeight = DeviceUtilityPack.height;
    final screenWidth = DeviceUtilityPack.width;
    final pixelRatio = DeviceUtilityPack.pixelRatio;
    final aspectRatio = DeviceUtilityPack.aspectRatio;

    return this * (((screenHeight + screenWidth) + (pixelRatio * aspectRatio)) / 2.08) / 100;
  }

  /// Converts the value to scalable pixels (spa) with an alternate formula.
  double get spa {
    final screenHeight = DeviceUtilityPack.height;
    final screenWidth = DeviceUtilityPack.width;
    final aspectRatio = DeviceUtilityPack.aspectRatio;

    return this * (((screenHeight + screenWidth) + (240 * aspectRatio)) / 2.08) / 100;
  }

  /// Converts the value to density-independent pixels (dp) for consistent sizing across devices.
  double get dp {
    final screenWidth = DeviceUtilityPack.width;
    final pixelRatio = DeviceUtilityPack.pixelRatio;

    return this * (screenWidth * 160) / pixelRatio;
  }

  /// Converts the value to a percentage of the viewport's smaller dimension (height/width).
  double get vmin {
    final screenHeight = DeviceUtilityPack.height;
    final screenWidth = DeviceUtilityPack.width;
    return this * min(screenHeight, screenWidth) / 100;
  }

  /// Converts the value to a percentage of the viewport's larger dimension (height/width).
  double get vmax {
    final screenHeight = DeviceUtilityPack.height;
    final screenWidth = DeviceUtilityPack.width;
    return this * max(screenHeight, screenWidth) / 100;
  }

  /// Converts the value to a responsive radius (r), based on screen width.
  double get r {
    final screenWidth = DeviceUtilityPack.width;
    return this * screenWidth / 100;
  }
}
